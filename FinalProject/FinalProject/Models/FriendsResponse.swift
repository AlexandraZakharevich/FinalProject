//
//  FriendsResponse.swift
//  FinalProject
//
//  Created by Александра Захаревич on 14.07.22.
//

import Foundation
import ObjectMapper

// https://api.vk.com/method/friends.get?user_ids=86032642&v=5.131&fields=photo_200_orig&access_token=vk1.a.78xBl3xmXcWTjIm6mf6gtsVAtYQNfbn2BNgfH9JStDKtPtmEvxfeoPnOtlJzAiCkgxqZC6juab4BPONiYl84NmcMq0ugnV4ZfznByCkS6_5IfWnPnkYh5jL4sLlm9jKPD5Esdmfyra41jiyVfO52YYzIMDqhAW8Fc0RVd694seJfyt6_b_P7zPnmiaOHeUIn

// Модель друзей для таблицы
class FriendResponse: Mappable {
    var count: Int?
    var friendsItems = [Friends]()
    
   
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        count          <- map["count"]
        friendsItems   <- map["items"]
    }
}

class Friends : Mappable {
        var id: Int?
        var photo_200_orig: String?
        var first_name: String?
        var last_name: String?
        var status: String?
        
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        id                <- map["id"]
        photo_200_orig    <- map["photo_200_orig"]
        first_name        <- map["first_name"]
        last_name         <- map["last_name"]
        status            <- map["status"]
       
       }
    
}
