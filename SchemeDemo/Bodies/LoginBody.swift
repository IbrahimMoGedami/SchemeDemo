//
//  LoginBody.swift
//  SchemeDemo
//
//  Created by Ibrahim Mo Gedami on 2/18/24.
//

import Foundation

struct LoginBody {
    
    var phoneNumber: String?
    var password: String?
    
    
    func getBody() -> [String: Any] {
        let parameters: [String: Any?] = [
            "phone": phoneNumber,
            "password": password,
            "user_type": "client"
        ]
        return parameters.compactMapValues({$0})
    }
    
}
