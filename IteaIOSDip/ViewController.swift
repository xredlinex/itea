//
//  ViewController.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/17/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!
    
    var courses: [Courses] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
      courses = makeQaCourses()

        debugPrint(courses.count)
        for i in courses {
            
            debugPrint(i.courseDescription)
            debugPrint(i.courseSkills)
            debugPrint(i.courseProgram)
            
        }
        


    }
    
    
    

    
}


