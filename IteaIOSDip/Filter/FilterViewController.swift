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
//    rond view by time
    @IBOutlet weak var nightCheckView: UIView!
    @IBOutlet weak var dayCheckView: UIView!
//   filter by flow
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
        
        for view in radioButtons {
            makeRadioButtons(view: view)
        }
//        set defaults buttons
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
        if flow.count == 0 {
            let filterAlert = UIAlertController(title: "Oooops!", message: "Не найдено курсов с такими параметрами", preferredStyle: .alert)
            let filterAction = UIAlertAction(title: "OK", style: .cancel) { (_) in
                self.allFlowCheckInternalView.layer.backgroundColor = UIColor.black.cgColor
                self.programmingCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
                self.frontEndCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
                self.designCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
                self.qaCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
                self.otherCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
                self.dayCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
                self.nightCheckInternalView.layer.backgroundColor = UIColor.black.cgColor
            }
            filterAlert.addAction(filterAction)
            present(filterAlert, animated: true, completion: nil)
            setDefaultsFilterCourse(courses: flow)
        } else {
            flow = []
            for courseDay in sortbyDate {
                for courseFlow in sortbyType {
                    if courseDay.name == courseFlow.name {
                        flow.append(courseFlow)
                    }
                }
            }
        }
    }
    
    func makeRadioButtons(view: UIView) {
        view.clipsToBounds = true
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = view.frame.width / 2
    }
    
    func defaultFilterButtons() {
        nightCheckInternalView.layer.backgroundColor = UIColor.black.cgColor
        allFlowCheckInternalView.layer.backgroundColor = UIColor.black.cgColor
    }
    func selectedItem(view: UIView) {
        view.layer.backgroundColor = UIColor.black.cgColor
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
        sortbyDate = []
        nightCheckInternalView.layer.backgroundColor = UIColor.black.cgColor
        dayCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
  

        for  flowItems in flow {
            if flowItems.courseTime == "night" {
                sortbyDate.append(flowItems)
            }
        }
    }
    
    
    @objc func didDayTapAction() {
        sortbyDate = []
        dayCheckInternalView.layer.backgroundColor = UIColor.black.cgColor
        nightCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
      
      
        for flowItems in flow {
            if flowItems.courseTime == "day" {
                sortbyDate.append(flowItems)
            }
        }
    }
    
    @objc func didallFlowAction() {
        sortbyType = []
        allFlowCheckInternalView.layer.backgroundColor = UIColor.black.cgColor
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
        sortbyType = []
        allFlowCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        programmingCheckInternalView.layer.backgroundColor = UIColor.black.cgColor
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
        sortbyType = []
        allFlowCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        programmingCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        frontEndCheckInternalView.layer.backgroundColor = UIColor.black.cgColor
        designCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        qaCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        otherCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        
        for flowItems in flow {
            if flowItems.courseType == "front" {
                sortbyType.append(flowItems)
            }
        }
        
        
    }
    @objc func didDesignAction() {
        sortbyType = []
        allFlowCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        programmingCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        frontEndCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        designCheckInternalView.layer.backgroundColor = UIColor.black.cgColor
        qaCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        otherCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        
        for flowItems in flow {
            if flowItems.courseType == "design" {
                sortbyType.append(flowItems)
            }
        }
        
    }
    @objc func didQaAction() {
        sortbyType = []
        allFlowCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        programmingCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        frontEndCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        designCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        qaCheckInternalView.layer.backgroundColor = UIColor.black.cgColor
        otherCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        
        for flowItems in flow {
            if flowItems.courseType == "qa" {
                sortbyType.append(flowItems)
            }
        }
        debugPrint("tap")
    }
    @objc func didOtherAction() {
        sortbyType = []
        allFlowCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        programmingCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        frontEndCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        designCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        qaCheckInternalView.layer.backgroundColor = UIColor.clear.cgColor
        otherCheckInternalView.layer.backgroundColor = UIColor.black.cgColor
        
        for flowItems in flow {
            if flowItems.courseType == "other" {
                sortbyType.append(flowItems)
            }
        }        
    }
    
}


