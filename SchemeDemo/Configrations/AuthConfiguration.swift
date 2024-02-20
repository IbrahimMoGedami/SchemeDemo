//
//  AuthConfiguration.swift
//  SchemeDemo
//
//  Created by Ibrahim Mo Gedami on 2/18/24.
//

import Foundation
import UIKit

enum AuthConfiguration {
    
    case login
    
    var viewController: UIViewController {
        switch self {
        case .login:
            let network = Network()
            let authRepo = AuthRepo(network: network)
            let viewModel = LoginViewModel(repo: authRepo)
            let view = LoginViewController(viewModel: viewModel)
            return view
        }
    }
    
}
