//
//  ListCoursesViewController+Extension.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 12/1/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

//  MARK: - TABLE VIEW - 
extension LastCoursesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return studentCourses.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentCourses[section].courses?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let storyboard = UIStoryboard(name: "Courses", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "DetailedCourseViewController") as! DetailedCourseViewController
        if let course = studentCourses[indexPath.section].courses {
            viewController.recieveCourse = course[indexPath.row]
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoursesTableViewCell") as! CoursesTableViewCell
        if let course = studentCourses[indexPath.section].courses {
            cell.updateCourseInfo(course: course[indexPath.row])
        }
        cell.delegate = self
        cell.tag = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        let label = UILabel(frame: view.frame)
        label.text = studentCourses[section].courseProgress
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.layer.backgroundColor = UIColor(red: 19/255, green: 58/255, blue: 85/255, alpha: 1).cgColor
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.text = label.text?.uppercased()
        view.addSubview(label)
        return view
    }
}

