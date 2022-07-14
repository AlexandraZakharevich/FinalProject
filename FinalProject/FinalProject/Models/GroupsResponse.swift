//
//  GroupsResponse.swift
//  FinalProject
//
//  Created by Александра Захаревич on 14.07.22.
//

import Foundation
import ObjectMapper


// https://api.vk.com/method/groups.get?user_ids=86032642&v=5.131&fields=status,%20photo_100&access_token=vk1.a.78xBl3xmXcWTjIm6mf6gtsVAtYQNfbn2BNgfH9JStDKtPtmEvxfeoPnOtlJzAiCkgxqZC6juab4BPONiYl84NmcMq0ugnV4ZfznByCkS6_5IfWnPnkYh5jL4sLlm9jKPD5Esdmfyra41jiyVfO52YYzIMDqhAW8Fc0RVd694seJfyt6_b_P7zPnmiaOHeUIn&extended=1

// Модель групп для таблицы
class GroupResponse: Mappable {
    var count: Int?
    var groupsItems = [Groups]()
    
   
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        count         <- map["count"]
        groupsItems   <- map["items"]
    }
}


class Groups: Mappable {
        var photo_100: String?
        var status: String?
        var name: String?
        
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        photo_100        <- map["photo_100"]
        status           <- map["status"]
        name             <- map["name"]
       
       }
    
}
