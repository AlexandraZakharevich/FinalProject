//
//  Models.swift
//  FinalProject
//
//  Created by Александра Захаревич on 10.07.22.
//

import Foundation
import ObjectMapper


// Модель друзей для таблицы
class Friends : Mappable {
        var photo_100: String?
        var first_name: String?
        var last_name: String?
        
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        photo_100         <- map["photo_100"]
        first_name        <- map["first_name"]
        last_name         <- map["last_name"]
       
       }
    
}

// Модель групп для таблицы
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
