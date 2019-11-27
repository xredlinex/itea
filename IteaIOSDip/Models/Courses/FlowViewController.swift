//
//  FlowViewController.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/23/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

class FlowViewController: UIViewController {

    @IBOutlet weak var headerCourseImage: UIImageView!
    @IBOutlet weak var headerCourseBackgroudView: UIView!
    @IBOutlet weak var flowNameTextLabel: UILabel!
    @IBOutlet weak var flowDiscriptionTextLabel: UILabel!
    @IBOutlet weak var flowLevelTextLabel: UILabel!
    @IBOutlet weak var flowDescriptionView: UIView!
    @IBOutlet weak var flowLevelView: UIView!
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var levelView: UIView!
    @IBOutlet weak var goToCoursesButton: UIButton!
    @IBOutlet weak var hideDescriptionHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var hideLevelHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var screenHeaderHeightConstraint: NSLayoutConstraint!
 
    var flow = CourseFlow()
    var recieveFlow = CourseFlow()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        flow = recieveFlow
        flowDescription(course: flow)
        updateCoursesFlow()
    }
    
    @IBAction func didTapGoBackActionButton(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }
    
    @IBAction func didTapGoToCoursesAction(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Courses", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "CoursesViewController") as! CoursesViewController
        viewController.recieveFlow = recieveFlow
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func didTapGoToCoursesActionButton(_ sender: Any) {
        
        if recieveFlow.isProgrammingLanguage == true{
            let storyboard = UIStoryboard(name: "Courses", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "ProgrammingFlowViewController") as! ProgrammingFlowViewController
            viewController.recieveFlow = recieveFlow
            navigationController?.pushViewController(viewController, animated: true)
        } else {
            let storyboard = UIStoryboard(name: "Courses", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "CoursesViewController") as! CoursesViewController
            viewController.recieveFlow = recieveFlow
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}



//  MARK: - DESCRIPTION COURSE INFO -
extension FlowViewController {

    func flowDescription(course: CourseFlow) {
//      flow name
        flowNameTextLabel.text = flow.name ?? "---"
        flowNameTextLabel.text = flowNameTextLabel.text?.uppercased()
        
//        header image
        headerCourseImage.contentMode = .scaleAspectFit
        if let image = flow.flowHeaderImage, image != "" {
            headerCourseImage.image = UIImage(named: flow.flowHeaderImage ?? "noImage")
         } else {
            screenHeaderHeightConstraint.priority = UILayoutPriority(rawValue: 600)
         }
        
//        description
        if let descript = flow.typeDescription, descript != "" {
            flowDiscriptionTextLabel.text = descript
        } else {
            hideDescriptionHeightConstraint.priority = UILayoutPriority(rawValue: 600)
            flowDescriptionView.isHidden = true
        }
        
//        level decription
        if let level = flow.typeLevelDescriptiom, level != "" {
            flowLevelTextLabel.text = level
        } else {
            hideLevelHeightConstraint.priority = UILayoutPriority(rawValue: 600)
            flowLevelView.isHidden = true
        }
    }
}



