//
//  NetworkManager.swift
//  FinalProject
//
//  Created by Александра Захаревич on 9.07.22.
//

import Foundation
import Moya
import Moya_ObjectMapper

class NetworkManager {
    static let provider = MoyaProvider<BackendAPI>(plugins: [NetworkLoggerPlugin()])
    
    static func getProfile(success: (([ProfileResponse]) ->())?, failure: (() -> ())? = nil) {
        provider.request(.getProfile) { result in
            switch result {
    
            case .success(let response):
                guard let result = try? response.mapArray(ProfileResponse.self, atKeyPath: "response")

                else {
                    failure?()
                    return
                }
                print("\(result.count)")
                print("Good ProfileResponse")
                success?(result)
            case .failure(_):
                print("Error")
                failure?()
            }
        }
    }
    
    static func getFriends(success: (([Friends]) ->())?, failure: (() -> ())? = nil) {
        provider.request(.getFriends) { result in
            switch result {
                
            case .success(let response):
                guard let result = try? response.mapObject(FriendResponse.self, atKeyPath: "response")
                        
                else {
                    failure?()
                    return
                }
                print("Good FriendResponse")
                success?(result.friendsItems)
            case .failure(_):
                print("Error")
                failure?()
            }
        }
    }
        
        static func getGroups(success: (([Groups]) ->())?, failure: (() -> ())? = nil) {
            provider.request(.getGroups) { result in
                switch result {
                    
                case .success(let response):
                    guard let result = try? response.mapObject(GroupResponse.self, atKeyPath: "response")
                            
                    else {
                        failure?()
                        return
                    }
                    print("Good GroupResponse")
                    success?(result.groupsItems)
                case .failure(_):
                    print("Error")
                    failure?()
                }
            }
    }
    
    static func getPhotos(success: (([PhotoResponse]) ->())?,  failure: (() -> ())? = nil) {
        provider.request(.getPhotos) { result in
            switch result {
                
            case .success(let response):
                guard let result = try? response.mapArray(PhotoResponse.self, atKeyPath: "response")
                        
                else {
                    failure?()
                    return
                }
                print("Good Urls")
                success?(result)
            case .failure(_):
                print("Error")
                failure?()
            }
        }
}
}
