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
    var iteaStudent: [IteaStudent] = []
    var recieveData: [IteaStudent] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        iteaStudent = recieveData
        backgroundView(image: "filterBackground", color: UIColor.red, alpha: 0.8)
        updateSignUpUI()
        signUpButtonView.blurbuttons()
        
        nameTextField.delegate = self
        lastNameTextField.delegate = self
        emailTextField.delegate = self
        phoneTextField.delegate = self
        ageTextField.delegate = self
        cityTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self

        let keyboardHide = UITapGestureRecognizer(target: self, action: #selector(keyboardWillHide))
        view.addGestureRecognizer(keyboardHide)
    }
    
    @IBAction func didTapGoBackActionButton(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }
    
    @IBAction func didTapCheckPolicyActionButton(_ sender: Any) {
        policyImageView.image = UIImage(systemName: "checkmark.square")
        checkPolicy = true
    }
    
//    MARK: - VERY IMPORTANT SIGN IN BUTTON -
    @IBAction func didTapSignUpActionButton(_ sender: Any) {
        if checkPolicy == true {
            if passwordTextField.text == confirmPasswordTextField.text {
                validate = validateFields(inputName: nameTextField.text ?? "",
                                          inputLastName: lastNameTextField.text ?? "",
                                          inputEmail: emailTextField.text ?? "",
                                          inputPhone: phoneTextField.text ?? "",
                                          inputPassword: passwordTextField.text ?? "")
                if let _ = iteaStudent.firstIndex(where: {$0.mail == emailTextField.text}) {
                    errorAlert(title: validationErrors.errorKey(.error), message: validationErrors.errorKey(.emailExists))
                    validateError()
                } else {
                     if validate == true {
                        let storyboard = UIStoryboard(name: "Aauthorization", bundle: nil)
                        let viewController = storyboard.instantiateViewController(withIdentifier: "AuthenticationViewController") as! AuthenticationViewController
                        viewController.newStudent = addNewStudent(inputName: nameTextField.text ?? "",
                                                                  inputLastName: lastNameTextField.text ?? "",
                                                                  inputAge: Int(ageTextField.text ?? "") ?? 0,
                                                                  inputMail: emailTextField.text ?? "",
                                                                  inputPhone: phoneTextField.text ?? "",
                                                                  inputCity: cityTextField.text ?? "",
                                                                  inputPassword: passwordTextField.text ?? "")
                        errorAlert(title: "Спасибо!", message: "Новый пользователь зарегистрирован успешно!")
                        navigationController?.pushViewController(viewController, animated: true)
                    } else {
                        errorAlert(title: validationErrors.errorKey(.error), message: validationErrors.errorKey(.validationError))
                    }
                }
            } else {
                errorAlert(title: validationErrors.errorKey(.error), message: validationErrors.errorKey(.passwordNotMatch))
            }
        } else {
            errorAlert(title: validationErrors.errorKey(.error), message: validationErrors.errorKey(.invalidPolicy))
        }
    }
}

extension SignUpViewController {
    
    @objc func keyboardWillHide() {
        bottomHeightConstraint.constant = 0
        self.view.endEditing(true)
    }
}
