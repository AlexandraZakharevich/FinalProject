//
//  FriendsResponce.swift
//  FinalProject
//
//  Created by Александра Захаревич on 9.07.22.
//

import Foundation

struct FriendsResponseWrapped: Decodable {
    let response: FriendsResponse
}

struct FriendsResponse: Decodable {
    let count: Int?
    var item: [FriendItem]
    
}

struct FriendItem: Decodable {
    let first_name: String
    let last_name: String
    let friendID: Int
    let photo_100: String?
}
