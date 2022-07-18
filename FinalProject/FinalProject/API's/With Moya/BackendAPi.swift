//
//  BackendAPi.swift
//  FinalProject
//
//  Created by Александра Захаревич on 9.07.22.
//

import Foundation
import Moya
import VK_ios_sdk

// https://api.vk.com/method/METHOD?PARAMS&access_token=TOKEN&v=V


enum BackendAPI{
    case getProfile
    case getFriends
    case getGroups
    case getPhotos
}


extension BackendAPI: TargetType {
//    private let authService: AuthService
    
    var baseURL: URL {
        return URL(string: "https://api.vk.com/method")!
    }
    
    var path: String {
        switch self {
        case .getProfile:
            return "/users.get"
        case .getFriends:
            return "/friends.get"
        case .getGroups:
            return "/groups.get"
        case .getPhotos:
            return "/photos.getAll"
        }
      
    }
    
    var method: Moya.Method {
        switch self {
        case .getProfile, .getFriends, .getGroups,.getPhotos:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        guard let params = params else {
            return .requestPlain
        }
        return .requestParameters(parameters: params, encoding: encoding)
    }
   

    var params: [String: Any]? {
        var params = [String: Any]()
        params ["access_token"] = VKSdk.accessToken()?.accessToken
        params["user_ids"] =  VKSdk.accessToken()?.userId
        params["v"] = "5.131"
        

        switch self {
        case .getProfile:
            params["fields"] = "city, bdate, education, status, photo_100, followers_count"
        case .getFriends:
            params["fields"] = "photo_200_orig, status"
        case .getGroups:
            params["fields"] = "photo_100, status"
        case .getPhotos:
            return nil
        }
     return params
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .getProfile, .getFriends, .getGroups, .getPhotos:
            return  URLEncoding.queryString
        }
    }
    
    
    var headers: [String : String]? {
        return nil
    }
    
}
