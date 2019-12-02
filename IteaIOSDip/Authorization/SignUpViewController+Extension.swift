//
//  SignUpViewController+Extension.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/29/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import Foundation
import UIKit

//  MARK: - ADD NEW STUDENT EXTENSION
extension SignUpViewController {
    func addNewStudent (inputName: String, inputLastName: String, inputAge: Int, inputMail: String, inputPhone: String, inputCity: String, inputPassword: String) -> IteaStudent {
        let newStudent = IteaStudent()
        newStudent.name = inputName
        newStudent.lastName = inputLastName
        newStudent.age = inputAge
        newStudent.mail = inputMail
        newStudent.phoneNumber = inputPhone
        newStudent.city = inputCity
        newStudent.password = inputPassword
        return newStudent
    }
}

//  MARK: - TEXT FIELDS DELEGATE -
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
            ageTextField.becomeFirstResponder()
        case ageTextField:
            emailTextField.becomeFirstResponder()
        case emailTextField:
            phoneTextField.becomeFirstResponder()
        case phoneTextField:
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
            nameWhiteHeightConstraint.priority = UILayoutPriority(rawValue: 900)
            nameImageView.image = UIImage(systemName: "person.fill")
            nameErrorTextLabel.text = ""
        case lastNameTextField:
            lastNameWhiteHeightConstraint.priority = UILayoutPriority(rawValue: 900)
            lastNameImageView.image = UIImage(systemName: "person.2.fill")
            lastNameErrorTextLabel.text = ""
        case emailTextField:
            emailWhiteHeightConstraint.priority = UILayoutPriority(rawValue: 900)
            emailImageView.image = UIImage(systemName: "envelope.fill")
            emailErrorTextLabel.text = ""
        case phoneTextField:
            phoneWhiteHeightConstraint.priority = UILayoutPriority(rawValue: 900)
            phoneImageView.image = UIImage(systemName: "phone.down.fill")
            phoneErrorTextLabel.text = ""
        case ageTextField:
            ageWhiteHeightConstraint.priority = UILayoutPriority(rawValue: 900)
            ageImageView.image = UIImage(systemName: "calendar.circle.fill")
        case cityTextField:
            cityWhiteHeightConstraint.priority = UILayoutPriority(rawValue: 900)
            cityImageView.image = UIImage(systemName: "map.fill")
            cityErrorTextLabel.text = ""
        case passwordTextField:
            passwordWhiteHeightConstraint.priority = UILayoutPriority(rawValue: 900)
            passwordImageView.image = UIImage(systemName: "lock.fill")
            passwordErrorTextLabel.text = ""
        case confirmPasswordTextField:
            passwordWhiteHeightConstraint.priority = UILayoutPriority(rawValue: 900)
            confirmPasswordImageView.image = UIImage(systemName: "hand.raised.fill")
            confirmPasswordErrorTextLabel.text = ""
        default:
            nameWhiteHeightConstraint.priority = UILayoutPriority(rawValue: 600)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case nameTextField:
            nameWhiteHeightConstraint.priority = UILayoutPriority(rawValue: 600)
            nameImageView.image = UIImage(systemName: "person")
        case lastNameTextField:
            lastNameWhiteHeightConstraint.priority = UILayoutPriority(rawValue: 600)
            lastNameImageView.image = UIImage(systemName: "person.2")
        case emailTextField:
            emailWhiteHeightConstraint.priority = UILayoutPriority(rawValue: 600)
            emailImageView.image = UIImage(systemName: "envelope")
        case phoneTextField:
            phoneWhiteHeightConstraint.priority = UILayoutPriority(rawValue: 600)
             phoneImageView.image = UIImage(systemName: "phone.down")
        case ageTextField:
            ageWhiteHeightConstraint.priority = UILayoutPriority(rawValue: 600)
            ageImageView.image = UIImage(systemName: "calendar")
        case cityTextField:
            cityWhiteHeightConstraint.priority = UILayoutPriority(rawValue: 600)
            cityImageView.image = UIImage(systemName: "map")
        case passwordTextField:
            passwordWhiteHeightConstraint.priority = UILayoutPriority(rawValue: 600)
            passwordImageView.image = UIImage(systemName: "lock")
        case confirmPasswordTextField:
            passwordWhiteHeightConstraint.priority = UILayoutPriority(rawValue: 600)
             confirmPasswordImageView.image = UIImage(systemName: "hand.raised")
        default:
            nameWhiteHeightConstraint.priority = UILayoutPriority(rawValue: 600)
            
        }
    }
}

//  MARK: - UNIVERSAL ALERT ACTION
extension SignUpViewController {
    func errorAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel) { (_) in
        }
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
}

//  MARK: - VALIDATION EXTENSION -
extension SignUpViewController {
    
    func validateError() {
        checkPolicy = false
        policyImageView.image = UIImage(systemName: "square")
    }
    
    func validateFields(inputName: String, inputLastName: String, inputEmail: String, inputPhone: String, inputPassword: String) -> Bool {
        var validateFields = false
        
        if validation.validateName(name: inputName) == false {
            nameErrorTextLabel.text = validationErrors.errorKey(.invalidFirstName) + validationErrors.errorKey(.validateName)
            nameValidationHeightConstraint.priority = UILayoutPriority(rawValue: 900)
            validateError()
        }
        if validation.validateLastNAme(lastName: inputLastName) == false {
            lastNameErrorTextLabel.text = validationErrors.errorKey(.invalidLastName) + validationErrors.errorKey(.validateLastName)
            lsatNameValidationHeightConstraint.priority = UILayoutPriority(rawValue: 900)
            validateError()
        }
        if validation.validateMail(mail: inputEmail) == false {
            emailErrorTextLabel.text = validationErrors.errorKey(.invalidEmail) + validationErrors.errorKey(.validateMail)
            emailValidationHeightConstraint.priority = UILayoutPriority(rawValue: 900)
            validateError()
        }
        if validation.validatePhone(phone: inputPhone) == false {
            phoneErrorTextLabel.text = validationErrors.errorKey(.invalidPhoneNumber) + validationErrors.errorKey(.invalidPhoneNumber)
            phoneValidationHeightConstraint.priority = UILayoutPriority(rawValue: 900)
            validateError()
        }
        if validation.validatePassword(password: inputPassword) == false {
            passwordErrorTextLabel.text = validationErrors.errorKey(.validatePassword)
            passwordValidationHeightConstraint.priority = UILayoutPriority(rawValue: 900)
            validateError()
        }
        if validation.validateName(name: inputName) == true && validation.validateLastNAme(lastName: inputLastName) == true && validation.validateMail(mail: inputEmail) == true && validation.validatePhone(phone: inputPhone) == true && validation.validatePassword(password: inputPassword) == true {
            validateFields = true
        }
        return validateFields
    }
}

//  MARK: - ADD BUTTONS TO NUM KEYBOARDS TYPE - 
extension SignUpViewController {
    func addNextButtonOnKeyboardAge() {
        let nextToolBar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        nextToolBar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let next = UIBarButtonItem(title: "Next", style: .done, target: self, action: #selector(nextButtonActionAge))
        
        let item = [flexSpace, next]
        nextToolBar.items = item
        nextToolBar.sizeToFit()
        ageTextField.inputAccessoryView = nextToolBar
        }
    
    func addNextButtonOnKeyboardPhone() {
        
        let nextToolBar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        nextToolBar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let next = UIBarButtonItem(title: "Next", style: .done, target: self, action: #selector(nextButtonActionPhone))
        
        let item = [flexSpace, next]
        nextToolBar.items = item
        nextToolBar.sizeToFit()
        phoneTextField.inputAccessoryView = nextToolBar
    }
    
    @objc func nextButtonActionAge(){
        emailTextField.becomeFirstResponder()
    }
        
    @objc func nextButtonActionPhone() {
        cityTextField.becomeFirstResponder()
    }
}

//  MARK: - USER INTEFACE UI / BUTTONS / VIEW / TEXT / IMAGES -
extension SignUpViewController {
    func updateSignUpUI() {
        nameImageView.image = UIImage(systemName: "person")
        lastNameImageView.image = UIImage(systemName: "person.2")
        ageImageView.image = UIImage(systemName: "calendar")
        emailImageView.image = UIImage(systemName: "envelope")
        phoneImageView.image = UIImage(systemName: "phone.down")
        cityImageView.image = UIImage(systemName: "map")
        passwordImageView.image = UIImage(systemName: "lock")
        confirmPasswordImageView.image = UIImage(systemName: "hand.raised")
        
        
        policyTextLabel.text = """
        Подписанием и отправкой настоящей заявки я подтверждаю, что я ознакомлен с
        Политикой конфиденциальности и принимаю ее условия, включая регламентирующие обработку моих персональных данных, и согласен с ней.
        """
        policyImageView.image = UIImage(systemName: "square")
    }
}
