//
//  CoursesViewController+Extension.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/26/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

//  MARK: - TABLE VIEW DELEGATE -
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
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        let label = UILabel(frame: view.frame)
        label.text = flow.name ?? ""
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.layer.backgroundColor = UIColor(red: 19/255, green: 58/255, blue: 85/255, alpha: 1).cgColor
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.text = label.text?.uppercased()
        view.addSubview(label)
        return view
    }
}
