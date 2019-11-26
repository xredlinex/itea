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

    var student = IteaStudent()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        student = iteaStudent()
        tableView.register(UINib(nibName: "CoursesTableViewCell", bundle: nil), forCellReuseIdentifier: "CoursesTableViewCell")
        
        tableView.reloadData()
    }
    
    @IBAction func didTapGoBackButton(_ sender: Any) {
    }
  

}

extension LastCoursesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return student.studentCourses?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoursesTableViewCell") as! CoursesTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
          let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
          let label = UILabel(frame: view.frame)
          
        label.text = "blaaa"
          label.textAlignment = .center
          label.layer.backgroundColor = UIColor.white.cgColor
          label.font = label.font.withSize(25)
          label.text = label.text?.uppercased()
      
          view.addSubview(label)
          return view
      }
    
    
    
    
    
    
}
