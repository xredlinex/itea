//
//  ProgrammingFlowViewController.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/26/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

class ProgrammingFlowViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var flow = CourseFlow()
    var recieveFlow = CourseFlow()
    var typeOfProgramming: [TypesOfProgrammingFlow] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundView(image: "onemore", color: UIColor.init(red: 19/255, green: 58/255, blue: 85/255, alpha: 1), alpha: 0.9)
    
        flow = recieveFlow
        if let checkCourses = flow.programmingFlow {
            typeOfProgramming = checkCourses
        }
        
        tableView.register(UINib(nibName: "ProgrammingFlowTableViewCell", bundle: nil), forCellReuseIdentifier: "ProgrammingFlowTableViewCell")
        tableView.reloadData()
    }
    
    @IBAction func didTapGoBackButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Courses", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "CoursesFlowViewController") as! CoursesFlowViewController
        navigationController?.pushViewController(viewController, animated: true)
    }
}

