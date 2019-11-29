//
//  CoursesViewController+Extension.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/20/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

//  MARK: - SET BACKGROUND -
extension CoursesFlowViewController {
    
    func uiDesignCoursesFlow() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bg")
        backgroundImage.contentMode = .scaleAspectFill
        view.addSubview(backgroundImage)
        self.view.sendSubviewToBack(backgroundImage)
    }
}
