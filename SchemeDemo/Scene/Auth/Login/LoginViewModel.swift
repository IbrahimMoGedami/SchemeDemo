//
//  LoginViewModel.swift
//  SchemeDemo
//
//  Created by Ibrahim Mo Gedami on 2/18/24.
//

import Foundation

protocol LoginViewModelProtocol {
    
}

class LoginViewModel: LoginViewModelProtocol {
    
    private var repo: AuthRepoProtocol
    
    init(repo: AuthRepoProtocol) {
        self.repo = repo
    }
    
}
