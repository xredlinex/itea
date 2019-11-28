//
//  CoursesTableViewCell.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/22/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

protocol CoursesTableViewCellProtocol {
    func courseInfo(index: Int)
}

class CoursesTableViewCell: UITableViewCell {

    @IBOutlet weak var viewForCourseView: UIView!
    @IBOutlet weak var viewForImageView: UIView!
    @IBOutlet weak var courseImageView: UIImageView!
    @IBOutlet weak var courseNameTextLabel: UILabel!
    
    var delegate: CoursesTableViewCellProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func didTapDetailedActionButton(_ sender: Any) {
        delegate?.courseInfo(index: tag)
    }
}


//  MARK: 
extension CoursesTableViewCell {
    
    func updateCourseInfo(course: Courses) {
        courseNameTextLabel.text = course.courseName ?? "-"
        courseNameTextLabel.text = courseNameTextLabel.text?.uppercased()
        courseImageView.image = UIImage(named: course.courseImage ?? "noCourseImage")
        courseImageView.clipsToBounds = true
        courseImageView.layer.cornerRadius = 12
        courseImageView.contentMode = .scaleAspectFill
        viewForImageView.clipsToBounds = true
        viewForImageView.layer.masksToBounds = false
        viewForImageView.layer.cornerRadius = 12
        viewForImageView.layer.shadowColor = UIColor.black.cgColor
        viewForImageView.layer.shadowOffset = CGSize(width: 1, height: 1)
        viewForImageView.layer.shadowRadius = 12.0
        viewForImageView.layer.shadowOpacity = 0.2
        viewForImageView.layer.backgroundColor = UIColor.lightGray.cgColor
    }
}
