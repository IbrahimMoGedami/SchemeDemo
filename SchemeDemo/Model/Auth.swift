//
//  AuthModel.swift
//  My Meal Client
//
//  Created by Ibrahim Mo Gedami on 5/19/22.
//  Copyright © 2022 Mohamed Akl. All rights reserved.
//

import Foundation

// MARK: - RegisterModel
struct RegisterModel: BaseCodable {
    let status: String
    let data: RegisterData?
    let message: String?
    let devMessage: Int?
    let isActive: Bool?

    enum CodingKeys: String, CodingKey {
        case status, data, message
        case devMessage = "dev_message"
        case isActive = "is_active"
    }
}

// MARK: - DataClass
struct RegisterData: Codable {
    let phone: String
}

// MARK: - VerificationModel
struct UserDataModel: BaseCodable {
    let status : String
    let message: String?
    let data: UserData?
    let devMessage: Int?
    let isBan: Bool?
    let isActive : Bool?
    
    enum CodingKeys: String, CodingKey {
        case devMessage = "dev_message"
        case isBan = "is_ban"
        case isActive = "is_active"
        case status, message, data
    }
}

// MARK: - DataClass
struct UserData: Codable {
    let id, unreadNotificationsCount: Int?
    let userType, fullName, phone, email: String?
    let image: String?
    let lang: String?
    let lastLoginAt: String?
    let badge: String?
    let token: Token?
    let isNotification: Bool?

    enum CodingKeys: String, CodingKey {
        case id
        case unreadNotificationsCount = "unreadnotifications_count"
        case userType = "user_type"
        case fullName = "fullname"
        case phone, email, image, lang, badge
        case lastLoginAt = "last_login_at"
        case isNotification = "is_notification"
        case token
    }
}

// MARK: - Token
struct Token: Codable {
    let tokenType, accessToken: String?

    enum CodingKeys: String, CodingKey {
        case tokenType = "token_type"
        case accessToken = "access_token"
    }
}

extension UserDataModel {
    
    static func mock() -> UserDataModel {
        return UserDataModel(
            status: "success",
            message: "Login successful",
            data: UserData(
                id: 1,
                unreadNotificationsCount: 0,
                userType: "user",
                fullName: "John Doe",
                phone: "1234567890",
                email: "john.doe@example.com",
                image: "profile_image_url",
                lang: "en",
                lastLoginAt: "2024-02-18T12:00:00Z",
                badge: "premium",
                token: Token(
                    tokenType: "Bearer",
                    accessToken: "mock_access_token"
                ),
                isNotification: true
            ),
            devMessage: nil,
            isBan: false,
            isActive: true
        )
    }
    
}
