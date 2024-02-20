//
//  AuthRouter.swift
//  Base Project MVP
//
//  Created by Mohamed Akl on 03/04/2022.
//  Copyright © 2022 Mohamed Akl. All rights reserved.
//

import Foundation
import Alamofire

enum AuthRouter: URLRequestConvertible {
    
    case login(body: LoginBody)
    
    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        default:
            return JSONEncoding.default
        }
    }
    
    var path: String {
        switch self {
        case .login:
            return "client/login"
        }
    }
    
    var parameters: [String : Any]?  {
        switch self {
        case .login(body : let body):
            return body.getBody()
        }
    }
}
