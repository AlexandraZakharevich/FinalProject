//
//  ProfileResponse.swift
//  FinalProject
//
//  Created by Александра Захаревич on 14.07.22.
//

import Foundation
import ObjectMapper

//https://api.vk.com/method/users.get?user_ids=86032642&v=5.131&fields=city, bdate, education, status, photo_100, followers_count, &access_token=vk1.a.78xBl3xmXcWTjIm6mf6gtsVAtYQNfbn2BNgfH9JStDKtPtmEvxfeoPnOtlJzAiCkgxqZC6juab4BPONiYl84NmcMq0ugnV4ZfznByCkS6_5IfWnPnkYh5jL4sLlm9jKPD5Esdmfyra41jiyVfO52YYzIMDqhAW8Fc0RVd694seJfyt6_b_P7zPnmiaOHeUIn

class ProfileResponse: Mappable {
       var id: Int?
       var bdate: String?
       var city = [City]()
       var status: String?
       var followersCount: Int?
       var universityName: String?
       var photo100: String?
       var firstName: String?
       var lastName: String?
    
   
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        id                     <- map["id"]
        bdate                  <- map["bdate"]
        city                   <- map["city"]
        status                 <- map["status"]
        followersCount         <- map["followers_count"]
        universityName         <- map["university_name"]
        photo100               <- map["photo_100"]
        firstName              <- map["first_name"]
        lastName               <- map["last_name"]
    }
}


class City: Mappable {
        var id: String?
        var title: String?
        
        
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        id             <- map["photo_100"]
        title          <- map["status"]
        
       
       }
    
}
