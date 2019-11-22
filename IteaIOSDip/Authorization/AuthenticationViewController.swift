//
//  AuthenticationViewController.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/18/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

class AuthenticationViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var showHidePasswordButton: UIButton!
    @IBOutlet weak var emailValidationErrorTextLabel: UILabel!
    @IBOutlet weak var passwordValidationErrorTextLabel: UILabel!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var showMailValidErrorHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var showPassValidErrorHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var showEmailErrorHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var showPasswordEmailHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var showLineRespontMailFieldHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var showLineRespondMailFieldHeightConstraint: NSLayoutConstraint!
    
    
    
    
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
