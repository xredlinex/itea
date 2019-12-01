//
//  Class+Extension.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/29/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//
import Foundation
import UIKit

extension UIColor {
  static func random() -> UIColor {
    return UIColor(
      red: CGFloat.random(in: 0...1),
      green: CGFloat.random(in: 0...0.6),
      blue: CGFloat.random(in: 0...0.6),
      alpha: 1.0)
  }
}



extension UIViewController {
    func backgroundView(image: String, color: UIColor, alpha: CGFloat) {
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: image)
        backgroundImage.contentMode = .scaleAspectFill
        let backgroundForImage = UIView(frame: UIScreen.main.bounds)
        backgroundForImage.backgroundColor = color
        backgroundForImage.alpha = alpha
        view.addSubview(backgroundImage)
        view.addSubview(backgroundForImage)
        self.view.sendSubviewToBack(backgroundForImage)
        self.view.sendSubviewToBack(backgroundImage)
        
        
    }
}
