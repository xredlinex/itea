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
        
        updateCoursesUI()
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


extension CoursesViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoursesTableViewCell") as! CoursesTableViewCell
        cell.updateCourseInfo(course: courses[indexPath.row])
        cell.delegate = self
        cell.tag = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        let label = UILabel(frame: view.frame)
        label.text = flow.name ?? ""
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.layer.backgroundColor = UIColor(red: 46/255, green: 49/255, blue: 66/255, alpha: 1).cgColor

        label.font = label.font.withSize(25)
        label.text = label.text?.uppercased()
    
        view.addSubview(label)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
        
    }
}

extension CoursesViewController: CoursesTableViewCellProtocol {
    func courseInfo(index: Int) {
      
        
        
        let storyboard = UIStoryboard(name: "Courses", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "DetailedCourseViewController") as! DetailedCourseViewController
        
        viewController.recieveCourse = courses[index]
        
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    
    
    
}
    
extension CoursesViewController {
    
    func updateCoursesUI() {
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bg")
        backgroundImage.contentMode = .scaleAspectFill
        let backgroundForImage = UIView(frame: UIScreen.main.bounds)
        backgroundForImage.backgroundColor = UIColor.red
        backgroundForImage.alpha = 0.1
        view.addSubview(backgroundImage)
        view.addSubview(backgroundForImage)
        self.view.sendSubviewToBack(backgroundForImage)
        self.view.sendSubviewToBack(backgroundImage)
        
        
        
    }
    
    
    
}



