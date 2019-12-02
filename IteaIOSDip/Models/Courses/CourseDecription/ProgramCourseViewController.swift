//
//  ProgramCourseViewController.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/22/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

class ProgramCourseViewController: UIViewController {

    @IBOutlet weak var clearImageView: UIImageView!
    @IBOutlet weak var programTextLabel: UILabel!
    @IBOutlet weak var courseProgramTextView: UITextView!
    @IBOutlet weak var programCourseView: UIView!
    
    var courseRecieve = Courses()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        programInfoUpdate(course: courseRecieve)
        
        backgroundView(image: "programBg", color: UIColor.init(red: 19/255, green: 58/255, blue: 85/255, alpha: 1), alpha: 0.9)
    }
    
    @IBAction func didTapBackToMain(_ sender: Any) {
        let blurEffect = UIBlurEffect(style: .systemMaterialLight)
        let blurVisualEffectView = UIVisualEffectView(effect: blurEffect)
        blurVisualEffectView.frame = view.bounds
        self.view.addSubview(blurVisualEffectView)

        let backAlert = UIAlertController(title: "Перейти", message: "назад к выбору курса?", preferredStyle: .alert)
        let backACtion = UIAlertAction(title: "Да", style: .default) { (_) in
       
        blurVisualEffectView.removeFromSuperview()
            
        let storyboard = UIStoryboard(name: "Courses", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "CoursesFlowViewController") as! CoursesFlowViewController
        self.navigationController?.pushViewController(viewController, animated: false)
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel) { (_) in
            blurVisualEffectView.removeFromSuperview()
        }
        backAlert.addAction(backACtion)
        backAlert.addAction(cancelAction)
        present(backAlert, animated: true, completion: nil)
    }
    
    @IBAction func didTapGoBackActionButton(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }
}

extension ProgramCourseViewController {
    func programInfoUpdate(course: Courses) {
        courseProgramTextView.text = course.courseProgram
    }
}
