//
//  FlowViewController+Extension.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/28/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

//  MARK: - UIDESIGN AND ELEMENTS
extension FlowViewController {
    
    func updateCoursesFlow() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        let blurEffect = UIBlurEffect(style: .regular)
        let blurView = UIVisualEffectView(effect: blurEffect)
        backgroundImage.image = UIImage(named: "bg")
        backgroundImage.contentMode = .scaleAspectFill
        blurView.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionView.insertSubview(blurView, at: 0)
        goToCoursesButton.clipsToBounds = true
        goToCoursesButton.layer.cornerRadius = 12.0
        goToCoursesButton.isOpaque = true
        goToCoursesButton.alpha = 0.8
        goToCoursesButton.layer.masksToBounds = false
        goToCoursesButton.layer.shadowColor = UIColor.black.cgColor
        goToCoursesButton.layer.shadowOpacity = 0.5
        goToCoursesButton.layer.shadowOffset = CGSize(width: 10, height: 10)
        goToCoursesButton.layer.shadowRadius = 12.0
        
        NSLayoutConstraint.activate([blurView.heightAnchor.constraint(equalTo: descriptionView.heightAnchor),
                                     blurView.widthAnchor.constraint(equalTo: descriptionView.widthAnchor)])
        let secondBlurView = UIVisualEffectView(effect: blurEffect)
        secondBlurView.translatesAutoresizingMaskIntoConstraints = false
        levelView.insertSubview(secondBlurView, at: 0)
       
        NSLayoutConstraint.activate([secondBlurView.heightAnchor.constraint(equalTo: levelView.heightAnchor),
                                     secondBlurView.widthAnchor.constraint(equalTo: levelView.widthAnchor)])
        view.addSubview(backgroundImage)
        self.view.sendSubviewToBack(backgroundImage)
    }
}
