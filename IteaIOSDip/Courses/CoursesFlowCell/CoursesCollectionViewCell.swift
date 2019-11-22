//
//  CoursesCollectionViewCell.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/22/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

class CoursesCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var viewCourseLogoView: UIView!
    @IBOutlet weak var courseLogoImageView: UIImageView!
    
    @IBOutlet weak var mainCourseNameTextLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}


extension CoursesCollectionViewCell {
    
    func updateCourseCellInfo(coursesFlow: CourseFlow) {
        
        courseLogoImageView.image = UIImage(named: coursesFlow.coursesImage ?? "noCourseImage")
        courseLogoImageView.contentMode = .scaleAspectFill
        mainCourseNameTextLabel.text = coursesFlow.name ?? "--"
        
    }
    
    
}
