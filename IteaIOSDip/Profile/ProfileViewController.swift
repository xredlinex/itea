//
//  ProfileViewController.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/22/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    
    
    
    @IBOutlet weak var editProfileButton: UIButton!
    @IBOutlet weak var viewForStudentView: UIView!
    @IBOutlet weak var studentImageView: UIImageView!
    @IBOutlet weak var nameStudentView: UIView!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var birhdayTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var courentCourseTextField: UITextField!
    @IBOutlet weak var workPlaceTextField: UITextField!
    @IBOutlet weak var nameValidationTextLabel: UILabel!
    
    @IBOutlet weak var lastNameValidationTextLabel: UILabel!
    
    @IBOutlet weak var ageValidationTextLabel: UILabel!
    @IBOutlet weak var cityValidationTextLabel: UILabel!
    @IBOutlet weak var birthdayValidationTextLabel: UILabel!
    @IBOutlet weak var emailValidationTextLabel: UILabel!
    @IBOutlet weak var lastCourseButton: UIButton!
    @IBOutlet weak var phoneValidationTextLabel: UILabel!
    @IBOutlet weak var curentCourseValidationTextLabel: UILabel!
    @IBOutlet weak var workPlaceValidationTextLabel: UILabel!
    @IBOutlet weak var nameValidationErrorHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var lastNameValidationHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var ageValidationErrorHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var cityValidationErrorHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var birthdayValidationErrorHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var emailValidationErrorHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var phoneValidationErrorHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var currentCourseValidationErrorHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var workValidationErrorHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var bottomHeightConstraint: NSLayoutConstraint!
    
    var profile = IteaStudent()
    var editProfile = false
    var validation = Validation()
    var validationErrors = ValidationErrors()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profile = makeIteaStudents()[0]

        updateProfileUI()
        updateStudentInfo(profile: profile,edit: editProfile, style: .none, color: UIColor.clear)
        
        
        nameTextField.delegate = self
        lastNameTextField.delegate = self
        ageTextField.delegate = self
        cityTextField.delegate = self
        birhdayTextField.delegate = self
        emailTextField.delegate = self
        phoneTextField.delegate = self
        courentCourseTextField.delegate = self
        workPlaceTextField.delegate = self
        
        let keyboardHide = UITapGestureRecognizer(target: self, action: #selector(keyboardWillHide))
        view.addGestureRecognizer(keyboardHide)
        
    }
    

    @IBAction func didTapEditProfileActionButton(_ sender: Any) {
        if editProfile == false {
            editProfile = true
            editProfileButton.setTitle("сохранить", for: .normal)
            updateStudentInfo(profile: profile, edit: editProfile, style: .roundedRect, color: UIColor.white)
        } else {
            let validation = validateEditProfile(inputName: nameTextField.text ?? "",
                                                            inputLastName: lastNameTextField.text ?? "",
                                                            inputMail: emailTextField.text ?? "",
                                                            inputPhone: phoneTextField.text ?? "")
            
            if validation == true {
                let saveAlertController = UIAlertController(title: "Внимание!", message: "Cохранить внесенные изменения?", preferredStyle: .alert)
                let saveAction = UIAlertAction(title: "Save", style: .default) { (_) in
                    self.editProfile = false
                    self.saveStudentInfo()
                    self.updateStudentInfo(profile: self.profile, edit: self.editProfile, style: .none, color: UIColor.clear)
                    self.editProfileButton.setTitle("редактировать", for: .normal)
                }
                let cancseAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in
                    self.editProfile = false
                    self.updateStudentInfo(profile: self.profile, edit: self.editProfile, style: .none, color: UIColor.clear)
                    self.editProfileButton.setTitle("редактировать", for: .normal)
                }
                saveAlertController.addAction(cancseAction)
                saveAlertController.addAction(saveAction)
                present(saveAlertController, animated: true, completion: nil)
                
            } else {
                showAlertErrorAction(title: "Внимание!", message: "Поля заполнены неправильно!")
                
            }
        }
    }
    
    @IBAction func didTapGoBackActionButton(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }
    
    
    @IBAction func didTapLastCourse(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Profile", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "LastCoursesViewController") as! LastCoursesViewController
        
        navigationController?.pushViewController(viewController, animated: true)
        
        
    }
    
    func saveStudentInfo() {
        
        profile.name = nameTextField.text
        profile.lastName = lastNameTextField.text
        profile.age = Int(ageTextField.text ?? "0")
        profile.city = cityTextField.text
        profile.birthday = birhdayTextField.text
        profile.mail = emailTextField.text
        profile.phoneNumber = phoneTextField.text
        profile.studenCurrentCourse = courentCourseTextField.text
        profile.workPlace = workPlaceTextField.text
        
    }
    
    
    
    func updateStudentInfo(profile: IteaStudent, edit: Bool, style: UITextField.BorderStyle, color: UIColor) {
        
        nameTextField.text = profile.name
        lastNameTextField.text = profile.lastName
        ageTextField.text = "\(profile.age ?? 0)"
        cityTextField.text = profile.city
        birhdayTextField.text = profile.birthday
        emailTextField.text = profile.mail
        phoneTextField.text = profile.phoneNumber
        courentCourseTextField.text = profile.studenCurrentCourse
        workPlaceTextField.text = profile.workPlace
        
        nameTextField.isEnabled = edit
        lastNameTextField.isEnabled = edit
        ageTextField.isEnabled = edit
        cityTextField.isEnabled = edit
        birhdayTextField.isEnabled = edit
        emailTextField.isEnabled = edit
        phoneTextField.isEnabled = edit
        courentCourseTextField.isEnabled = edit
        workPlaceTextField.isEnabled = edit
        
        
        nameTextField.borderStyle = style
        nameTextField.backgroundColor = color
        lastNameTextField.borderStyle = style
        lastNameTextField.backgroundColor = color
        ageTextField.borderStyle = style
        ageTextField.backgroundColor = color
        cityTextField.borderStyle = style
        cityTextField.backgroundColor = color
        birhdayTextField.borderStyle = style
        birhdayTextField.backgroundColor = color
        emailTextField.borderStyle = style
        emailTextField.backgroundColor = color
        phoneTextField.borderStyle = style
        phoneTextField.backgroundColor = color
        courentCourseTextField.borderStyle = style
        courentCourseTextField.backgroundColor = color
        workPlaceTextField.borderStyle = style
        workPlaceTextField.backgroundColor = color
        
    }
}

extension ProfileViewController {
    
    @objc func keyboardWillHide() {
        bottomHeightConstraint.constant = 0
        self.view.endEditing(true)
    }
}

extension ProfileViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        bottomHeightConstraint.constant = 270
        return true
    }
    

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
        case nameTextField:
            lastNameTextField.becomeFirstResponder()
        case lastNameTextField:
            ageTextField.becomeFirstResponder()
        case ageTextField:
            cityTextField.becomeFirstResponder()
        case cityTextField:
            birhdayTextField.becomeFirstResponder()
        case birhdayTextField:
            emailTextField.becomeFirstResponder()
        case emailTextField:
            phoneTextField.becomeFirstResponder()
        case phoneTextField:
            courentCourseTextField.becomeFirstResponder()
        case courentCourseTextField:
            workPlaceTextField.becomeFirstResponder()
        case workPlaceTextField:
            workPlaceTextField.resignFirstResponder()
             bottomHeightConstraint.constant = 0
        default:
            nameTextField.becomeFirstResponder()
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case nameTextField:
            nameValidationErrorHeightConstraint.priority = UILayoutPriority(rawValue: 600)
        case lastNameTextField:
            lastNameValidationHeightConstraint.priority = UILayoutPriority(rawValue: 600)
        case emailTextField:
            emailValidationErrorHeightConstraint.priority = UILayoutPriority(rawValue: 600)
        case phoneTextField:
            phoneValidationErrorHeightConstraint.priority = UILayoutPriority(rawValue: 600)
        default:
            nameValidationErrorHeightConstraint.priority = UILayoutPriority(rawValue: 600)
        }
        
    }
}


extension ProfileViewController {
    
    func validateEditProfile(inputName: String, inputLastName: String, inputMail: String, inputPhone: String) -> Bool {
        var validateFields = false
        
        if validation.validateName(name: inputName) == false {
            nameValidationTextLabel.text = validationErrors.errorKey(.invalidFirstName) + validationErrors.errorKey(.validateName)
            nameValidationErrorHeightConstraint.priority = UILayoutPriority(rawValue: 900)
        }
        if validation.validateLastNAme(lastName: inputLastName) == false {
            lastNameValidationTextLabel.text = validationErrors.errorKey(.invalidLastName) + validationErrors.errorKey(.validateLastName)
            lastNameValidationHeightConstraint.priority = UILayoutPriority(rawValue: 900)
        }
        if validation.validateMail(mail: inputMail) == false {
            emailValidationTextLabel.text = validationErrors.errorKey(.invalidEmail) + validationErrors.errorKey(.validateMail)
            emailValidationErrorHeightConstraint.priority = UILayoutPriority(rawValue: 900)
        }
        if validation.validatePhone(phone: inputPhone) == false {
            phoneValidationTextLabel.text = validationErrors.errorKey(.invalidPhoneNumber) + validationErrors.errorKey(.validatePhone)
            phoneValidationErrorHeightConstraint.priority = UILayoutPriority(rawValue: 900)
        }
        if validation.validateName(name: inputName) == true && validation.validateLastNAme(lastName: inputLastName) == true &&  validation.validateMail(mail: inputMail) == true && validation.validatePhone(phone: inputPhone) == true {
            validateFields = true
        }
        return validateFields
        
    }
    
    
    
    
    
    
}


extension ProfileViewController {
    func showAlertErrorAction(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel) { (_) in}
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
}



extension ProfileViewController {
    
    func updateProfileUI() {
        
        
        viewForStudentView.clipsToBounds = true
        viewForStudentView.layer.masksToBounds = false
        viewForStudentView.layer.cornerRadius = viewForStudentView.frame.width / 2
        viewForStudentView.layer.shadowColor = UIColor.black.cgColor
        viewForStudentView.layer.shadowOffset = CGSize(width: 3, height: 3)
        viewForStudentView.layer.shadowRadius = 12.0
        viewForStudentView.layer.shadowOpacity = 0.4

        studentImageView.image = UIImage(named: "noCourseImage")
        studentImageView.clipsToBounds = true
        studentImageView.contentMode = .scaleAspectFill
        studentImageView.layer.cornerRadius = studentImageView.frame.width / 2
        studentImageView.layer.borderColor = UIColor.red.cgColor
        studentImageView.layer.borderWidth = 2

        nameStudentView.clipsToBounds = true
        nameStudentView.layer.masksToBounds = false
        nameStudentView.layer.cornerRadius = 12.0
        nameStudentView.layer.shadowColor = UIColor.black.cgColor
        nameStudentView.layer.shadowOffset = CGSize(width: 10, height: 10)
        nameStudentView.layer.shadowRadius = 30.0
        nameStudentView.layer.shadowOpacity = 0.4
        
    }
}
