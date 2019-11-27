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
    @IBOutlet weak var showLineRespondPasswordFieldHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateAuthUi()
        
        let keyboardHide = UITapGestureRecognizer(target: self, action: #selector(keyboardWillHide))
        view.addGestureRecognizer(keyboardHide)
        
        userNameTextField.delegate = self
        userPasswordTextField.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(true)
            
            userNameTextField.text = ""
            userPasswordTextField.text = ""
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

extension AuthenticationViewController {
    
    @objc func keyboardWillHide() {
        bottomHeightConstraint.constant = 0
        self.view.endEditing(true)
    }
}

extension AuthenticationViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        bottomHeightConstraint.constant = 250
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           
           switch textField {
           case userNameTextField:
               userPasswordTextField.becomeFirstResponder()
           case userPasswordTextField:
               userPasswordTextField.resignFirstResponder()
               bottomHeightConstraint.constant = 0
           default:
               userNameTextField.becomeFirstResponder()
           }
           return true
       }
       
       func textFieldDidBeginEditing(_ textField: UITextField) {
           switch textField {
           case userNameTextField:
               showLineRespontMailFieldHeightConstraint.priority = UILayoutPriority(rawValue: 900)
               
               
               showMailValidErrorHeightConstraint.priority = UILayoutPriority(rawValue: 600)
               showPasswordEmailHeightConstraint.priority = UILayoutPriority(rawValue: 600)
               showMailValidErrorHeightConstraint.priority = UILayoutPriority(rawValue: 600)
               showPassValidErrorHeightConstraint.priority = UILayoutPriority(rawValue: 600)
            
           case userPasswordTextField:
               userPasswordTextField.text = ""
               showLineRespondPasswordFieldHeightConstraint.priority = UILayoutPriority(rawValue: 900)
               
               showPasswordEmailHeightConstraint.priority = UILayoutPriority(rawValue: 600)
               showMailValidErrorHeightConstraint.priority = UILayoutPriority(rawValue: 600)
               showMailValidErrorHeightConstraint.priority = UILayoutPriority(rawValue: 600)
               showPassValidErrorHeightConstraint.priority = UILayoutPriority(rawValue: 600)
            
           default:
            
               showMailValidErrorHeightConstraint.priority = UILayoutPriority(rawValue: 600)
               showPasswordEmailHeightConstraint.priority = UILayoutPriority(rawValue: 600)
            
               showMailValidErrorHeightConstraint.priority = UILayoutPriority(rawValue: 600)
               showPassValidErrorHeightConstraint.priority = UILayoutPriority(rawValue: 600)
           }
       }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case userNameTextField:
            showLineRespontMailFieldHeightConstraint.priority = UILayoutPriority(rawValue: 600)
        case userPasswordTextField:
            showLineRespondPasswordFieldHeightConstraint.priority = UILayoutPriority(rawValue: 600)
        default:
            showLineRespondPasswordFieldHeightConstraint.priority = UILayoutPriority(rawValue: 600)
            showLineRespontMailFieldHeightConstraint.priority = UILayoutPriority(rawValue: 600)
        }
    }
    
    
}




















extension AuthenticationViewController {
    
        func updateAuthUi() {
            
            let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
            backgroundImage.image = UIImage(named: "backgroundlogin")
            backgroundImage.contentMode = .scaleAspectFill
            let backgroundForImage = UIView(frame: UIScreen.main.bounds)
            backgroundForImage.backgroundColor = UIColor.red
            backgroundForImage.alpha = 0.8
            view.addSubview(backgroundImage)
            view.addSubview(backgroundForImage)
            self.view.sendSubviewToBack(backgroundForImage)
            self.view.sendSubviewToBack(backgroundImage)
            
            
    }

}



