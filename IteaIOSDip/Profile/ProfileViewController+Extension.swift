//
//  ProfileViewController+Extension.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/30/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

//  MARK: - UPDATE USER INFO FIELDS
extension ProfileViewController {
    
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
        workPlaceTextField.text = profile.workPlace
        
        for studentFlow in studentCourses {
            if let flow = studentFlow.courses {
                for courses in flow {
                    if courses.courseID == profile.studenCurrentCourse {
                        courentCourseTextField.text = courses.courseName
                    }
                }
            }
        }
           
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

//  MARK: - TEXT FIELD DELEGATE -
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

//  MARK: - VALIDATION -
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

//  MARK: - ALERT ACTION - 
extension ProfileViewController {
    func showAlertErrorAction(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel) { (_) in}
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
}

// MARK: - SHOW HIDE TOP BAR BUTTONS
extension ProfileViewController {
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
}

//  MARK: - ADD NEXT BUTTON TO KEYBOARD -
extension ProfileViewController {
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
        cityTextField.becomeFirstResponder()
    }
        
    @objc func nextButtonActionPhone() {
        courentCourseTextField.becomeFirstResponder()
    }
}

// MARK: - FIND AND COMPARE FROM ALL COURSES -> STUDENT COURSES - SHITCODE -
extension ProfileViewController {
    
   func makeStudentCourses(courses: [CourseFlow], student: IteaStudent) -> [StudentCourses] {
        let nextCourses = StudentCourses()
        nextCourses.courseProgress = "Следующие Курсы"
        let currentCourse = StudentCourses()
        currentCourse.courseProgress = "Текущий Курс"
        let lastCourses = StudentCourses()
        lastCourses.courseProgress = "Пройденные Курсы"
            
        var nextCoursesArray: [Courses] = []
        var currentCoursesArray: [Courses] = []
        var lastCoursesArray: [Courses] = []
        
        var current = ""
        var next = ""
        var last: [String] = []
            
        if let some = student.studenCurrentCourse {
            current = some
        }
        if let some = student.studentNextCourse {
            next = some
        }
        if let some = student.studentLastCourses {
            last = some
        }
            
        for someNewCourses in courses {
            if someNewCourses.isProgrammingLanguage == true {
                if let flow = someNewCourses.programmingFlow {
                    for items in flow {
                        if let subFlow = items.courses {
                            for someNewItems in subFlow {
                                if current == someNewItems.courseID {
                                    currentCoursesArray.append(someNewItems)
                                }
                                if next == someNewItems.courseID {
                                    nextCoursesArray.append(someNewItems)
                                }
                                for items in last {
                                    if items == someNewItems.courseID {
                                        lastCoursesArray.append(someNewItems)
                                    }
                                }
                            }
                            
                        }
                    }
                }
            } else {
                for iteaCourses in courses {
                    if let studentCourses = iteaCourses.courses {
                        for someCourse in studentCourses {
                            if current == someCourse.courseID {
                                currentCoursesArray.append(someCourse)
                            }
                            if next == someCourse.courseID {
                                nextCoursesArray.append(someCourse)
                            }
                            for items in last {
                                if items == someCourse.courseID {
                                    lastCoursesArray.append(someCourse)
                                }
                            }
                        }
                    }
                }
            }
        }
        nextCourses.courses = nextCoursesArray
        lastCourses.courses = lastCoursesArray
        currentCourse.courses = currentCoursesArray
        return [currentCourse, nextCourses, lastCourses ]
    }
}

//  MARK: - UPDATE UI ELEMENTS -
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

        profileInfoView.layer.masksToBounds = false
        profileInfoView.layer.shadowColor = UIColor.black.cgColor
        profileInfoView.layer.shadowOpacity = 0.3
        profileInfoView.layer.shadowOffset = CGSize(width: 10, height: 10)
        profileInfoView.layer.shadowRadius = 6.0
    }
}
