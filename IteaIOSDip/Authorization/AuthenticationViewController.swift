//
//  AuthenticationViewController.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/18/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

class AuthenticationViewController: UIViewController {

    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var userPasswordTextField: UITextField!
    @IBOutlet var showHidePasswordButton: UIButton!
    @IBOutlet var emailValidationErrorTextLabel: UILabel!
    @IBOutlet var passwordValidationErrorTextLabel: UILabel!
    @IBOutlet var logInButton: UIButton!
    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var showMailValidErrorHeightConstraint: NSLayoutConstraint!
    @IBOutlet var showPassValidErrorHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func didTapShowHideActionbutton(_ sender: Any) {
    }
    @IBAction func didTapLoginActionButton(_ sender: Any) {
    }
    @IBAction func didTapSignUpActionButton(_ sender: Any) {
    }
    @IBAction func didTapForgotPasswordActionButton(_ sender: Any) {
    }
    

}
