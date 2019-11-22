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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        tableView.reloadData()
    }
}



