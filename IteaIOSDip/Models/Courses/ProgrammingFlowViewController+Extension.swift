//
//  ProgrammingFlowViewController+Extension.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 12/1/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

//  MARK: - TABLE VIEW DELEGATE -
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
