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
    
    @IBAction func didTapSignUpActionButton(_ sender: Any) {
        if checkPolicy == true {
            
            if passwordTextField.text == confirmPasswordTextField.text {
                validate = validateFields(inputName: nameTextField.text ?? "",
                                          inputLastName: lastNameTextField.text ?? "",
                inputEmail: emailTextField.text ?? "",
                inputPhone: phoneTextField.text ?? "",
                inputPassword: passwordTextField.text ?? "")
        
                if let _ = iteaStudent.firstIndex(where: {$0.mail == emailTextField.text}) {
//                aler with this user exist
                } else {
                     if validate == true {
                                        let storyboard = UIStoryboard(name: "Authorization", bundle: nil)
                                        let viewController = storyboard.instantiateViewController(withIdentifier: "AuthenticationViewController") as! AuthenticationViewController
                        
                        viewController.newStudent = addNewStudent(inputName: <#T##String#>, inputLastName: <#T##String#>, inputAge: <#T##Int#>, inputMail: <#T##String#>, inputPhone: <#T##String#>, inputCity: <#T##String#>, inputPassword: <#T##String#>)
                                        
                    //                    viewController.newStudent = addNewStudent(inputName: nameTextField.text ?? "", inputLastName: lastNameTextField.text ?? "",
                    //                                                                        inputAge: Int(ageTextField.text ?? "",
                    //                                                                        inputMail: emailTextField.text ?? "",
                    //                                                                        inputPhone: phoneTextField.text ?? "",
                    //                                                                        inputCity: cityTextField.text ?? "",
                    //                                                                        inputPassword: passwordTextField.text ?? "")
                                        navigationController?.pushViewController(viewController, animated: true)
                                        
                              
                                        
                    //                    aler registration and go to the sighn up
                                    } else {
                    //                    alert ошибка валидации полей
                                    }

                }
                
            } else {
//                не совпадают пароли
            }
            
        } else {
//            "Oзнакомтесь с политекой конфиденциальности" alert
        }
        
        

        
    }
    
}

extension SignUpViewController {
    func errorAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel) { (_) in
        }
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
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
            nameWhiteHeightConstraint.priority = UILayoutPriority(rawValue: 900)
            nameErrorTextLabel.text = ""
        case lastNameTextField:
            lastNameWhiteHeightConstraint.priority = UILayoutPriority(rawValue: 900)
            lastNameErrorTextLabel.text = ""
        case emailTextField:
            emailWhiteHeightConstraint.priority = UILayoutPriority(rawValue: 900)
            emailErrorTextLabel.text = ""
        case phoneTextField:
            phoneWhiteHeightConstraint.priority = UILayoutPriority(rawValue: 900)
            phoneErrorTextLabel.text = ""
        case ageTextField:
            ageWhiteHeightConstraint.priority = UILayoutPriority(rawValue: 900)
        case cityTextField:
            cityWhiteHeightConstraint.priority = UILayoutPriority(rawValue: 900)
            cityErrorTextLabel.text = ""
        case passwordTextField:
            passwordWhiteHeightConstraint.priority = UILayoutPriority(rawValue: 900)
            passwordErrorTextLabel.text = ""
        case confirmPasswordTextField:
            passwordWhiteHeightConstraint.priority = UILayoutPriority(rawValue: 900)
            confirmPasswordErrorTextLabel.text = ""
        default:
            nameWhiteHeightConstraint.priority = UILayoutPriority(rawValue: 600)
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case nameTextField:
            nameWhiteHeightConstraint.priority = UILayoutPriority(rawValue: 600)
        case lastNameTextField:
            lastNameWhiteHeightConstraint.priority = UILayoutPriority(rawValue: 600)
        case emailTextField:
            emailWhiteHeightConstraint.priority = UILayoutPriority(rawValue: 600)
        case phoneTextField:
            phoneWhiteHeightConstraint.priority = UILayoutPriority(rawValue: 600)
        case ageTextField:
            ageWhiteHeightConstraint.priority = UILayoutPriority(rawValue: 600)
        case cityTextField:
            cityWhiteHeightConstraint.priority = UILayoutPriority(rawValue: 600)
        case passwordTextField:
            passwordWhiteHeightConstraint.priority = UILayoutPriority(rawValue: 600)
        case confirmPasswordTextField:
            passwordWhiteHeightConstraint.priority = UILayoutPriority(rawValue: 600)
        default:
            nameWhiteHeightConstraint.priority = UILayoutPriority(rawValue: 600)
        }
    }
    
    
    
    
    
}



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
        
        
        
        
        
        
        
        
    }
}











extension SignUpViewController {
    func updateSignUpUI() {
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
        
        policyTextLabel.text = """
        Подписанием и отправкой настоящей заявки я подтверждаю, что я ознакомлен с
        Политикой конфиденциальности и принимаю ее условия, включая регламентирующие обработку моих персональных данных, и согласен с ней.
        """
        policyImageView.image = UIImage(systemName: "square")
        
        
        
}
   
       
   

}
extension SignUpViewController {
    
    @objc func keyboardWillHide() {
        bottomHeightConstraint.constant = 0
        self.view.endEditing(true)
    }
}


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
