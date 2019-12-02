//
//  CoursesViewController.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/22/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

class CoursesViewController: UIViewController {

    @IBOutlet weak var viewForHeaderView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var flow = CourseFlow()
    var recieveFlow = CourseFlow()
    var courses: [Courses] = []
    var recieveCourses: [Courses] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundView(image: "backgroundfor", color: UIColor.init(red: 19/255, green: 58/255, blue: 85/255, alpha: 1), alpha: 0.9)
        
        flow = recieveFlow
        if recieveCourses.count == 0 {
            if let check = recieveFlow.courses {
                courses = check
            }
        } else {
            courses = recieveCourses
        }
        tableView.register(UINib(nibName: "CoursesTableViewCell", bundle: nil), forCellReuseIdentifier: "CoursesTableViewCell")
        tableView.reloadData()
    }
    
    @IBAction func didTapGoBackActionButton(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }
}

//  MARK: - GO TO COURSE VIEW - NAVIGATION
extension CoursesViewController: CoursesTableViewCellProtocol {
    func courseInfo(index: Int) {
        let storyboard = UIStoryboard(name: "Courses", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "DetailedCourseViewController") as! DetailedCourseViewController
        viewController.recieveCourse = courses[index]
        navigationController?.pushViewController(viewController, animated: true)
    }
}
