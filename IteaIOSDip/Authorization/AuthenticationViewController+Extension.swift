//
//  AuthenticationViewController+Extension.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/29/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import Foundation
import UIKit

extension AuthenticationViewController {
    
    func hideValidationErrors() {
        showMailValidErrorHeightConstraint.priority = UILayoutPriority(rawValue: 600)
        showPassValidErrorHeightConstraint.priority = UILayoutPriority(rawValue: 600)
        showEmailErrorHeightConstraint.priority = UILayoutPriority(rawValue: 600)
        showPasswordErrorHeightConstraint.priority = UILayoutPriority(rawValue: 600)
    }
    
    func checkStudents(students: [IteaStudent]?) -> [IteaStudent] {
        var studentsInfo: [IteaStudent] = []
        if let studentsArray = students {
            for student in studentsArray {
                if let studentMail = student.mail, studentMail != ""{
                    studentsInfo.append(student)
                }
            }
            return studentsInfo
        }
        return studentsInfo
    }
}

extension AuthenticationViewController {
    
        func updateAuthUi() {
            
            iteaLogoMainView.layer.borderColor = UIColor.white.cgColor
            iteaLogoMainView.layer.borderWidth = 2.0
            iteaLogoIView.layer.borderColor = UIColor.white.cgColor
            iteaLogoIView.layer.borderWidth = 2.0
            iteaLogoTView.layer.borderColor = UIColor.white.cgColor
            iteaLogoTView.layer.borderWidth = 2.0
            iteaLogoEView.layer.borderColor = UIColor.white.cgColor
            iteaLogoEView.layer.borderWidth = 2.0
            

            
            let blurEffect = UIBlurEffect(style: .prominent)
                let logInBlurView = UIVisualEffectView(effect: blurEffect)
            let sighnUpBlurView = UIVisualEffectView(effect: blurEffect)
                logInBlurView.translatesAutoresizingMaskIntoConstraints = false
            sighnUpBlurView.translatesAutoresizingMaskIntoConstraints = false
            logInButtonView.insertSubview(logInBlurView, at: 0)
            signUpButtonView.insertSubview(sighnUpBlurView, at: 0)
            logInBlurView.clipsToBounds = true
            sighnUpBlurView.clipsToBounds = true
            
                logInBlurView.layer.cornerRadius = 12.0
                sighnUpBlurView.layer.cornerRadius = 12.0
                NSLayoutConstraint.activate([sighnUpBlurView.heightAnchor.constraint(equalTo: signUpButtonView.heightAnchor),
                                             sighnUpBlurView.widthAnchor.constraint(equalTo: signUpButtonView.widthAnchor), logInBlurView.heightAnchor.constraint(equalTo: logInButtonView.heightAnchor), logInBlurView.widthAnchor.constraint(equalTo: logInButtonView.widthAnchor)
                ])
            
            signUpButtonView.clipsToBounds = true
            signUpButtonView.layer.masksToBounds = false
            signUpButtonView.layer.shadowColor = UIColor.black.cgColor
            signUpButtonView.layer.shadowOpacity = 0.5
            signUpButtonView.layer.shadowOffset = CGSize(width: 10, height: 10)
            signUpButtonView.layer.shadowRadius = 12.0
            
            logInButtonView.clipsToBounds = true
            logInButtonView.layer.masksToBounds = false
            logInButtonView.layer.shadowColor = UIColor.black.cgColor
            logInButtonView.layer.shadowOpacity = 0.5
            logInButtonView.layer.shadowOffset = CGSize(width: 10, height: 10)
            logInButtonView.layer.shadowRadius = 12.0
            
            
//            let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
//            backgroundImage.image = UIImage(named: "backgroundlogin")
//            backgroundImage.contentMode = .scaleAspectFill
//            let backgroundForImage = UIView(frame: UIScreen.main.bounds)
//            backgroundForImage.backgroundColor = UIColor.red
//            backgroundForImage.alpha = 0.8
//            view.addSubview(backgroundImage)
//            view.addSubview(backgroundForImage)
//            self.view.sendSubviewToBack(backgroundForImage)
//            self.view.sendSubviewToBack(backgroundImage)
            
            
    }

}
