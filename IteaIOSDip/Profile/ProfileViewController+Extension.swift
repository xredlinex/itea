//
//  ProfileViewController+Extension.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/30/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

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
