//
//  SignUpViewController+Extension.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/29/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import Foundation
import UIKit


extension SignUpViewController {
    
    func validateFields(inputName: String, inputLastName: String, inputEmail: String, inputPhone: String, inputPassword: String) -> Bool {
        var validateFields = false
        
        if validation.validateName(name: inputName) == false {
            nameErrorTextLabel.text = validationErrors.errorKey(.invalidFirstName) + validationErrors.errorKey(.validateName)
        }
        if validation.validateLastNAme(lastName: inputLastName) == false {
            lastNameErrorTextLabel.text = validationErrors.errorKey(.invalidLastName) + validationErrors.errorKey(.validateLastName)
        }
        if validation.validateMail(mail: inputEmail) == false {
            emailErrorTextLabel.text = validationErrors.errorKey(.invalidEmail) + validationErrors.errorKey(.validateMail)
        }
        if validation.validatePhone(phone: inputPhone) == false {
            phoneErrorTextLabel.text = validationErrors.errorKey(.invalidPhoneNumber) + validationErrors.errorKey(.invalidPhoneNumber)
        }
        if validation.validatePassword(password: inputPassword) == false {
            passwordErrorTextLabel.text = validationErrors.errorKey(.validatePassword)
        }
        if validation.validateName(name: inputName) == true && validation.validateLastNAme(lastName: inputLastName) == true && validation.validateMail(mail: inputEmail) == true && validation.validatePhone(phone: inputPhone) == true && validation.validatePassword(password: inputPassword) == true {
            validateFields = true
        }
        return validateFields
    }
}
