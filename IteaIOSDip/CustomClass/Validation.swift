//
//  Validation.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/18/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

class Validation {
    
//  MARK: - VALIDATE NAME AND LAST NAME -
    func validateNameLastName(nameLastName: String) -> Bool {
        var validate = false
        if nameLastName.contains(" ") && nameLastName != "" && nameLastName.count > 5{
            validate = true
        }
        return validate
    }
    
//  MARK: - VALIDATE NAME -
    func validateName(name: String) -> Bool {
        var validate = false
        if name != "" && name.count > 2 {
            validate = true
        }
        return validate
    }
    
//  MARK: - VALIDATE LAST NAME -
    func validateLastNAme(lastName: String) -> Bool {
        var validate = false
        if lastName != "" && lastName.count > 2 {
            validate = true
        }
        return validate
    }

//  MARK: - VALIDATE AGE -
    func validateAge(age: Int) -> Bool {
        var validate = false
            if age >= 18 && age <= 100 {
                validate = true
            }
            return validate
        }
    
// MARK: - VALIDATE EMAIL -
    func validateMail(mail: String) -> Bool {
        var validate = false
        if mail.count > 8 && mail.contains("@") == true && mail.contains(".") {
            validate = true
        }
        return validate
    }
    
//  MARK: - VALIDATE PASSWORD -
    func validatePassword(password: String) -> Bool {
        var validate = false
        if password.count >= 5 && password.count <= 16 {
            validate = true
        }
        return validate
    }
    
// MARK: - VALIDATE PHONE NUMBER - 
    func validatePhone(phone: String) -> Bool {
        var validate = false
        if phone.count == 13 && phone.hasPrefix("+") {
            validate = true
        }
        return validate
    }
}
    

