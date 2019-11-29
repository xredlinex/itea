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
        uidesignProgramming()
        
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
        let label = UILabel(frame: view.frame)
        
        label.text = "Выберите свой курс" /*flow.name*/
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.text = label.text?.uppercased()
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        view.addSubview(label)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        if let courses = typeOfProgramming[indexPath.row].courses {
            let storyboard = UIStoryboard(name: "Courses", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "CoursesViewController") as! CoursesViewController
            viewController.recieveFlow = flow
            viewController.recieveCourses = courses
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
    

extension ProgrammingFlowViewController {
       func uidesignProgramming() {
    
            let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
            backgroundImage.image = UIImage(named: "onemore")
            backgroundImage.contentMode = .scaleAspectFill
                    let backgroundForImage = UIView(frame: UIScreen.main.bounds)
                    backgroundForImage.backgroundColor = UIColor.init(red: 19/255, green: 58/255, blue: 85/255, alpha: 1)
                    backgroundForImage.alpha = 0.9
            view.addSubview(backgroundImage)
                    view.addSubview(backgroundForImage)
                    self.view.sendSubviewToBack(backgroundForImage)
            self.view.sendSubviewToBack(backgroundImage)
    
        }
}
