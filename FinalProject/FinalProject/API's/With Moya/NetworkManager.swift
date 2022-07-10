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
    
    
    static func getFriends(success: ((Friends) ->())?, failure: (() -> ())? = nil) {
        provider.request(.getFriends) { result in
            switch result {
                
            case .success(let response):
                guard let result = try? response.mapObject(Friends.self)
                        
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
        
        static func getGroups(success: ((Groups) ->())?, failure: (() -> ())? = nil) {
            provider.request(.getGroups) { result in
                switch result {
                    
                case .success(let response):
                    guard let result = try? response.mapObject(Groups.self)
                            
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
