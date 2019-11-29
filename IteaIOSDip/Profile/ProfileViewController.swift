//
//  ProfileViewController.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/22/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    
    
    @IBOutlet weak var viewForStudentView: UIView!
    @IBOutlet weak var studentImageView: UIImageView!
    @IBOutlet weak var nameStudentView: UIView!
    @IBOutlet weak var nameTextLabel: UILabel!
    
 
    
    @IBOutlet weak var studentInfoView: UIView!
    
    
    @IBOutlet weak var lastCourseButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateProfileUI()
    }
    

    @IBAction func didTapEditProfileActionButton(_ sender: Any) {
    }
    
    @IBAction func didTapGoBackActionButton(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }
    
    
    @IBAction func didTapLastCourse(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Profile", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "LastCoursesViewController") as! LastCoursesViewController
        
        navigationController?.pushViewController(viewController, animated: true)
        
        
    }
}

extension ProfileViewController {
    
    func updateProfileUI() {
        
        
        viewForStudentView.clipsToBounds = true
        viewForStudentView.layer.masksToBounds = false
        viewForStudentView.layer.cornerRadius = viewForStudentView.frame.width / 2
        viewForStudentView.layer.shadowColor = UIColor.black.cgColor
        viewForStudentView.layer.shadowOffset = CGSize(width: 3, height: 3)
        viewForStudentView.layer.shadowRadius = 12.0
        viewForStudentView.layer.shadowOpacity = 0.4
        
        studentImageView.image = UIImage(named: "noCourseImage")
        studentImageView.clipsToBounds = true
        studentImageView.contentMode = .scaleAspectFill
        studentImageView.layer.cornerRadius = studentImageView.frame.width / 2
        studentImageView.layer.borderColor = UIColor.red.cgColor
        studentImageView.layer.borderWidth = 2
        
        nameStudentView.clipsToBounds = true
        nameStudentView.layer.masksToBounds = false
        nameStudentView.layer.cornerRadius = 12.0
        nameStudentView.layer.shadowColor = UIColor.black.cgColor
        nameStudentView.layer.shadowOffset = CGSize(width: 10, height: 10)
        nameStudentView.layer.shadowRadius = 30.0
        nameStudentView.layer.shadowOpacity = 0.4
        
    }
}
