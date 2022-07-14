//
//  NetworkDataFetcher.swift
//  FinalProject
//
//  Created by Александра Захаревич on 2.07.22.
//

import Foundation


//https://api.vk.com/method/users.get?user_ids=86032642&fields=bdate&access_token=vk1.a.QFLqNlbA6uy_CDg8UCly-f5ZGWg-8-lRu_vAPL_8uCmOK3XOfGVyECxRqZkibP0lFRZVmfPH0oo5-cNU-3onB6sNRdXXTKPAHpPW8U6K3kF5eO9C9jK5U6pLm-sZukfgKrwbMiAVuLenZ4GcU6UA64L_d2FhHrWKeQCvsbbIrW1zLRvPf3uKmRpj2hf6NLMY&v=5.131

protocol DataFetcher {
    func getFeed(nextBatchFrom: String?, response: @escaping (FeedResponse?) -> Void)
    func getUser(response: @escaping (UserResponse?) -> Void)
    func getFriends( response: @escaping (FriendsResponse?) -> Void)
    func getGroups( response: @escaping (GroupsResponse?) -> Void)
}

struct NetworkDataFetcher: DataFetcher {
    
    private let authService: AuthService
    let networking: Networking
    
    init(networking: Networking, authService: AuthService = SceneDelegate.shared().authService) {
        self.networking = networking
        self.authService = authService
    }
    
    func getUser(response: @escaping (UserResponse?) -> Void) {
        guard let userId = authService.userId else { return }
        let params = ["user_ids": userId, "fields": "photo_100"]
        networking.request(path: API.user, params: params) { (data, error) in
            if let error = error {
                print("Error received requesting data: \(error.localizedDescription)")
                response(nil)
            }
            
            let decoded = self.decodeJSON(type: UserResponseWrapped.self, from: data)
            response(decoded?.response.first)
        }
    }
    
    func getFeed(nextBatchFrom: String?, response: @escaping (FeedResponse?) -> Void) {
        
        var params = ["filters": "post, photo"]
        params["start_from"] = nextBatchFrom
        networking.request(path: API.newsFeed, params: params) { (data, error) in
            if let error = error {
                print("Error received requesting data: \(error.localizedDescription)")
                response(nil)
            }
            
            let decoded = self.decodeJSON(type: FeedResponseWrapped.self, from: data)
            response(decoded?.response)
        }
    }
    
    // запрос получения списка друзей
       func getFriends(response: @escaping (FriendsResponse?) -> Void) {

           var params = ["fields":  "photo_100"]
   //        params["start_from"] = nextBatchFrom
           networking.request(path: API.friends, params: params) { (data, error) in
               if let error = error {
                   print("Error received requesting data: \(error.localizedDescription)")
                   response(nil)
               }

               let decoded = self.decodeJSON(type: FriendsResponseWrapped.self, from: data)
               response(decoded?.response)
//               print(response)
           }
       }
    
    // запрос получения списка групп
       func getGroups(response: @escaping (GroupsResponse?) -> Void) {
//            let extended = "1"
           var params = ["extended": "1", "fields": "status"]
   //        params["start_from"] = nextBatchFrom
           networking.request(path: API.groups, params: params) { (data, error) in
               if let error = error {
                   print("Error received requesting data: \(error.localizedDescription)")
                   response(nil)
               }

               let decoded = self.decodeJSON(type: GroupsResponseWrapped.self, from: data)
               response(decoded?.response)
//               print(response)
           }
       }
    
    
    
    private func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let data = from, let response = try? decoder.decode(type.self, from: data) else { return nil }
        return response
    }

  
}
