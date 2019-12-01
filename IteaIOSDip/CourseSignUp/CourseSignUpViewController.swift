//
//  CourseSignUpViewController.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/22/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

class CourseSignUpViewController: UIViewController {

    @IBOutlet weak var headerLogoImageView: UIImageView!
    @IBOutlet weak var signInTextLabel: UILabel!
    @IBOutlet weak var nameBorderView: UIView!
    @IBOutlet weak var mailBorderView: UIView!
    @IBOutlet weak var phoneBorderView: UIView!
    @IBOutlet weak var nameWhiteLineView: UIView!
    @IBOutlet weak var mailWhiteLineView: UIView!
    @IBOutlet weak var phoneWhiteLineView: UIView!
    @IBOutlet weak var locationBorderView: UIView!
    @IBOutlet weak var firstLocationCheckImageView: UIImageView!
    @IBOutlet weak var secondLocationCheckImageView: UIImageView!
    @IBOutlet weak var thirdLocationCheckImageView: UIImageView!
    @IBOutlet weak var firstLocationTextLabel: UILabel!
    @IBOutlet weak var secondLocationTextLabel: UILabel!
    @IBOutlet weak var thirdLocationTextLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var kommentsTextView: UITextView!
    @IBOutlet weak var nameValidationErrorTextLabel: UILabel!
    @IBOutlet weak var mailValidationErrorTextLabel: UILabel!
    @IBOutlet weak var phoneValidationErrorTextLabel: UILabel!
    @IBOutlet weak var nameTextLabelErrorHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var emailTextLabelErrorHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var phoneTextLabelErrorHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var bottomHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var chekBoxImageView: UIImageView!
    @IBOutlet weak var privicyTextLabel: UILabel!
    
    var checkPolicuy = false
    var validate = false
    var validation = Validation()
    var courseLocation = ""
    var course = Courses()
    var recieveCourse = Courses()
    var validationErrors = ValidationErrors()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiCourseSignUp()
        signUpButton.iteaButton()
        
        setDefaultLocation(0)
        course = recieveCourse
        signUpCourse(course: course, location: courseLocation)

//  MARK: - KEYBOARD HIDE
        let keyboardHide = UITapGestureRecognizer(target: self, action: #selector(keyboardWillHide))
        view.addGestureRecognizer(keyboardHide)
        nameTextField.delegate = self
        mailTextField.delegate = self
        phoneNumberTextField.delegate = self
        self.addNextButtonOnKeyboardPhone()
       
    }
    @IBAction func didTapSignUpButton(_ sender: Any) {
        
        if checkPolicuy == true {
            if nameTextField.text != "" && mailTextField.text != "" && phoneNumberTextField.text != "" {
                validate = validateCourseSignUpFields(inputName: nameTextField.text ?? "",
                                                      inputMail: mailTextField.text ?? "",
                                                      inputPhone: phoneNumberTextField.text ?? "")
                if validate == true {
                    errorAlert(title: "Спасибо", message: "Вы записались на курс \(course.courseName ?? "")!")
                    let storyboard = UIStoryboard(name: "Courses", bundle: nil)
                    let viewController = storyboard.instantiateViewController(withIdentifier: "CoursesFlowViewController") as! CoursesFlowViewController
                    navigationController?.pushViewController(viewController, animated: true)
                } else {
                    errorAlert(title: "Внимание!", message: validationErrors.errorKey(.validationError))
                }
            } else {
                errorAlert(title: "Хотите на курсы?", message: "Заполните все поля")
            }
        }
        else {
            errorAlert(title: validationErrors.errorKey(.error), message: validationErrors.errorKey(.invalidPolicy))
        }
    }
    
    @IBAction func didTapGoBackActionButton(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }
    @IBAction func didTapSelectFirstLocationActionButton(_ sender: Any) {
        setDefaultLocation(1)
    }
    
    @IBAction func didTapSelectSecondLocationActionButton(_ sender: Any) {
        setDefaultLocation(2)
    }
    
    @IBAction func didTapSelectThidLocationActionButton(_ sender: Any) {
        setDefaultLocation(3)
    }
    
    @IBAction func didTapCheckboxActionButton(_ sender: Any) {
        chekBoxImageView.image = UIImage(systemName: "checkmark.square")
        checkPolicuy = true
    }
}







extension CourseSignUpViewController: UITextViewDelegate {

    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        bottomHeightConstraint.constant = 250
        return true
    }
}



extension CourseSignUpViewController {
    
    func uiCourseSignUp() {
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        let backgroundForImage = UIView(frame: UIScreen.main.bounds)
        let blackBackgound = UIView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "filterBackground")
        backgroundImage.contentMode = .scaleAspectFill
        backgroundForImage.backgroundColor = UIColor.red
        backgroundForImage.alpha = 0.6
        blackBackgound.backgroundColor = UIColor.black
        blackBackgound.alpha = 0.2
        view.addSubview(backgroundImage)
        view.addSubview(blackBackgound)
        view.addSubview(backgroundForImage)
        self.view.sendSubviewToBack(blackBackgound)
        self.view.sendSubviewToBack(backgroundForImage)
        self.view.sendSubviewToBack(backgroundImage)
        
        headerLogoImageView.image = UIImage(named: "maxresdefault")
               headerLogoImageView.contentMode = .scaleAspectFill

             chekBoxImageView.image = UIImage(systemName: "square")
   
        privicyTextLabel.text = """
        Подписанием и отправкой настоящей заявки я подтверждаю, что я ознакомлен с
        Политикой конфиденциальности и принимаю ее условия, включая регламентирующие обработку моих персональных данных, и согласен с ней.
"""
    }
}
//   MARK: - SELECTOR
extension CourseSignUpViewController {
    
    @objc func keyboardWillHide() {
        bottomHeightConstraint.constant = 0
        self.view.endEditing(true)
    }
}
