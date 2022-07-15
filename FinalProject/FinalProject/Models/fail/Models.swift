//
//  Models.swift
//  FinalProject
//
//  Created by Александра Захаревич on 10.07.22.
//
//
//import Foundation
//import ObjectMapper
//
//
//
//// Модель друзей для таблицы
//class FriendResponse: Mappable {
//    var count: Int?
//    var friendsItems = [Friends]()
//    
//
//    required init?(map: Map) {
//        mapping(map: map)
//    }
//
//    func mapping(map: Map) {
//        count          <- map["count"]
//        friendsItems   <- map["items"]
//    }
//}
//
//class Friends : Mappable {
//        var id: Int?
//        var photo_100: String?
//        var first_name: String?
//        var last_name: String?
//
//
//    required init?(map: Map) {
//        mapping(map: map)
//    }
//
//    func mapping(map: Map) {
//        id                <- map["id"]
//        photo_100         <- map["photo_100"]
//        first_name        <- map["first_name"]
//        last_name         <- map["last_name"]
//
//       }
//
//}
//
//// Модель групп для таблицы
//class GroupResponse: Mappable {
//    var count: Int?
//    var groupsItems = [Groups]()
//
//
//    required init?(map: Map) {
//        mapping(map: map)
//    }
//
//    func mapping(map: Map) {
//        count         <- map["count"]
//        groupsItems   <- map["items"]
//    }
//}
//
//
//class Groups: Mappable {
//        var photo_100: String?
//        var status: String?
//        var name: String?
//
//
//    required init?(map: Map) {
//        mapping(map: map)
//    }
//
//    func mapping(map: Map) {
//        photo_100        <- map["photo_100"]
//        status           <- map["status"]
//        name             <- map["name"]
//
//       }
//
//}
//
//
//// Модель фото для галлереи
//class PhotoResponse: Mappable {
//    var count: Int?
//    var photosItems = [Photos]()
//
//
//    required init?(map: Map) {
//        mapping(map: map)
//    }
//
//    func mapping(map: Map) {
//        count         <- map["count"]
//        photosItems   <- map["items"]
//    }
//}
//
//class Photos: Mappable {
//    var sizes = [Urls]()
//
//
//    required init?(map: Map) {
//        mapping(map: map)
//    }
//
//    func mapping(map: Map) {
//        sizes   <- map["sizes"]
//
//       }
//}
//
//class Urls: Mappable {
//    var url: String?
//
//
//    required init?(map: Map) {
//        mapping(map: map)
//    }
//
//    func mapping(map: Map) {
//        url      <- map["url"]
//
//       }
//
//}
//
//// Модель собственного профиля
//
//





