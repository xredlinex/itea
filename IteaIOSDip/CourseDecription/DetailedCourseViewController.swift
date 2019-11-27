//
//  DetailedCourseViewController.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/22/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

class DetailedCourseViewController: UIViewController {
    
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
        
        updateDetailUI()
        visualUpdateView(view: skillsView)
        visualUpdateView(view: courseAboutView)
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
        
        let storyboard = UIStoryboard(name: "Courses", bundle: nil)
               let viewController = storyboard.instantiateViewController(withIdentifier: "CourseSignInViewController") as! CourseSignInViewController
        
               navigationController?.pushViewController(viewController, animated: true)
    }
}

extension DetailedCourseViewController {
    
    
    func detailInfoCourse(course: Courses) {
        
        courseNameTextLabel.text = course.courseName
        aboutCourseTextLabel.text = course.courseDescription
        skillsTextLabel.text = course.courseSkills
    
        
    }
    
    func visualUpdateView(view: UIView) {
          
          view.clipsToBounds = true
          view.layer.masksToBounds = false
          view.layer.cornerRadius = 12
          view.layer.shadowColor = UIColor.white.cgColor
          view.layer.shadowOffset = CGSize(width: 3, height: 3)
          view.layer.shadowRadius = 10.0
          view.layer.shadowOpacity = 0.5

      }
    
    func updateDetailUI() {
          
          let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
          backgroundImage.image = UIImage(named: "bt")
          backgroundImage.contentMode = .scaleAspectFill
          let backgroundForImage = UIView(frame: UIScreen.main.bounds)
          backgroundForImage.backgroundColor = UIColor.black
          backgroundForImage.alpha = 0.9
          view.addSubview(backgroundImage)
          view.addSubview(backgroundForImage)
        self.view.sendSubviewToBack(backgroundImage)
          self.view.sendSubviewToBack(backgroundForImage)
          
          
        let blurEffect = UIBlurEffect(style: .prominent)
                 let blurView = UIVisualEffectView(effect: blurEffect)
                 blurView.translatesAutoresizingMaskIntoConstraints = false
                 courseAboutView.insertSubview(blurView, at: 0)
             
                 
                 NSLayoutConstraint.activate([blurView.heightAnchor.constraint(equalTo: courseAboutView.heightAnchor), blurView.widthAnchor.constraint(equalTo: courseAboutView.widthAnchor)
                 ])
                 let secondBlurView = UIVisualEffectView(effect: blurEffect)
                 secondBlurView.translatesAutoresizingMaskIntoConstraints = false
                 skillsView.insertSubview(secondBlurView, at: 0)
                
                 NSLayoutConstraint.activate([secondBlurView.heightAnchor.constraint(equalTo: skillsView.heightAnchor), secondBlurView.widthAnchor.constraint(equalTo: skillsView.widthAnchor),
                 ])
        
        
        enrollButton.clipsToBounds = true
         
            enrollButton.layer.cornerRadius = 12.0
            enrollButton.isOpaque = true
            enrollButton.alpha = 0.8
            enrollButton.layer.masksToBounds = false
            enrollButton.layer.shadowColor = UIColor.black.cgColor
            enrollButton.layer.shadowOpacity = 0.5
            enrollButton.layer.shadowOffset = CGSize(width: 10, height: 10)
            enrollButton.layer.shadowRadius = 12.0
        
        enrollButton.clipsToBounds = true
        
           courseProgramButton.layer.cornerRadius = 12.0
           courseProgramButton.isOpaque = true
           courseProgramButton.alpha = 0.8
           courseProgramButton.layer.masksToBounds = false
           courseProgramButton.layer.shadowColor = UIColor.black.cgColor
           courseProgramButton.layer.shadowOpacity = 0.5
           courseProgramButton.layer.shadowOffset = CGSize(width: 10, height: 10)
           courseProgramButton.layer.shadowRadius = 12.0
          
      }
    
    
    
}
 
