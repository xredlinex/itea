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

extension ProgrammingFlowViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return typeOfProgramming.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProgrammingFlowTableViewCell", for: indexPath) as! ProgrammingFlowTableViewCell
        
        cell.updateFlowCourseInfo(programmingFlow: typeOfProgramming[indexPath.row])
  
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        debugPrint("tap")
        
        if let courses = typeOfProgramming[indexPath.row].courses {
            let storyboard = UIStoryboard(name: "Courses", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "CoursesViewController") as! CoursesViewController
            viewController.recieveFlow = flow
            viewController.recieveCourses = courses
            navigationController?.pushViewController(viewController, animated: true)
            }
        }
    }
    

