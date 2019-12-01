//
//  CoursesViewController.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/19/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

class CoursesFlowViewController: UIViewController {
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var coursesCollectionView: UICollectionView!
    
    var flow: [CourseFlow] = []
    var filterFlow: [CourseFlow] = []
    var iteaStudent = IteaStudent()
    var recieveUserInfo = IteaStudent()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundView(image: "bg", color: UIColor.clear, alpha: 1)
        iteaStudent = recieveUserInfo
        
        if filterFlow.count == 0 {
            flow = IteaCourse().makeCoursesFlow()
        } else {
            flow = filterFlow
        }
        coursesCollectionView.register(UINib(nibName: "CoursesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CoursesCollectionViewCell")
        coursesCollectionView.reloadData()
    }
    
    @IBAction func didTapProfileActionButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Profile", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func didTapFilterActionButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Filter", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "FilterViewController") as! FilterViewController
        viewController.flow = IteaCourse().makeCoursesFlow()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

