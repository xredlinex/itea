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
        backgroundView(image: "backgroundlogin", color: UIColor.red, alpha: 0.8)
        updateAuthUi()
        signUpButtonView.blurbuttons()
        logInButtonView.blurbuttons()
        
        let recieveUsers = makeIteaStudents()
        iteaStudents = checkStudents(students: recieveUsers)
        iteaStudents.append(newStudent)
        
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
        viewController.recieveData = iteaStudents
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






    





















