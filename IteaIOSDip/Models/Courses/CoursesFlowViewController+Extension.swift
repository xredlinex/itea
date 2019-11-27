//
//  CoursesViewController+Extension.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/20/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

extension CoursesFlowViewController {
    
    func uiDesignCoursesFlow() {
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bg")
        backgroundImage.contentMode = .scaleAspectFill
//        let backgroundForImage = UIView(frame: UIScreen.main.bounds)
//        backgroundForImage.backgroundColor = UIColor.red
//        backgroundForImage.alpha = 0.8
        view.addSubview(backgroundImage)
//        view.addSubview(backgroundForImage)
//        self.view.sendSubviewToBack(backgroundForImage)
        self.view.sendSubviewToBack(backgroundImage)
    }
}
