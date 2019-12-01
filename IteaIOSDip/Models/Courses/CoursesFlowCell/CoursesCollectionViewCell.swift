//
//  CoursesCollectionViewCell.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/22/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

class CoursesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var mainBackgroundView: UIView!
    @IBOutlet weak var viewCourseLogoView: UIView!
    @IBOutlet weak var courseLogoImageView: UIImageView!
    @IBOutlet weak var mainCourseNameTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

//  MARK: - UPDATE INFO CELL -
extension CoursesCollectionViewCell {
    
    func updateCourseCellInfo(coursesFlow: CourseFlow) {
        
        courseLogoImageView.image = UIImage(named: coursesFlow.coursesImage ?? "noCourseImage")
        courseLogoImageView.contentMode = .scaleAspectFit
        mainCourseNameTextLabel.text = coursesFlow.name ?? "--"
        mainCourseNameTextLabel.text = mainCourseNameTextLabel.text?.uppercased()
        courseLogoImageView.layer.cornerRadius = courseLogoImageView.frame.width / 2
        courseLogoImageView.layer.borderColor = UIColor.white.cgColor
        courseLogoImageView.layer.borderWidth = 3.0
        courseLogoImageView.clipsToBounds = true
        courseLogoImageView.layer.masksToBounds = false
        courseLogoImageView.layer.shadowColor = UIColor.black.cgColor
        courseLogoImageView.layer.shadowOffset = CGSize(width: 3, height: 3)
        courseLogoImageView.layer.shadowRadius = 6
        courseLogoImageView.layer.shadowOpacity = 0.4
        courseLogoImageView.layer.backgroundColor = UIColor.random().cgColor
    }
}


