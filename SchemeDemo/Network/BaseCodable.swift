//
//  BaseCodable.swift
//  Base Project MVP
//
//  Created by Mohamed Akl on 03/04/2022.
//  Copyright © 2022 Mohamed Akl. All rights reserved.
//


import Foundation

protocol BaseCodable: Codable {
    var isSuccess: Bool { get }
    var status: String { get }
    var message: String? { get }

}

extension BaseCodable {
    var isSuccess: Bool {
        return status == Constants.responseValid
    }
}

struct BaseModelData<T: Codable>: BaseCodable {
    var status: String
    var message: String?
    var data: T?
}

struct BaseModel: BaseCodable {
    var status: String
    var message: String?
}


struct BaseMetaModelData<T: Codable>: BaseCodable {
    var status: String
    
    var message: String?
    
    let data: T?
    let links: Links?
    let meta: Meta?

}
struct Links: Codable {
    let first: String?
    let last, prev: String?
    let next: String?
}

// MARK: - Meta
struct Meta: Codable {
    let currentPage, from: Int?
    let path: String?
    let perPage, to: Int?
    let lastPage: Int?

    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case from, path
        case perPage = "per_page"
        case to
        case lastPage = "last_page"
    }
}
