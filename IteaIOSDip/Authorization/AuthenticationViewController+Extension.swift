//
//  AuthenticationViewController+Extension.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/29/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import Foundation
import UIKit

// MARK: - AUTHENTICATION - MAIL CHECK -
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

//  MARK: - VALIDATION -
extension AuthenticationViewController {
    
    func showValidationErrors(error: ValidationErrors.ErrorTextEnum, errorLabel: UILabel, subLabel: NSLayoutConstraint) {
        subLabel.priority = UILayoutPriority(rawValue: 900)
        errorLabel.text = validationErrors.errorKey(error)
    }
    
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

//  MARK: - TEXT FIELDS DELEGATE -
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

// MARK: - FIELDS VALIDATION -
extension AuthenticationViewController {
    
    func hideValidationErrors() {
        emailValidationErrorTextLabel.text = ""
        passwordValidationErrorTextLabel.text = ""
        showMailValidErrorHeightConstraint.priority = UILayoutPriority(rawValue: 600)
        showPassValidErrorHeightConstraint.priority = UILayoutPriority(rawValue: 600)
        showEmailErrorHeightConstraint.priority = UILayoutPriority(rawValue: 600)
        showPasswordErrorHeightConstraint.priority = UILayoutPriority(rawValue: 600)
    }
    
    func checkStudents(students: [IteaStudent]?) -> [IteaStudent] {
        var studentsInfo: [IteaStudent] = []
        if let studentsArray = students {
            for student in studentsArray {
                if let studentMail = student.mail, studentMail != ""{
                    studentsInfo.append(student)
                }
            }
            return studentsInfo
        }
        return studentsInfo
    }
}

//  MARK: - USER INTERFACE UI -
extension AuthenticationViewController {
    func updateAuthUi() {
        iteaLogoMainView.layer.borderColor = UIColor.white.cgColor
        iteaLogoMainView.layer.borderWidth = 2.0
        
        iteaLogoIView.layer.borderColor = UIColor.white.cgColor
        iteaLogoIView.layer.borderWidth = 2.0
        iteaLogoTView.layer.borderColor = UIColor.white.cgColor
        iteaLogoTView.layer.borderWidth = 2.0
        iteaLogoEView.layer.borderColor = UIColor.white.cgColor
        
        iteaLogoEView.layer.borderWidth = 2.0
        signUpButtonView.clipsToBounds = true
        signUpButtonView.layer.masksToBounds = false
        signUpButtonView.layer.shadowColor = UIColor.black.cgColor
        signUpButtonView.layer.shadowOpacity = 0.5
        signUpButtonView.layer.shadowOffset = CGSize(width: 10, height: 10)
        signUpButtonView.layer.shadowRadius = 12.0
        
        logInButtonView.clipsToBounds = true
        logInButtonView.layer.masksToBounds = false
        logInButtonView.layer.shadowColor = UIColor.black.cgColor
        logInButtonView.layer.shadowOpacity = 0.5
        logInButtonView.layer.shadowOffset = CGSize(width: 10, height: 10)
        logInButtonView.layer.shadowRadius = 12.0
    }
}

//  MARK: - SHOW HIDE PASSWORD BUTTON -
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

//  MARK: - ALERT ERRORS ACTION
extension AuthenticationViewController {
    func showAlertErrorAction(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel) { (_) in}
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
}
