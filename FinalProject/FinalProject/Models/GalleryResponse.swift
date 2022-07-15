//
//  GalleryResponse.swift
//  FinalProject
//
//  Created by Александра Захаревич on 14.07.22.
//

import Foundation
import ObjectMapper


    //https://api.vk.com/method/photos.getAll?user_ids=86032642&v=5.131&access_token=vk1.a.78xBl3xmXcWTjIm6mf6gtsVAtYQNfbn2BNgfH9JStDKtPtmEvxfeoPnOtlJzAiCkgxqZC6juab4BPONiYl84NmcMq0ugnV4ZfznByCkS6_5IfWnPnkYh5jL4sLlm9jKPD5Esdmfyra41jiyVfO52YYzIMDqhAW8Fc0RVd694seJfyt6_b_P7zPnmiaOHeUIn

// Модель фото для галлереи
class PhotoResponse: Mappable {
    var count: Int?
    var photosItems = [Photos]()
    
   
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        count         <- map["count"]
        photosItems   <- map["items"]
    }
}

class Photos: Mappable {
    var sizes = [Urls]()
        
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        sizes   <- map["sizes"]
       
       }
}

class Urls: Mappable {
    var url: String?
        
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        url      <- map["url"]
       
       }
    
}
