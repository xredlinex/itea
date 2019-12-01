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
    @IBOutlet weak var lastCourseButton: UIButton!
    @IBOutlet weak var logOutButton: UIButton!
    @IBOutlet weak var editProfileButton: UIButton!
    @IBOutlet weak var backArrowLeftImageView: UIImageView!
    @IBOutlet weak var studentUserBlurImageView: UIImageView!
    @IBOutlet weak var studentImageView: UIImageView!
    @IBOutlet weak var profileInfoView: UIView!
    @IBOutlet weak var viewForStudentView: UIView!
    @IBOutlet weak var nameStudentView: UIView!
    @IBOutlet weak var editImageView: UIImageView!
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
    var flow: [CourseFlow] = []
    var studentCourses = [StudentCourses]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profile = makeIteaStudents()[0]
        
        flow = IteaCourse().makeCoursesFlow()
        studentCourses = makeStudentCourses(courses: flow, student: profile)
        updateStudentInfo(profile: profile,edit: editProfile, style: .none, color: UIColor.clear)
        backgroundView(image: "profileBg", color: UIColor.red, alpha: 0.7)
        updateProfileUI()
        lastCourseButton.iteaButton()
        logOutButton.iteaButton()
        profileInfoView.blurbuttons()
        
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
        viewController.recieveCourses = studentCourses
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func didTapLogOutButton(_ sender: Any) {
        let logOutAlert = UIAlertController(title: "Log Out?", message: "Хотите выйти из аккаунта?", preferredStyle: .alert)
        let logOutAction = UIAlertAction(title: "Yes", style: .default) { (_) in
            let storuboard = UIStoryboard(name: "Aauthorization", bundle: nil)
            let viewController = storuboard.instantiateViewController(withIdentifier: "AuthenticationViewController") as! AuthenticationViewController
            self.navigationController?.pushViewController(viewController, animated: false)
        }
        let cancelAction = UIAlertAction(title: "No", style: .cancel) { (_) in}
        logOutAlert.addAction(logOutAction)
        logOutAlert.addAction(cancelAction)
        present(logOutAlert, animated: true, completion: nil)
    }
}

extension ProfileViewController {
    @objc func keyboardWillHide() {
        bottomHeightConstraint.constant = 0
        self.view.endEditing(true)
    }
}
