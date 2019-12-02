//
//  DetailedCourseViewController.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/22/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

class DetailedCourseViewController: UIViewController {
    
    @IBOutlet weak var flowHeaderImageView: UIImageView!
    @IBOutlet weak var courseNameTextLabel: UILabel!
    @IBOutlet weak var courseAboutView: UIView!
    @IBOutlet weak var aboutCourseTextLabel: UILabel!
    @IBOutlet weak var skillsView: UIView!
    @IBOutlet weak var skillsTextLabel: UILabel!
    @IBOutlet weak var enrollButton: UIButton!
    @IBOutlet weak var courseProgramButton: UIButton!
    
    var course = Courses()
    var recieveCourse = Courses()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        course = recieveCourse
        detailInfoCourse(course: course)
        backgroundView(image: "backgroundfor", color: UIColor.init(red: 19/255, green: 58/255, blue: 85/255, alpha: 1), alpha: 0.9)
        courseAboutView.blurDetailView()
        skillsView.blurDetailView()
        enrollButton.iteaButton()
        courseProgramButton.iteaButton()
    }
    
    @IBAction func didTapGoBackButton(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }
    
    @IBAction func didTapCourseProgramActionButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Courses", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ProgramCourseViewController") as! ProgramCourseViewController
        viewController.courseRecieve = course
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func didTapCourseSignInActionButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "CourseSignUp", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "CourseSignUpViewController") as! CourseSignUpViewController
        viewController.recieveCourse = course
        navigationController?.pushViewController(viewController, animated: true)
    }
}

//  MARK: - UPDATE INFO -
extension DetailedCourseViewController {
    func detailInfoCourse(course: Courses) {
        courseNameTextLabel.text = course.courseName
        aboutCourseTextLabel.text = course.courseDescription
        skillsTextLabel.text = course.courseSkills
        flowHeaderImageView.image = UIImage(named: course.courseHeaderImage ?? "noHeaderImage")
    }
}
