//
//  UserData.swift
//  Base Project MVP
//
//  Created by Mohamed Akl on 03/04/2022.
//  Copyright © 2022 Mohamed Akl. All rights reserved.
//


import UIKit
import Security
import SwiftKeychainWrapper

enum KeyChainError: Error {
    case duplicatedEntry
    case unknown(OSStatus)
}

class CacheService {
    
   static let shared = CacheService()
    let defaults = UserDefaults.standard
    
    private let userDataKey = "_UserData_"
    private let userDataService = "_UserService_"
    
    func getUserData() -> UserData? {
        let defaults = UserDefaults.standard
        guard let savedPerson = defaults.object(forKey: userDataKey) as? Data,
              let loadedData = try? JSONDecoder().decode(UserData.self, from: savedPerson)
        else { return nil }
        
        return loadedData
    }
    
    func saveData<T: Codable>(_ data: T?) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(data) {
            defaults.set(encoded, forKey: String(describing: T.self))
        } else {
            fatalError("Unable To Save User Data")
        }
    }
    
    func getData<T: Codable>(_ type: T.Type) -> T? {
        guard let savedData = defaults.data(forKey: String(describing: T.self)),
              let loadedData = try? JSONDecoder().decode(T.self, from: savedData)
        else { return nil }
        return loadedData
    }

    
    func setUserData(_ newValue: UserData?) {
        // guard let newValue = newValue else { return }
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(newValue) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: userDataKey)
        } else {
            fatalError("Unable To Save User Data")
        }
    }
    
    func saveTourStatus(status : Bool){
        defaults.setValue(status, forKey: "tourStatus")
        defaults.synchronize() // to save id in memory
    }
    
    func getTourStatus() -> Bool? {
        return defaults.object(forKey: "tourStatus") as? Bool
    }
    
    func removeValue<T: Codable>(for type: T.Type) {
        defaults.removeObject(forKey: String(describing: T.self))
    }
    
    func NotificationStatus(isFirstTime: Bool) {
        let defaults = UserDefaults.standard
        defaults.set(isFirstTime, forKey: "Notification")
//        defaults.synchronize()
    }
    
    func getNotificationStatus() -> Bool? {
        let def = UserDefaults.standard
        return def.object(forKey: "Notification") as? Bool
    }
}

extension CacheService {
    
    @objc static func goToHomeScreenAfterLogin() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            guard let window = UIApplication.shared.keyWindow else { fatalError() }
//                        window.rootViewController = Ma
            UIView.transition(with: window, duration: 1.0, options: .curveEaseIn, animations: nil, completion: nil)
        }
    }
}

extension Data {
    
    init<T>(from value: T) {
        var value = value
        self.init(buffer: UnsafeBufferPointer(start: &value, count: 1))
    }
    
    func to<T>(type: T.Type) -> T {
        return self.withUnsafeBytes { $0.load(as: T.self) }
    }
}

extension CacheService {
    
    func save(data: UserData?) {
        guard let data = data else { return }
        let query = [
            kSecClass as String      : kSecClassGenericPassword as String,
            kSecAttrAccount as String: userDataKey as AnyObject,
            kSecAttrService as String: userDataService as AnyObject,
            kSecValueData as String  : data] as [String : Any]

        SecItemDelete(query as CFDictionary)
        SecItemAdd(query as CFDictionary, nil)
        print("Data is Saved In KeyChain \(String(describing: data.self))")
    }

    func load() -> Data? {
        let query = [
            kSecClass as String       : kSecClassGenericPassword,
            kSecAttrAccount as String : userDataKey as AnyObject,
            kSecAttrService as String: userDataService as AnyObject,
            kSecReturnData as String  : kCFBooleanTrue!,
            kSecMatchLimit as String  : kSecMatchLimitOne ] as [String : Any]

        var dataTypeRef: AnyObject?

        let _: OSStatus = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
        return dataTypeRef as? Data
    }

    func createUniqueID() -> String {
        let uuid: CFUUID = CFUUIDCreate(nil)
        let cfStr: CFString = CFUUIDCreateString(nil, uuid)

        let swiftString: String = cfStr as String
        return swiftString
    }
}
