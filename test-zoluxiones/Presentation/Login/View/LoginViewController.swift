//
//  LoginViewController.swift
//  test-zoluxiones
//
//  Created by Julio Perez on 9/05/22.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    private var viewModel = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        initListener()
    }
    
    private func initListener(){
        viewModel.onLoginListener { (userResponse, message) in
            guard let user = userResponse else {
                self.showToast(message: message )
                return
            }
            self.showToast(message: message )
        }
    }
    
    @IBAction func btnLogin(_ sender: UIButton) {
        validateForm()
    }
    
    private func validateForm() {
        guard let username = userTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        viewModel.validateAuth(username, password)
    }
    
}
