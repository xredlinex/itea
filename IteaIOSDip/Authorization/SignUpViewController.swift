//
//  SignUpViewController.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/18/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var nameImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameErrorTextLabel: UILabel!
    @IBOutlet weak var nameWhiteView: UIView!
    
    @IBOutlet weak var lastNameImageView: UIImageView!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var lastNameErrorTextLabel: UILabel!
    @IBOutlet weak var lastNameWhiteView: UIView!
    
    @IBOutlet weak var emailImageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailErrorTextLabel: UILabel!
    
    @IBOutlet weak var emailWhiteView: UIView!
    @IBOutlet weak var phoneImageView: UIImageView!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var phoneErrorTextLabel: UILabel!
    
    @IBOutlet weak var phoneNumberWhiteView: UIView!
    @IBOutlet weak var ageImageView: UIImageView!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var ageErrorTextLabel: UILabel!
    
    @IBOutlet weak var ageWhiteView: UIView!
    @IBOutlet weak var cityImageView: UIImageView!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var cityErrorTextLabel: UILabel!
    
    @IBOutlet weak var cityWhiteView: UIView!
    @IBOutlet weak var passwordImageView: UIImageView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordErrorTextLabel: UILabel!
    
    @IBOutlet weak var passwordWhiteView: UIView!
    @IBOutlet weak var confirmPasswordImageView: UIImageView!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordErrorTextLabel: UILabel!
    @IBOutlet weak var confirmPasswordWhiteView: UIView!
    
    @IBOutlet weak var nameValidationHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var lsatNameValidationHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var emailValidationHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var phoneValidationHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var ageValidationHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var cityValidationHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var passwordValidationHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var confirmPasswordValidationHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var policyImageView: UIImageView!
    @IBOutlet weak var policyTextLabel: UILabel!
    
    @IBOutlet weak var signUpButtonView: UIView!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var nameWhiteHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var lastNameWhiteHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var emailWhiteHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var phoneWhiteHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var ageWhiteHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var cityWhiteHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var passwordWhiteHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var confirmPasswordWhiteHeightConstraint: NSLayoutConstraint!
     @IBOutlet weak var bottomHeightConstraint: NSLayoutConstraint!

    var checkPolicy = false
    var validate = false
    var validation = Validation()
    var validationErrors = ValidationErrors()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundView(image: "filterBackground", color: UIColor.red, alpha: 0.8)
        updateSignUpUI()
        
        
    

       
        let keyboardHide = UITapGestureRecognizer(target: self, action: #selector(keyboardWillHide))
        view.addGestureRecognizer(keyboardHide)
    }
    
    @IBAction func didTapGoBackActionButton(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }
    
    @IBAction func didTapCheckPolicyActionButton(_ sender: Any) {
    }
    
    @IBAction func didTapSignUpActionButton(_ sender: Any) {
    }
    
}
extension SignUpViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        bottomHeightConstraint.constant = 250
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameTextField:
            lastNameTextField.becomeFirstResponder()
        case lastNameTextField:
            emailTextField.becomeFirstResponder()
        case emailTextField:
            phoneTextField.becomeFirstResponder()
        case phoneTextField:
            ageTextField.becomeFirstResponder()
        case ageTextField:
            cityTextField.becomeFirstResponder()
        case cityTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            confirmPasswordTextField.becomeFirstResponder()
        case confirmPasswordTextField:
            confirmPasswordTextField.resignFirstResponder()
            bottomHeightConstraint.constant = 0
        default:
            nameTextField.becomeFirstResponder()
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        switch textField {
        case nameTextField:
            nameWhiteHeightConstraint.constant = 2
            
        case lastNameTextField:
            lastNameWhiteHeightConstraint.constant = 2
        case emailTextField:
            emailWhiteHeightConstraint.constant = 2
        case phoneTextField:
            phoneWhiteHeightConstraint.constant = 2
        case ageTextField:
            ageWhiteHeightConstraint.constant = 2
        case cityTextField:
            cityWhiteHeightConstraint.constant = 2
        case passwordTextField:
            passwordWhiteHeightConstraint.constant = 2
        case confirmPasswordTextField:
            passwordWhiteHeightConstraint.constant = 2
        default:
            nameWhiteHeightConstraint.constant = 1
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case nameTextField:
            nameWhiteHeightConstraint.constant = 1
        case lastNameTextField:
            lastNameWhiteHeightConstraint.constant = 1
        case emailTextField:
            emailWhiteHeightConstraint.constant = 1
        case phoneTextField:
            phoneWhiteHeightConstraint.constant = 1
        case ageTextField:
            ageWhiteHeightConstraint.constant = 1
        case cityTextField:
            cityWhiteHeightConstraint.constant = 1
        case passwordTextField:
            passwordWhiteHeightConstraint.constant = 1
        case confirmPasswordTextField:
            passwordWhiteHeightConstraint.constant = 1
        default:
            nameWhiteHeightConstraint.constant = 1
        }
    }
    
    
    
    
    
}















extension SignUpViewController {
    func updateSignUpUI() {
//
//        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
//        backgroundImage.image = UIImage(named: "filterBackground")
//        backgroundImage.contentMode = .scaleAspectFill
//        let backgroundForImage = UIView(frame: UIScreen.main.bounds)
//        backgroundForImage.backgroundColor = UIColor.red
//        backgroundForImage.alpha = 0.8
//        view.addSubview(backgroundImage)
//        view.addSubview(backgroundForImage)
//        self.view.sendSubviewToBack(backgroundForImage)
//        self.view.sendSubviewToBack(backgroundImage)
        
       let blurEffect = UIBlurEffect(style: .prominent)
           
       let sighnUpBlurView = UIVisualEffectView(effect: blurEffect)
           
       sighnUpBlurView.translatesAutoresizingMaskIntoConstraints = false
       
       signUpButtonView.insertSubview(sighnUpBlurView, at: 0)
       
       sighnUpBlurView.clipsToBounds = true
       
       
           sighnUpBlurView.layer.cornerRadius = 12.0
            
            NSLayoutConstraint.activate([sighnUpBlurView.heightAnchor.constraint(equalTo: signUpButtonView.heightAnchor),
                                         sighnUpBlurView.widthAnchor.constraint(equalTo: signUpButtonView.widthAnchor)])
        
        signUpButtonView.clipsToBounds = true
        signUpButtonView.layer.masksToBounds = false
        signUpButtonView.layer.shadowColor = UIColor.black.cgColor
        signUpButtonView.layer.shadowOpacity = 0.5
        signUpButtonView.layer.shadowOffset = CGSize(width: 10, height: 10)
        signUpButtonView.layer.shadowRadius = 12.0
        
        
        
        
        
        
}
   
       
   

}
extension SignUpViewController {
    
    @objc func keyboardWillHide() {
        bottomHeightConstraint.constant = 0
        self.view.endEditing(true)
    }
}
