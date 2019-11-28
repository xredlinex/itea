//
//  CoursesViewController+Extension.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/26/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

//  MARK: - UI DESIGN / BACKGROUND / ETC
extension CoursesViewController {
    
    func uiDesignCourses() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        let backgroundForImage = UIView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "backgroundfor")
        backgroundImage.contentMode = .scaleAspectFill
        backgroundForImage.backgroundColor = UIColor.init(red: 19/255, green: 58/255, blue: 85/255, alpha: 1)
        backgroundForImage.alpha = 0.9
        view.addSubview(backgroundImage)
        view.addSubview(backgroundForImage)
        self.view.sendSubviewToBack(backgroundForImage)
        self.view.sendSubviewToBack(backgroundImage)
    }
}
