//
//  FilterViewController+Extension.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/27/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

//  MARK: - UIELEMENTS DESIGN BUTTONS / VIEW/ MAKE RADIO BUTTONS / VC BACKGROUNDS -
extension FilterViewController {
    
    func uidesignFilter() {
                
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.systemUltraThinMaterialLight)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        backgroundImage.image = UIImage(named: "filterBackground")
        backgroundImage.contentMode = .scaleAspectFill
        view.addSubview(blurEffectView)
        view.addSubview(backgroundImage)
        self.view.sendSubviewToBack(blurEffectView)
        self.view.sendSubviewToBack(backgroundImage)
    }
    
    func uiDesignFilterTapRadioBattonsView(view: UIView) {
       
        let blurEffect = UIBlurEffect(style: .systemThinMaterialDark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(blurView, at: 0)
        blurView.clipsToBounds = true
        blurView.layer.cornerRadius = 12.0
        NSLayoutConstraint.activate([blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
                                     blurView.widthAnchor.constraint(equalTo: view.widthAnchor)])
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.white.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 10, height: 10)
        view.layer.shadowRadius = 12.0
    }
    
    func makeRadioButtons(view: UIView) {
        view.clipsToBounds = true
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.cornerRadius = view.frame.width / 2
    }
}

//  MARK: - WORK VS FILTER BUTTONS / RESET / DEFAULTS DATA / ETC
extension FilterViewController {
    
    func setDefaultsFilterCourse(courses: [CourseFlow]) {
        sortbyType = courses
        for items in courses {
            if items.courseTime == "night" {
                sortbyDate.append(items)
            }
        }
    }
    
    func defaultFilterButtons() {
        nightCheckInternalView.layer.backgroundColor = UIColor.white.cgColor
        allFlowCheckInternalView.layer.backgroundColor = UIColor.white.cgColor
        dayCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        programmingCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        frontEndCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        designCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        qaCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        otherCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
    }
}

//  MARK: - CHANGE SAVE BUTTON -
extension FilterViewController {
    func filterSaved(state: Bool) {
        if state == true {
            saveFilterButton.layer.backgroundColor = UIColor.lightGray.cgColor
            saveFilterButton.alpha = 0.9
            saveFilterButton.setTitle("Сохранено", for: .normal)
        } else {
            saveFilterButton.setTitle("Сохранить Фильтр", for: .normal)
            saveFilterButton.layer.backgroundColor = UIColor(red: 111/255, green: 169/255, blue: 145/255, alpha: 1).cgColor
        }
    }
}

//  MARK: - ALERT EXTRNSION - 
extension FilterViewController {
    
    func filterAlert(title: String, message: String) {
        let alertFiter = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default) { (_) in}
        alertFiter.addAction(alertAction)
        present(alertFiter, animated: true, completion: nil)
    }
}

//  MARK: - RADIO BUTTONS TAP ETC -
extension FilterViewController {
    
    @objc func didNightTapAction() {
        filterSaved(state: false)
        sortbyDate = []
        nightCheckInternalView.layer.backgroundColor = UIColor.white.cgColor
        dayCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor

        for  flowItems in flow {
            if flowItems.courseTime == "night" {
                sortbyDate.append(flowItems)
            }
        }
    }
    
    @objc func didDayTapAction() {
        filterSaved(state: false)
        sortbyDate = []
        dayCheckInternalView.layer.backgroundColor = UIColor.white.cgColor
        nightCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        
        for flowItems in flow {
            if flowItems.courseTime == "day" {
                sortbyDate.append(flowItems)
            }
        }
    }
    
    @objc func didallFlowAction() {
        filterSaved(state: false)
        sortbyType = []
        allFlowCheckInternalView.layer.backgroundColor = UIColor.white.cgColor
        programmingCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        frontEndCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        designCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        qaCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        otherCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        
        for flowItems in flow {
                sortbyType.append(flowItems)
        }
    }
    
    @objc func didProgramingAction() {
        filterSaved(state: false)
        sortbyType = []
        allFlowCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        programmingCheckInternalView.layer.backgroundColor = UIColor.white.cgColor
        frontEndCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        designCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        qaCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        otherCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        
        for flowItems in flow {
            if flowItems.courseType == "programming" {
                sortbyType.append(flowItems)
            }
        }
    }
    
    @objc func didFrontEndAction() {
        filterSaved(state: false)
        sortbyType = []
        allFlowCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        programmingCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        frontEndCheckInternalView.layer.backgroundColor = UIColor.white.cgColor
        designCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        qaCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        otherCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        
        for flowItems in flow {
            if flowItems.courseType == "front" || flowItems.courseSecondType == "front" {
                sortbyType.append(flowItems)
            }
        }
    }
    
    @objc func didDesignAction() {
        filterSaved(state: false)
        sortbyType = []
        allFlowCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        programmingCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        frontEndCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        designCheckInternalView.layer.backgroundColor = UIColor.white.cgColor
        qaCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        otherCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        
        for flowItems in flow {
            if flowItems.courseType == "design" {
                sortbyType.append(flowItems)
            }
        }
    }
    
    @objc func didQaAction() {
        filterSaved(state: false)
        sortbyType = []
        allFlowCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        programmingCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        frontEndCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        designCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        qaCheckInternalView.layer.backgroundColor = UIColor.white.cgColor
        otherCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor

        for flowItems in flow {
            if flowItems.courseType == "qa" {
                sortbyType.append(flowItems)
            }
        }
    }
    
    @objc func didOtherAction() {
        filterSaved(state: false)
        sortbyType = []
        allFlowCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        programmingCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        frontEndCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        designCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        qaCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        otherCheckInternalView.layer.backgroundColor = UIColor.white.cgColor
        
        for flowItems in flow {
            if flowItems.courseType == "other" {
                sortbyType.append(flowItems)
            }
        }
    }
}
