//
//  AppResponse.swift
//  Base Project MVP
//
//  Created by Mohamed Akl on 03/04/2022.
//  Copyright © 2022 Mohamed Akl. All rights reserved.
//


import Foundation
enum AppResponse <T>  {
    
    case success(T)
    case error(AppError)
    
}

enum AppError: Error, LocalizedError {
    
    case cannotDecode // Handle ComminDate
    case noInternet // ---
    case customeError(String) // Error.Description
    case tokenExpire // 401
    case internalServerError // 500
    case timeOut
    
    var errorDescription: String? {
        switch self {
        case .cannotDecode:
            return "Cannot Decode"
        case .noInternet:
            return "No Internet"
        case let .customeError(err):
            return err
        case .tokenExpire:
            return "Token Expire"
        case .internalServerError:
            return "Internal Server Error"
        case .timeOut:
            return "Time Out"
        }
    }
    
}

extension AppError: Equatable {
    
    static func == (lhs: AppError, rhs: AppError) -> Bool {
        switch (lhs, rhs) {
        case (.cannotDecode, .cannotDecode),
            (.noInternet, .noInternet),
            (.tokenExpire, .tokenExpire),
            (.internalServerError, .internalServerError),
            (.timeOut, .timeOut):
            return true
        case let (.customeError(lhsMessage), .customeError(rhsMessage)):
            return lhsMessage == rhsMessage
        default:
            return false
        }
    }
    
}
