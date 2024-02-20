//
//  LoginViewController.swift
//  SchemeDemo
//
//  Created by Ibrahim Mo Gedami on 2/17/24.
//

import UIKit

class LoginViewController: UIViewController {

    private var viewModel: LoginViewModelProtocol
    
    init(viewModel: LoginViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: "LoginViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.view.backgroundColor = .blue
        }
        
         if let value = Environment().config(InfoPlistKey.endPointUrl) {
            print(value)
        }
        
    }

    
}
