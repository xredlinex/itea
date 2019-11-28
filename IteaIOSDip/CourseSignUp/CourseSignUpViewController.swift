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
    
    @IBOutlet weak var nameValidationErrorTextLabel: UILabel!
    @IBOutlet weak var mailValidationErrorTextLabel: UILabel!
    @IBOutlet weak var phoneValidationErrorTextLabel: UILabel!
    
    
    @IBOutlet weak var nameTextLabelErrorHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var emailTextLabelErrorHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var phoneTextLabelErrorHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var bottomHeightConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiCourseSignUp()
        setDefaultLocation(0)

        //  MARK: - TEXT FIELDS
        let keyboardHide = UITapGestureRecognizer(target: self, action: #selector(keyboardWillHide))
        view.addGestureRecognizer(keyboardHide)
        
        
       
    }
    @IBAction func didTapSignUpButton(_ sender: Any) {
        
        nameTextLabelErrorHeightConstraint.priority = UILayoutPriority(rawValue: 900)
        emailTextLabelErrorHeightConstraint.priority = UILayoutPriority(rawValue: 900)
        phoneTextLabelErrorHeightConstraint.priority = UILayoutPriority(rawValue: 900)
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
    
}


extension CourseSignUpViewController {
    
    func setDefaultLocation(_ location: Int) {
       
        firstLocationTextLabel.text = "Берестейская"
        secondLocationTextLabel.text = "Позняки"
        thirdLocationTextLabel.text = "ВДНХ"
        
        switch location {
        case 1:
            firstLocationTextLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
            secondLocationTextLabel.font = UIFont.systemFont(ofSize: 16)
            thirdLocationTextLabel.font = UIFont.systemFont(ofSize: 16)
            firstLocationCheckImageView.image = UIImage(systemName: "largecircle.fill.circle")
            secondLocationCheckImageView.image = UIImage(systemName: "circle")
            thirdLocationCheckImageView.image = UIImage(systemName: "circle")
        case 2:
            firstLocationTextLabel.font = UIFont.systemFont(ofSize: 16)
            secondLocationTextLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
            thirdLocationTextLabel.font = UIFont.systemFont(ofSize: 16)
            firstLocationCheckImageView.image = UIImage(systemName: "circle")
            secondLocationCheckImageView.image = UIImage(systemName: "largecircle.fill.circle")
            thirdLocationCheckImageView.image = UIImage(systemName: "circle")
        case 3:
            firstLocationTextLabel.font = UIFont.systemFont(ofSize: 16)
            secondLocationTextLabel.font = UIFont.systemFont(ofSize: 16)
            thirdLocationTextLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
            firstLocationCheckImageView.image = UIImage(systemName: "circle")
            secondLocationCheckImageView.image = UIImage(systemName: "circle")
            thirdLocationCheckImageView.image = UIImage(systemName: "largecircle.fill.circle")
        default:
            firstLocationTextLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
            secondLocationTextLabel.font = UIFont.systemFont(ofSize: 16)
            thirdLocationTextLabel.font = UIFont.systemFont(ofSize: 16)
            firstLocationCheckImageView.image = UIImage(systemName: "largecircle.fill.circle")
            secondLocationCheckImageView.image = UIImage(systemName: "circle")
            thirdLocationCheckImageView.image = UIImage(systemName: "circle")
        }
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
        
        
        
        
        
    }
}
//   MARK: - SELECTOR
extension CourseSignUpViewController {
    
    @objc func keyboardWillHide() {
        bottomHeightConstraint.constant = 0
        self.view.endEditing(true)
    }
}
