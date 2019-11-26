//
//  ProgramCourseViewController.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/22/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

class ProgramCourseViewController: UIViewController {

    
    @IBOutlet weak var programTextLabel: UILabel!
    
    @IBOutlet weak var courseProgramTextView: UITextView!
    
    var courseRecieve = Courses()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        programInfoUpdate(course: courseRecieve)
       
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

