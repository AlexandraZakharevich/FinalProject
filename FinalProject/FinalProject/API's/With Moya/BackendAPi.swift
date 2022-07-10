//
//  BackendAPi.swift
//  FinalProject
//
//  Created by Александра Захаревич on 9.07.22.
//

import Foundation
import Moya



enum BackendAPI{
    case getFriends
    case getGroups
}

extension BackendAPI: TargetType {
//    private let authService: AuthService
    
    var baseURL: URL {
        return URL(string: "https://api.vk.com/method")!
    }
    
    var path: String {
        switch self {
        case .getFriends:
            return "/friends.get?"
        case .getGroups:
            return "/groups.get?"
        }
    }
    
    var method: Moya.Method {
        switch self{
        case .getFriends:
            return .get
        case .getGroups:
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
        case .getFriends:
            params["user_ids"] =  "86032642"
//            params["access_token"] = "vk1.a.QFLqNlbA6uy_CDg8UCly-f5ZGWg-8-lRu_vAPL_8uCmOK3XOfGVyECxRqZkibP0lFRZVmfPH0oo5-cNU-3onB6sNRdXXTKPAHpPW8U6K3kF5eO9C9jK5U6pLm-sZukfgKrwbMiAVuLenZ4GcU6UA64L_d2FhHrWKeQCvsbbIrW1zLRvPf3uKmRpj2hf6NLMY"
            
//            params[""]
            
        case .getGroups:
            params["user_ids"] =  "86032642"
            params["extended"] = 1
            return nil
        }
        return params
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .getFriends:
            return URLEncoding.queryString
            
        case .getGroups:
            return URLEncoding.queryString
        }
    }
    var headers: [String : String]? {
        nil
    }
    
}
