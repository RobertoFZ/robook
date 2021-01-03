//
//  LoginService.swift
//  robook
//
//  Created by Roberto Franco on 03/01/21.
//

import Foundation
import Alamofire

class LoginService {
    
    func doLogin(
        email:(String),
        password:(String),
        callback: @escaping (_ loginResponse: User?) -> Void
    ) -> Void {
        let apiEndpoint = "\(API.baseUrl())/auth/login/"
        let body: [String: Any] = [
            "username": email,
            "password" : password
        ]
        
        _ = AF.request(apiEndpoint, method: .post, parameters: body, encoding: JSONEncoding.default)
        .responseJSON { response in
            switch response.result {
            case .success(let json):
                print("Response JSON: \(json)")
                do {
                    let data = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
                    let loginResponse = try JSONDecoder().decode(User.self, from: data)
                    callback(loginResponse)
                } catch {
                    print(error)
                    callback(nil)
                }
            case let .failure(error):
                print("Error JSON: \(error)")
                print(error)
            }
        }
    }
    
    func doSignup(
        firstName: String,
        lastName: String,
        email: String,
        password: String,
        callback: @escaping (_ loginResponse: User?) -> Void
    ) -> Void {
        let apiEndpoint = "\(API.baseUrl())/auth/"
        let body: [String: Any] = [
            "first_name" : firstName,
            "last_name": lastName,
            "email": email,
            "password" : password,
            "profile": ["locale": "es"]
        ]
        _ = AF.request(apiEndpoint, method: .post, parameters: body, encoding: JSONEncoding.default)
            .responseJSON { response in
                switch response.result {
                case .success(let json):
                    print("Response JSON: \(json)")
                    do {
                        let data = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
                        let loginResponse = try JSONDecoder().decode(User.self, from: data)
                        callback(loginResponse)
                    } catch {
                        print(error)
                        callback(nil)
                    }
                case let .failure(error):
                    print("Error JSON: \(error)")
                    print(error)
                }
            }
    }
}

