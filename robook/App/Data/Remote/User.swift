//
//  LoginResponse.swift
//  Subasta Ganadera
//
//  Created by Roberto Franco on 04/09/20.
//  Copyright © 2020 Roberto Franco. All rights reserved.
//

import Foundation

struct User: Decodable {
    let id: Int
    let first_name: String
    let last_name: String
    let email: String
    let token: String
    let profile: Profile
  
      enum CodingKeys: String, CodingKey {
        case id
        case first_name
        case last_name
        case email
        case token
        case profile
      }
}

struct Profile: Decodable {
    let locale: String?
    
  
    enum CodingKeys: String, CodingKey {
        case locale
    }
}
