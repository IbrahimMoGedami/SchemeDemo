//
//  AuthRepo.swift
//  Base Project MVP
//
//  Created by Mohamed Akl on 03/04/2022.
//  Copyright © 2022 Mohamed Akl. All rights reserved.
//

import Foundation
import Alamofire

protocol AuthRepoProtocol: AnyObject {

    func login(body:LoginBody, handler: @escaping (AppResponse<UserDataModel>) -> Void)
    
}

class AuthRepo {
    
    private let network: NetworkProtocol
    
    init(network: NetworkProtocol) {
        self.network = network
    }
}

extension AuthRepo: AuthRepoProtocol {

    func login(body: LoginBody, handler: @escaping (AppResponse<UserDataModel>) -> Void) {
        network.request(AuthRouter.login(body: body), decodeTo: UserDataModel.self, completionHandler: handler)
    }
    
}
