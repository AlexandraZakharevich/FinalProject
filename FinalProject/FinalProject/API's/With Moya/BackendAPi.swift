//
//  BackendAPi.swift
//  FinalProject
//
//  Created by Александра Захаревич on 9.07.22.
//

import Foundation
import Moya

// https://api.vk.com/method/METHOD?PARAMS&access_token=TOKEN&v=V





enum BackendAPI{
    case getProfile(city: City?, bdate: String?, education: String?, status: String?, photo_100: String?, followers_count: Int?)
    case getFriends(photo_200_orig: String?)
    case getGroups(status: String?, photo_100: String?)
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
        switch self {
        case .getProfile(let city, let bdate, let education, let status, let photo_100, let followers_count):
            params["fields"] = city
            params["fields"] = bdate
            params["fields"] = education
            params["fields"] = status
            params["fields"] = photo_100
            params["fields"] = followers_count
        case .getFriends(let photo_200_orig):
            params["fields"] = photo_200_orig
        case .getGroups(let status, let photo_100):
            params["fields"] = status
            params["fields"] = photo_100
        case .getPhotos:
            return nil
        }
     return params
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .getProfile:
            return  URLEncoding.queryString
        case .getFriends:
            return  URLEncoding.queryString
        case .getGroups:
            return  URLEncoding.queryString
        case .getPhotos:
            return  URLEncoding.queryString
        }
    }
    
    
    var headers: [String : String]? {
        return ["v" : "\(API.version)"]
//        return ["user_ids" : "\(AuthService.)"]
//        return ["access_token" : "\(AuthService.)"]
    }
    
}
