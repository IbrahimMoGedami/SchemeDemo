//
//  URLRequestConveritble.swift
//  Base Project MVP
//
//  Created by Mohamed Akl on 03/04/2022.
//  Copyright © 2022 Mohamed Akl. All rights reserved.
//


import Foundation
import Alamofire
typealias params = [String: Any]

protocol URLRequestConvertible: Alamofire.URLRequestConvertible {
    var method: HTTPMethod { get }
    var parameters: [String: Any]? { get }
    var path: String { get }
    var encoding: ParameterEncoding { get }
}

extension URLRequestConvertible {
    
    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }    
    
    func asURLRequest() throws -> URLRequest {
        print(ConstantsEnum.baseURL + path)
        let stringURL = (ConstantsEnum.baseURL + path).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        var urlRequest = URLRequest(url: URL(string: stringURL)!)
        // var method: HTTPMethod = .get
        // if parameters != nil { method = .post }
        
        urlRequest.httpMethod = method.rawValue
        return try encoding.encode(urlRequest, with: parameters)
    }
}
