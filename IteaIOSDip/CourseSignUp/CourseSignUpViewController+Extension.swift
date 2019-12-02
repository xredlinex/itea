//
//  CourseSignUpViewController+Extension.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/29/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

extension CourseSignUpViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        bottomHeightConstraint.constant = 250
        switch textField {
        case nameTextField:
            texFieldBorderLine(view: nameBorderView, thickView: nameWhiteLineView, edit: true)
        case mailTextField:
            texFieldBorderLine(view: mailBorderView, thickView: mailWhiteLineView, edit: true)
        case phoneNumberTextField:
            texFieldBorderLine(view: phoneBorderView, thickView: phoneWhiteLineView, edit: true)
        default:
            texFieldBorderLine(view: nameBorderView, thickView: nameWhiteLineView, edit: false)
            texFieldBorderLine(view: mailBorderView, thickView: mailWhiteLineView, edit: false)
            texFieldBorderLine(view: phoneBorderView, thickView: phoneWhiteLineView, edit: false)
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameTextField:
            mailTextField.becomeFirstResponder()
        case mailTextField:
            phoneNumberTextField.becomeFirstResponder()
        case phoneNumberTextField:
            phoneNumberTextField.resignFirstResponder()
            bottomHeightConstraint.constant = 0
        default:
            nameTextField.becomeFirstResponder()
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case nameTextField:
            nameTextLabelErrorHeightConstraint.priority = UILayoutPriority(rawValue: 600)
            nameValidationErrorTextLabel.text = ""
        case mailTextField:
            emailTextLabelErrorHeightConstraint.priority = UILayoutPriority(rawValue: 600)
            mailValidationErrorTextLabel.text = ""
        case phoneNumberTextField:
            phoneTextLabelErrorHeightConstraint.priority = UILayoutPriority(rawValue: 600)
            phoneValidationErrorTextLabel.text = ""
        default:
            nameTextLabelErrorHeightConstraint.priority = UILayoutPriority(rawValue: 600)
            emailTextLabelErrorHeightConstraint.priority = UILayoutPriority(rawValue: 600)
            phoneTextLabelErrorHeightConstraint.priority = UILayoutPriority(rawValue: 600)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case nameTextField:
            texFieldBorderLine(view: nameBorderView, thickView: nameWhiteLineView, edit: false)
            nameTextLabelErrorHeightConstraint.priority = UILayoutPriority(rawValue: 600)
        case mailTextField:
            texFieldBorderLine(view: mailBorderView, thickView: mailWhiteLineView, edit: false)
            emailTextLabelErrorHeightConstraint.priority = UILayoutPriority(rawValue: 600)
        case phoneNumberTextField:
            texFieldBorderLine(view: phoneBorderView, thickView: phoneWhiteLineView, edit: false)
            phoneTextLabelErrorHeightConstraint.priority = UILayoutPriority(rawValue: 600)
        default:
            texFieldBorderLine(view: nameBorderView, thickView: nameWhiteLineView, edit: false)
            texFieldBorderLine(view: mailBorderView, thickView: mailWhiteLineView, edit: false)
            texFieldBorderLine(view: phoneBorderView, thickView: phoneWhiteLineView, edit: false)
        }
    }
}

extension CourseSignUpViewController {
    func signUpCourse(course: Courses, location: String) {
        kommentsTextView.text = "Я хочу записаться на курсы \(course.courseName ?? ""), локация \(location)"
    }
}

//  MARK: - VALIDATION -
extension CourseSignUpViewController {
    func validateCourseSignUpFields(inputName: String, inputMail: String, inputPhone: String) -> Bool {
        var validateFields = false
        if validation.validateNameLastName(nameLastName: inputName) == false {
            nameTextLabelErrorHeightConstraint.priority = UILayoutPriority(rawValue: 900)
            nameValidationErrorTextLabel.text = validationErrors.errorKey(.invalidFirstNameLastName)
            validateErrorCheck()
        }
        if validation.validateMail(mail: inputMail) == false {
            emailTextLabelErrorHeightConstraint.priority = UILayoutPriority(rawValue: 900)
            mailValidationErrorTextLabel.text = validationErrors.errorKey(.invalidEmail)
            validateErrorCheck()
        }
        if validation.validatePhone(phone: inputPhone) == false {
            phoneTextLabelErrorHeightConstraint.priority = UILayoutPriority(rawValue: 900)
            phoneValidationErrorTextLabel.text = validationErrors.errorKey(.invalidPhoneNumber)
            validateErrorCheck()
        }
        if validation.validateNameLastName(nameLastName: inputName) == true && validation.validateMail(mail: inputMail) == true &&  validation.validatePhone(phone: inputPhone) == true {
            validateFields = true
        }
        return validateFields
    }
    
    func validateErrorCheck() {
        checkPolicuy = false
        chekBoxImageView.image = UIImage(systemName: "square")
    }
}

//  MARK: - TEXT VIEW DELEGATE - 
extension CourseSignUpViewController: UITextViewDelegate {
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        bottomHeightConstraint.constant = 250
        return true
    }
}

//  MARK: - SET LOCATION / RADIO BUTTONS / ETC
extension CourseSignUpViewController {
    
    func setDefaultLocation(_ location: Int) {
        firstLocationTextLabel.text = "Берестейская"
        secondLocationTextLabel.text = "Позняки"
        thirdLocationTextLabel.text = "ВДНХ"
        
        switch location {
        case 1:
            courseLocation = firstLocationTextLabel.text ?? ""
            firstLocationTextLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
            secondLocationTextLabel.font = UIFont.systemFont(ofSize: 16)
            thirdLocationTextLabel.font = UIFont.systemFont(ofSize: 16)
            firstLocationCheckImageView.image = UIImage(systemName: "largecircle.fill.circle")
            secondLocationCheckImageView.image = UIImage(systemName: "circle")
            thirdLocationCheckImageView.image = UIImage(systemName: "circle")
        case 2:
            courseLocation = secondLocationTextLabel.text ?? ""
            firstLocationTextLabel.font = UIFont.systemFont(ofSize: 16)
            secondLocationTextLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
            thirdLocationTextLabel.font = UIFont.systemFont(ofSize: 16)
            firstLocationCheckImageView.image = UIImage(systemName: "circle")
            secondLocationCheckImageView.image = UIImage(systemName: "largecircle.fill.circle")
            thirdLocationCheckImageView.image = UIImage(systemName: "circle")
        case 3:
            courseLocation = thirdLocationTextLabel.text ?? ""
            firstLocationTextLabel.font = UIFont.systemFont(ofSize: 16)
            secondLocationTextLabel.font = UIFont.systemFont(ofSize: 16)
            thirdLocationTextLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
            firstLocationCheckImageView.image = UIImage(systemName: "circle")
            secondLocationCheckImageView.image = UIImage(systemName: "circle")
            thirdLocationCheckImageView.image = UIImage(systemName: "largecircle.fill.circle")
        default:
            courseLocation = firstLocationTextLabel.text ?? ""
            firstLocationTextLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
            secondLocationTextLabel.font = UIFont.systemFont(ofSize: 16)
            thirdLocationTextLabel.font = UIFont.systemFont(ofSize: 16)
            firstLocationCheckImageView.image = UIImage(systemName: "largecircle.fill.circle")
            secondLocationCheckImageView.image = UIImage(systemName: "circle")
            thirdLocationCheckImageView.image = UIImage(systemName: "circle")
        }
        kommentsTextView.text = "Я хочу записаться на курсы \(course.courseName ?? ""), локация \(courseLocation)."
    }
}

//  MARK: - BORDER IS TRUE OR FALSE -
extension CourseSignUpViewController {
    func texFieldBorderLine(view: UIView, thickView: UIView, edit: Bool) {
        if edit == true {
            view.layer.borderWidth = 1
            view.layer.borderColor = UIColor.white.cgColor
            thickView.layer.backgroundColor = UIColor.clear.cgColor
        } else {
            view.layer.borderWidth = 0
            view.layer.borderColor = UIColor.clear.cgColor
            thickView.layer.backgroundColor = UIColor.white.cgColor
        }
    }
}

//  MARK: - ADD BUTTONS TO NUM KEYBARD - 
extension CourseSignUpViewController {
    func addNextButtonOnKeyboardPhone() {
        let nextToolBar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        nextToolBar.barStyle = .default
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let next = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(nextButtonActionPhone))
        let item = [flexSpace, next]
        nextToolBar.items = item
        nextToolBar.sizeToFit()
        phoneNumberTextField.inputAccessoryView = nextToolBar
    }
    @objc func nextButtonActionPhone() {
        phoneNumberTextField.resignFirstResponder()
    }
}

//  MARK: - ALERT ACTION -
extension CourseSignUpViewController {
    func errorAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel) { (_) in}
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
}
