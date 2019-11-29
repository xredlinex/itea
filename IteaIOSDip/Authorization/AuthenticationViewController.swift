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
    @IBOutlet weak var signUpButtonView: UIView!
    @IBOutlet weak var logInButtonView: UIView!
    @IBOutlet weak var showMassonsEyeImageView: UIImageView!
    @IBOutlet weak var showMailValidErrorHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var showPassValidErrorHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var showEmailErrorHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var showPasswordErrorHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var showLineRespontMailFieldHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var showLineRespondPasswordFieldHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var iteaLogoMainView: UIView!
    @IBOutlet weak var iteaLogoIView: UIView!
    @IBOutlet weak var iteaLogoTView: UIView!
    @IBOutlet weak var iteaLogoEView: UIView!
    
    var iteaStudents: [IteaStudent] = []
    var newStudent = IteaStudent()
    var validationErrors = ValidationErrors()
    var validation = Validation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateAuthUi()
        
        let recieveUsers = makeIteaStudents()
        iteaStudents = checkStudents(students: recieveUsers)
        
        
        userNameTextField.delegate = self
        userPasswordTextField.delegate = self
        
        let keyboardHide = UITapGestureRecognizer(target: self, action: #selector(keyboardWillHide))
        view.addGestureRecognizer(keyboardHide)
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(true)
            
            userNameTextField.text = ""
            userPasswordTextField.text = ""
        }
    
    @IBAction func didTapShowPasswordEyeActionButton(_ sender: Any) {
       showPassword()
    }
    
    @IBAction func didTapShowPasswordActionButton(_ sender: Any) {
        showPassword()
    }
    

    @IBAction func didTapLoginActionButton(_ sender: Any) {
        let validation = validateLogin(inputLogin: userNameTextField.text ?? "", inputPassword: userPasswordTextField.text ?? "")
        if userNameTextField.text != "" && userPasswordTextField.text != "" {
            if validation == true {
                if iteaStudents.contains(where: {$0.mail == userNameTextField.text}) {
                    if iteaStudents.contains(where: {$0.password == userPasswordTextField.text}) {
                        let stotyboard = UIStoryboard(name: "Courses", bundle: nil)
                        let viewController = stotyboard.instantiateViewController(withIdentifier: "CoursesFlowViewController") as! CoursesFlowViewController
                        viewController.recieveUserInfo = studentAuthentication(students: iteaStudents)
                        navigationController?.pushViewController(viewController, animated: true)
                    } else {
                        showAlertErrorAction(title: validationErrors.errorKey(.error), message: validationErrors.errorKey(.invalidPassword))
                        showValidationErrors(error: .invalidPassword, errorLabel: passwordValidationErrorTextLabel, subLabel: showPassValidErrorHeightConstraint)
                    }
                } else {
                    showAlertErrorAction(title: validationErrors.errorKey(.error), message: validationErrors.errorKey(.noEmail))
                }
            } else {
                showEmailErrorHeightConstraint.priority = UILayoutPriority(rawValue: 900)
                showValidationErrors(error: .invalidEmail,
                                     errorLabel: emailValidationErrorTextLabel,
                                     subLabel: showMailValidErrorHeightConstraint)
                showPasswordErrorHeightConstraint.priority = UILayoutPriority(rawValue: 900)
                showValidationErrors(error: .invalidPassword,
                                     errorLabel: passwordValidationErrorTextLabel,
                                     subLabel: showPassValidErrorHeightConstraint)
            }
        } else {
            showAlertErrorAction(title: validationErrors.errorKey(.error), message: validationErrors.errorKey(.emptyFields))
        }
    }
    
    @IBAction func didTapSignUpActionButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Aauthorization", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func didTapForgotPasswordActionButton(_ sender: Any) {
        showAlertErrorAction(title: "Sorry!", message: "Train Your Brain!")
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
               hideValidationErrors()
            
           case userPasswordTextField:
               userPasswordTextField.text = ""
               showMassonsEyeImageView.image = UIImage(systemName: "eye.slash")
               showLineRespondPasswordFieldHeightConstraint.priority = UILayoutPriority(rawValue: 900)
               hideValidationErrors()
            
           default:
                hideValidationErrors()
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
    func showValidationErrors(error: ValidationErrors.ErrorTextEnum, errorLabel: UILabel, subLabel: NSLayoutConstraint) {
        subLabel.priority = UILayoutPriority(rawValue: 900)
        errorLabel.text = validationErrors.errorKey(error)
    }
}
extension AuthenticationViewController {
    
    func validateLogin(inputLogin: String, inputPassword: String) -> Bool {
        var validateFields = false
        if validation.validateMail(mail: inputLogin) == false {
            emailValidationErrorTextLabel.text = validationErrors.errorKey(.invalidEmail)
        }
        if validation.validatePassword(password: inputPassword) == false {
            passwordValidationErrorTextLabel.text = validationErrors.errorKey(.invalidPassword)
        }
        
        if validation.validateMail(mail: inputLogin) == true && validation.validatePassword(password: inputPassword) == true {
            validateFields = true
        }
        return validateFields
    }
}


extension AuthenticationViewController {
    func showAlertErrorAction(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel) { (_) in}
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
}

extension AuthenticationViewController{
    
    func studentAuthentication(students : [IteaStudent]) -> IteaStudent {
        var loginStudent = IteaStudent()
        for user in students {
            if user.mail == userNameTextField.text {
                if user.password == userPasswordTextField.text {
                    loginStudent = user
                }
            }
        }
        return loginStudent
    }
}
    

extension AuthenticationViewController {
    func showPassword() {
        
        if userPasswordTextField.isSecureTextEntry == true {
            userPasswordTextField.isSecureTextEntry = false
            showHidePasswordButton.setTitle("HIDE", for: .normal)
            showMassonsEyeImageView.image = UIImage(systemName: "eye.slash")
        } else {
            userPasswordTextField.isSecureTextEntry = true
            showHidePasswordButton.setTitle("SHOW", for: .normal)
            
            showMassonsEyeImageView.image = UIImage(systemName: "eye")
        }
        
    }
}



















