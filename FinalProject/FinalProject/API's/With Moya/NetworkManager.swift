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
    
    static func getProfile(city: City?, bdate: String?, education: String?, status: String?, photo_100: String?, followers_count: Int?, success: ((ProfileResponse) ->())?, failure: (() -> ())? = nil) {
        provider.request(.getProfile(city: city, bdate: bdate, education: education, status: status, photo_100: photo_100, followers_count: followers_count)) { result in
            switch result {
                
            case .success(let response):
                guard let result = try? response.mapObject(ProfileResponse.self)
                        
                else {
                    failure?()
                    return
                }
                print("Good")
                success?(result)
            case .failure(_):
                print("Error")
                failure?()
            }
        }
    }
    
    static func getFriends(photo_200_orig: String?, success: ((FriendResponse) ->())?, failure: (() -> ())? = nil) {
        provider.request(.getFriends(photo_200_orig: photo_200_orig)) { result in
            switch result {
                
            case .success(let response):
                guard let result = try? response.mapObject(FriendResponse.self)
                        
                else {
                    failure?()
                    return
                }
                print("Good")
                success?(result)
            case .failure(_):
                print("Error")
                failure?()
            }
        }
    }
        
        static func getGroups(status: String?, photo_100: String?, success: ((GroupResponse) ->())?, failure: (() -> ())? = nil) {
            provider.request(.getGroups(status: status, photo_100: photo_100)) { result in
                switch result {
                    
                case .success(let response):
                    guard let result = try? response.mapObject(GroupResponse.self)
                            
                    else {
                        failure?()
                        return
                    }
                    print("Good")
                    success?(result)
                case .failure(_):
                    print("Error")
                    failure?()
                }
            }
    }
    
    static func getPhotos(success: ((Urls) ->())?, failure: (() -> ())? = nil) {
        provider.request(.getPhotos) { result in
            switch result {
                
            case .success(let response):
                guard let result = try? response.mapObject(Urls.self)
                        
                else {
                    failure?()
                    return
                }
                print("Good")
                success?(result)
            case .failure(_):
                print("Error")
                failure?()
            }
        }
}
}
