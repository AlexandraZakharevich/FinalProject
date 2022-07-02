//
//  UserResponse.swift
//  FinalProject
//
//  Created by Александра Захаревич on 2.07.22.
//

import Foundation

struct UserResponseWrapped: Decodable {
    let response: [UserResponse]
}

struct UserResponse: Decodable {
    let photo100: String?
}
