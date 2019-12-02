//
//  LastCoursesViewController.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/22/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

class LastCoursesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var studentCourses = [StudentCourses]()
    var recieveCourses = [StudentCourses]()

    override func viewDidLoad() {
        super.viewDidLoad()

        studentCourses = recieveCourses
        
        tableView.register(UINib(nibName: "CoursesTableViewCell", bundle: nil), forCellReuseIdentifier: "CoursesTableViewCell")
        tableView.reloadData()
        backgroundView(image: "profileBg", color: UIColor.init(red: 19/255, green: 58/255, blue: 85/255, alpha: 1), alpha: 0.7)
    }
    
    @IBAction func didTapGoBackButton(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }
}

//  TODO: DELEGATE NOT WORK
//  MARK: - DELEGATE CELL - TAP AND GO TO DESCRIPTION -
extension LastCoursesViewController : CoursesTableViewCellProtocol {
    func courseInfo(index: Int) {
        let storyboard = UIStoryboard(name: "Courses", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "DetailedCourseViewController") as! DetailedCourseViewController
//        viewController.recieveCourse = student.studentCourses.self[index]
        navigationController?.pushViewController(viewController, animated: true)
    }
}
