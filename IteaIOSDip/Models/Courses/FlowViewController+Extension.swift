//
//  FlowViewController+Extension.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/28/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

//  MARK: - DESCRIPTION COURSE INFO -
extension FlowViewController {

    func flowDescription(course: CourseFlow) {
        
//      flow name
        flowNameTextLabel.text = flow.name ?? "---"
        flowNameTextLabel.text = flowNameTextLabel.text?.uppercased()
        
//        header image
        headerCourseImage.contentMode = .scaleAspectFit
        if let image = flow.flowHeaderImage, image != "" {
            headerCourseImage.image = UIImage(named: flow.flowHeaderImage ?? "noImage")
         } else {
            screenHeaderHeightConstraint.priority = UILayoutPriority(rawValue: 600)
         }
        
//        description
        if let descript = flow.typeDescription, descript != "" {
            flowDiscriptionTextLabel.text = descript
        } else {
            hideDescriptionHeightConstraint.priority = UILayoutPriority(rawValue: 600)
            flowDescriptionView.isHidden = true
        }
        
//        level decription
        if let level = flow.typeLevelDescriptiom, level != "" {
            flowLevelTextLabel.text = level
        } else {
            hideLevelHeightConstraint.priority = UILayoutPriority(rawValue: 600)
            flowLevelView.isHidden = true
        }
    }
}
