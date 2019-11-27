//
//  FilterViewController.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/22/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit


class FilterViewController: UIViewController {
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var viewForTimeFilterView: UIView!
    @IBOutlet weak var viewForTypeFilterView: UIView!
    @IBOutlet weak var footerView: UIView!
    @IBOutlet weak var saveFilterButton: UIButton!
    @IBOutlet weak var nightCheckView: UIView!
    @IBOutlet weak var dayCheckView: UIView!
    @IBOutlet weak var allFlowView: UIView!
    @IBOutlet weak var programmingView: UIView!
    @IBOutlet weak var frontEndView: UIView!
    @IBOutlet weak var designView: UIView!
    @IBOutlet weak var qaView: UIView!
    @IBOutlet weak var otherView: UIView!
    @IBOutlet weak var nightCheckExternalView: UIView!
    @IBOutlet weak var dayCheckExternalView: UIView!
    @IBOutlet weak var allFlowCheckExternalView: UIView!
    @IBOutlet weak var programmingCheckExternalView: UIView!
    @IBOutlet weak var frontEndCheckExternalView: UIView!
    @IBOutlet weak var designCheckExternalView: UIView!
    @IBOutlet weak var qaCheckExternalView: UIView!
    @IBOutlet weak var otherCheckExternalView: UIView!
    @IBOutlet weak var nightCheckInternalView: UIView!
    @IBOutlet weak var dayCheckInternalView: UIView!
    @IBOutlet weak var allFlowCheckInternalView: UIView!
    @IBOutlet weak var programmingCheckInternalView: UIView!
    @IBOutlet weak var frontEndCheckInternalView: UIView!
    @IBOutlet weak var designCheckInternalView: UIView!
    @IBOutlet weak var qaCheckInternalView: UIView!
    @IBOutlet weak var otherCheckInternalView: UIView!
    
    var flow: [CourseFlow] = []
    var recieveFlowToFilter: [CourseFlow] = []
    var sortbyDate: [CourseFlow] = []
    var sortbyType: [CourseFlow] = []
    var tempFlow: [CourseFlow] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        flow = recieveFlowToFilter
        setDefaultsFilterCourse(courses: flow)
        

        
//  MARK: - MAKE RADIO BUTTONS
        let radioButtons: [UIView] = [nightCheckExternalView,
                                      dayCheckExternalView,
                                      allFlowCheckExternalView,
                                      programmingCheckExternalView,
                                      frontEndCheckExternalView,
                                      designCheckExternalView,
                                      qaCheckExternalView,
                                      otherCheckExternalView,
                                      nightCheckInternalView,
                                      dayCheckInternalView,
                                      allFlowCheckInternalView,
                                      programmingCheckInternalView,
                                      frontEndCheckInternalView,
                                      designCheckInternalView,
                                      qaCheckInternalView,
                                      otherCheckInternalView]
        let radioTapView: [UIView] = [nightCheckView,
                                      dayCheckView,
                                      allFlowView,
                                      programmingView,
                                      frontEndView,
                                      designView,
                                      qaView,
                                      otherView]
        for view in radioButtons {
            makeRadioButtons(view: view)
        }
        for view in radioTapView {
            uiDesignFilterTapRadioBattonsView(view: view)
        }
//        set defaults buttons tap
        defaultFilterButtons()
        uidesignFilter()
        
//  MARK: - SET TAP GESTURE RECOGNIZER
        nightCheckView.isUserInteractionEnabled = true
        dayCheckView.isUserInteractionEnabled = true
        allFlowView.isUserInteractionEnabled = true
        programmingView.isUserInteractionEnabled = true
        frontEndView.isUserInteractionEnabled = true
        designView.isUserInteractionEnabled = true
        qaView.isUserInteractionEnabled = true
        otherView.isUserInteractionEnabled = true
        
        let nightCheckTap = UITapGestureRecognizer(target: self, action: #selector(didNightTapAction))
        nightCheckView .addGestureRecognizer(nightCheckTap)
        let dayCheckTap = UITapGestureRecognizer(target: self, action: #selector(didDayTapAction))
        dayCheckView.addGestureRecognizer(dayCheckTap)
        let allFlowTap = UITapGestureRecognizer(target: self, action: #selector(didallFlowAction))
        allFlowView.addGestureRecognizer(allFlowTap)
        let programingTap = UITapGestureRecognizer(target: self, action: #selector(didProgramingAction))
        programmingView.addGestureRecognizer(programingTap)
        let fronEndTap = UITapGestureRecognizer(target: self, action: #selector(didFrontEndAction))
        frontEndView.addGestureRecognizer(fronEndTap)
        let designTap = UITapGestureRecognizer(target: self, action: #selector(didDesignAction))
        designView.addGestureRecognizer(designTap)
        let qaTap = UITapGestureRecognizer(target: self, action: #selector(didQaAction))
        qaView.addGestureRecognizer(qaTap)
        let otherTap = UITapGestureRecognizer(target: self, action: #selector(didOtherAction))
        otherView.addGestureRecognizer(otherTap)
    }

    @IBAction func didTapGoBackButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Courses", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "CoursesFlowViewController") as! CoursesFlowViewController
        viewController.filterFlow = flow
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func didTapSaveFilterActionButton(_ sender: Any) {
        
//        for items in sortbyType {
//            debugPrint(items.courses)
//        }
        debugPrint("try to save items in sort byu day")
        for items in sortbyDate {
            debugPrint(items.name)
        }
        debugPrint("try to save item in sort buy programming")
        for item in sortbyType {
            debugPrint(item.name)
        }
        
        
        
        
        //        if flow.count == 0 {
//            let filterAlert = UIAlertController(title: "Oooops!", message: "Не найдено курсов с такими параметрами", preferredStyle: .alert)
//            let filterAction = UIAlertAction(title: "OK", style: .cancel) { (_) in
//                self.allFlowCheckInternalView.layer.backgroundColor = UIColor.white.cgColor
//                self.programmingCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
//                self.frontEndCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
//                self.designCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
//                self.qaCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
//                self.otherCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
//                self.dayCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
//                self.nightCheckInternalView.layer.backgroundColor = UIColor.white.cgColor
//            }
//            filterAlert.addAction(filterAction)
//            present(filterAlert, animated: true, completion: nil)
//            setDefaultsFilterCourse(courses: recieveFlowToFilter)
//        } else {
//            flow = []
//
//            for courseDay in sortbyDate {
//                for courseFlow in sortbyType {
//                    if courseDay.name == courseFlow.name {
//                        flow.append(courseFlow)
//                        let saveFilterAlert = UIAlertController(title: "YES!", message: "Настройки фильтра сохранены!)", preferredStyle: .alert)
//                        let filterSaveAction = UIAlertAction(title: "OK", style: .cancel) { (_) in
//                        }
//                        saveFilterAlert.addAction(filterSaveAction)
//                        present(saveFilterAlert, animated: true, completion: nil)
//                        saveFilterButton.setTitle("Сорхранено", for: .normal)
//                        saveFilterButton.layer.backgroundColor = UIColor.systemGray.cgColor
//                    }
//                }
//            }
//        }
    }
    
    func defaultFilterButtons() {
        nightCheckInternalView.layer.backgroundColor = UIColor.white.cgColor
        allFlowCheckInternalView.layer.backgroundColor = UIColor.white.cgColor
    }
    
    

}
extension FilterViewController {
    
    func setDefaultsFilterCourse(courses: [CourseFlow]) {
        for items in courses {
            if items.courseTime == "night" {
                sortbyDate.append(items)
            }
        }
        sortbyType = courses
        
        debugPrint("курсы по умолчанию зашли если фильтр не сохранен")
        for items in sortbyDate {
            debugPrint(items.name)
        }
        debugPrint("buy programming")
        for items in sortbyType {
            debugPrint(items.name)
        }
      
        
    }
//    TODO: - MAKE FUNCTIOM FOR BUTTONS CHANGE
//    func chngeRadioButtons(activeFilter: Bool, notActive: Bool) {
//        var active: CGColor = UIColor.black.cgColor
//        var notActive: CGColor = UIColor.white.cgColor
//        
//    
//        if
//        
//        allFlowCheckInternalView.layer.backgroundColor = UIColor.black.cgColor
//        programmingCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
//        frontEndCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
//        designCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
//        qaCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
//        otherCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
//    }
}





extension FilterViewController {
    
    @objc func didNightTapAction() {
//        BUTTONS
        saveFilterButton.setTitle("Сохранить Фильтр", for: .normal)
        saveFilterButton.layer.backgroundColor = UIColor(red: 111/255, green: 169/255, blue: 145/255, alpha: 1).cgColor
        nightCheckInternalView.layer.backgroundColor = UIColor.white.cgColor
        dayCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        sortbyDate = []

        for  flowItems in flow {
            if flowItems.courseTime == "night" {
                sortbyDate.append(flowItems)
            }
        }
    }
    
    
    @objc func didDayTapAction() {
        saveFilterButton.setTitle("Сохранить Фильтр", for: .normal)
        saveFilterButton.layer.backgroundColor = UIColor(red: 111/255, green: 169/255, blue: 145/255, alpha: 1).cgColor
        dayCheckInternalView.layer.backgroundColor = UIColor.white.cgColor
        nightCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        sortbyDate = []

        for flowItems in flow {
            if flowItems.courseTime == "day" {
                sortbyDate.append(flowItems)
            }
        }
    }
    
    @objc func didallFlowAction() {
        saveFilterButton.setTitle("Сохранить Фильтр", for: .normal)
        saveFilterButton.layer.backgroundColor = UIColor(red: 111/255, green: 169/255, blue: 145/255, alpha: 1).cgColor
        allFlowCheckInternalView.layer.backgroundColor = UIColor.white.cgColor
        programmingCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        frontEndCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        designCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        qaCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        otherCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        sortbyType = []
        
        for flowItems in flow {
                sortbyType.append(flowItems)
        }
    }
    @objc func didProgramingAction() {
        saveFilterButton.setTitle("Сохранить Фильтр", for: .normal)
        saveFilterButton.layer.backgroundColor = UIColor(red: 111/255, green: 169/255, blue: 145/255, alpha: 1).cgColor
        allFlowCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        programmingCheckInternalView.layer.backgroundColor = UIColor.white.cgColor
        frontEndCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        designCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        qaCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        otherCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        sortbyType = []
        for flowItems in flow {
            if flowItems.courseType == "programming" {
                sortbyType.append(flowItems)
            }
        }
    }
    @objc func didFrontEndAction() {
        saveFilterButton.setTitle("Сохранить Фильтр", for: .normal)
        saveFilterButton.layer.backgroundColor = UIColor(red: 111/255, green: 169/255, blue: 145/255, alpha: 1).cgColor
        allFlowCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        programmingCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        frontEndCheckInternalView.layer.backgroundColor = UIColor.white.cgColor
        designCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        qaCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        otherCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        sortbyType = []
        
        for flowItems in flow {
            if flowItems.courseType == "front" {
                sortbyType.append(flowItems)
            }
        }
    }
    @objc func didDesignAction() {
        saveFilterButton.setTitle("Сохранить Фильтр", for: .normal)
        saveFilterButton.layer.backgroundColor = UIColor(red: 111/255, green: 169/255, blue: 145/255, alpha: 1).cgColor
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
        saveFilterButton.setTitle("Сохранить Фильтр", for: .normal)
        saveFilterButton.layer.backgroundColor = UIColor(red: 111/255, green: 169/255, blue: 145/255, alpha: 1).cgColor
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
        debugPrint("tap")
    }
    @objc func didOtherAction() {
        saveFilterButton.setTitle("Сохранить Фильтр", for: .normal)
        saveFilterButton.layer.backgroundColor = UIColor(red: 111/255, green: 169/255, blue: 145/255, alpha: 1).cgColor
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
// KITCHEN EXTENSION!!!!!!!
