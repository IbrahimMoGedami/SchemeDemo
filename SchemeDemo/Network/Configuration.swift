//
//  Configuration.swift
//  Base Project MVP
//
//  Created by Mohamed Akl on 03/04/2022.
//  Copyright © 2022 Mohamed Akl. All rights reserved.
//


import Foundation
//enum Configuration {
//    
//    enum Error: Swift.Error {
//        case missingKey, invalidValue
//    }
//    
//    static func value<T>(for key: String) throws -> T where T: LosslessStringConvertible {
//        guard let object = Bundle.main.object(forInfoDictionaryKey: key) else {
//            throw Error.missingKey
//        }
//        
//        switch object {
//            case let value as T:
//                return value
//            case let string as String:
//                guard let value = T(string) else { fallthrough }
//                return value
//            default:
//                throw Error.invalidValue
//        }
//    }
//}

enum ConstantsEnum {
    
    static var baseURL: String {
        return Constants.baseUrlTest + "/api/" //Configuration.value(for: Constants.baseUrlKey)
        //"https://api.openweathermap.org/"
    }
    
//    static var echoPort: String {
//        return "6056"
//    }
    static var echoPort: String? //"6056"
    static var socketPort = ""//"3012"

}


struct Constants {
    static var baseUrlTest = ""//https://mymeal.o.aait-d.com"
    static var baseUrlLive = ""//https://mymeal.mymealsapp.com"
    static var baseUrlKeySocket = ""// "https://mymeal.mymealsapp.com"//"https://mymeal.o.aait-d.com"
    static var responseValid = "success"
    static let apiGoogleMap = "AIzaSyDnt3CzQXXxYeThX871XCFZ45FUYab_urk"
    //"AIzaSyBmJml35pDIZC6CED5ugcASteqpRBmoYCQ"//"AIzaSyA-P3GoWxLSo8peXn2cJxcEAwbVHu29rfc"
}
