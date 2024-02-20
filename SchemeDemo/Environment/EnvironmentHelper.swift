//
//  EnvironmentHelper.swift
//  SchemeDemo
//
//  Created by Ibrahim Mo Gedami on 2/17/24.
//

import Foundation

public enum InfoPlistKey {
    
    case endPointUrl
    
    var value: String {
        switch self {
        case .endPointUrl:
            return "serverULR"
        }
    }
    
}

public struct Environment {
    
    var dictionary: [String: Any] {
        get {
            guard let dic = Bundle.main.infoDictionary else {
                fatalError("Something went wrong, Plist isn't found")
            }
            return dic
        }
    }
    
    func config(_ key: InfoPlistKey) -> String? {
        switch key {
        case .endPointUrl:
            guard let value = dictionary[InfoPlistKey.endPointUrl.value] as? String else { return nil }
            return value
        }
    }
    
}
