//
//  ProfileViewController.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/22/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var backArrowLeftImageView: UIImageView!
    
    @IBOutlet weak var profileInfoView: UIView!
    
    @IBOutlet weak var studentUserBlurImageView: UIImageView!
    
    @IBOutlet weak var editImageView: UIImageView!
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
    var student: [Courses] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profile = makeIteaStudents()[0]
        backgroundView(image: "profileBg", color: UIColor.red, alpha: 0.7)
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
        self.addNextButtonOnKeyboardAge()
        self.addNextButtonOnKeyboardPhone()
    }
    
    func showCancelButton(show: Bool) {
        if show == true {
            backButton.isHidden = true
            cancelButton.isHidden = false
            backArrowLeftImageView.isHidden = true
            lastCourseButton.isHidden = true
        } else {
            backButton.isHidden = false
            cancelButton.isHidden = true
            backArrowLeftImageView.isHidden = false
            lastCourseButton.isHidden = false
        }
    }
    
    

    @IBAction func didTapEditProfileActionButton(_ sender: Any) {
        showCancelButton(show: true)
        if editProfile == false {
            editProfile = true
            editProfileButton.setTitle("SAVE!", for: .normal)
            editImageView.isHidden = true
            updateStudentInfo(profile: profile, edit: editProfile, style: .roundedRect, color: UIColor.white)
        } else {
            let validation = validateEditProfile(inputName: nameTextField.text ?? "",
                                                            inputLastName: lastNameTextField.text ?? "",
                                                            inputMail: emailTextField.text ?? "",
                                                            inputPhone: phoneTextField.text ?? "")
            
            if validation == true {
                let saveAlertController = UIAlertController(title: "Внимание!", message: "Cохранить внесенные изменения?", preferredStyle: .alert)
                let saveAction = UIAlertAction(title: "Save", style: .default) { (_) in
                    self.saveStudentInfo()
                    
                    self.editProfile = false
                    self.editImageView.isHidden = false
                    self.updateStudentInfo(profile: self.profile, edit: self.editProfile, style: .none, color: UIColor.clear)
                    self.editProfileButton.setTitle("", for: .normal)
                    self.showCancelButton(show: false)
                }
                let cancseAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in
                    self.editProfile = false
                    self.editImageView.isHidden = false
                    self.updateStudentInfo(profile: self.profile, edit: self.editProfile, style: .none, color: UIColor.clear)
                    self.editProfileButton.setTitle("", for: .normal)
                }
                saveAlertController.addAction(cancseAction)
                saveAlertController.addAction(saveAction)
                present(saveAlertController, animated: true, completion: nil)
                
            } else {
                showAlertErrorAction(title: "Внимание!", message: "Поля заполнены неправильно!")
                
            }
        }
    }
    @IBAction func didTapCancelActionButton(_ sender: Any) {
       editProfile = false
       editImageView.isHidden = false
       editProfileButton.setTitle("", for: .normal)
       showCancelButton(show: false)
        updateStudentInfo(profile: profile, edit: editProfile, style: .none, color: UIColor.clear)
    }
    
    @IBAction func didTapGoBackActionButton(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }
    
    
    @IBAction func didTapLastCourse(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Profile", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "LastCoursesViewController") as! LastCoursesViewController
        viewController.recieveStudentInfo = profile
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
        lastNameTextField.textColor = UIColor.black
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
        
        if nameTextField.isEnabled == true {
            nameTextField.textColor = UIColor.black
        } else {
            nameTextField.textColor = UIColor.white
        }
        if lastNameTextField.isEnabled == true {
            lastNameTextField.textColor = UIColor.black
        } else {
            lastNameTextField.textColor = UIColor.white
        }
        
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
            nameValidationTextLabel.text = ""
        case lastNameTextField:
            lastNameValidationHeightConstraint.priority = UILayoutPriority(rawValue: 600)
            lastNameValidationTextLabel.text = ""
        case emailTextField:
            emailValidationErrorHeightConstraint.priority = UILayoutPriority(rawValue: 600)
            emailValidationTextLabel.text = ""
        case phoneTextField:
            phoneValidationErrorHeightConstraint.priority = UILayoutPriority(rawValue: 600)
            phoneValidationTextLabel.text = ""
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
        
        studentUserBlurImageView.image = UIImage(named: profile.userPicture ?? "noCourseImage")
        studentUserBlurImageView.contentMode = .scaleAspectFill
        studentUserBlurImageView.alpha = 0.1
        
//        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.systemUltraThinMaterialLight)
//        let blurEffectView = UIVisualEffectView(effect: blurEffect)
//               blurEffectView.frame = view.bounds
//               blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//
//
//               let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
//               backgroundImage.image = UIImage(named: backgroundPictureFromUser)
//               backgroundImage.contentMode = .scaleAspectFill
//
//               view.addSubview(blurEffectView)
//               view.addSubview(backgroundImage)
//               self.view.sendSubviewToBack(blurEffectView)
//               self.view.sendSubviewToBack(backgroundImage)

        lastCourseButton.clipsToBounds = true
        lastCourseButton.layer.backgroundColor = UIColor(red: 111/255, green: 169/255, blue: 145/255, alpha: 1).cgColor
        lastCourseButton.layer.cornerRadius = 12.0
        lastCourseButton.isOpaque = true
        lastCourseButton.layer.masksToBounds = false
        lastCourseButton.layer.shadowColor = UIColor.black.cgColor
        lastCourseButton.layer.shadowOpacity = 0.5
        lastCourseButton.layer.shadowOffset = CGSize(width: 10, height: 10)
        lastCourseButton.layer.shadowRadius = 12.0
        
        //

        studentImageView.image = UIImage(named: profile.userPicture ?? "noCourseImage")
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
        
//        profileInfoView
        
        let blurEffect = UIBlurEffect(style: .systemThickMaterialLight)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        blurView.clipsToBounds = true
        blurView.layer.cornerRadius = 12
        profileInfoView.insertSubview(blurView, at: 0)

        NSLayoutConstraint.activate([blurView.heightAnchor.constraint(equalTo: profileInfoView.heightAnchor), blurView.widthAnchor.constraint(equalTo: profileInfoView.widthAnchor),
        ])
        
        profileInfoView.layer.masksToBounds = false
        profileInfoView.layer.shadowColor = UIColor.black.cgColor
        profileInfoView.layer.shadowOpacity = 0.3
        profileInfoView.layer.shadowOffset = CGSize(width: 10, height: 10)
        profileInfoView.layer.shadowRadius = 6.0
        
        
        
    }
}
