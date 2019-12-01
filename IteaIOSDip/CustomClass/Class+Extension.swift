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

extension UIButton {
    public func iteaButton() {
        let button = self
        button.clipsToBounds = true
        button.layer.backgroundColor = UIColor(red: 111/255, green: 169/255, blue: 145/255, alpha: 1).cgColor
        button.layer.cornerRadius = 12.0
        button.isOpaque = true
        button.layer.masksToBounds = false
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize(width: 10, height: 10)
        button.layer.shadowRadius = 12.0
    }
}

extension UIView {
    public func blurbuttons() {
        let view = self
        let blurEffect = UIBlurEffect(style: .prominent)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(blurView, at: 0)
        blurView.clipsToBounds = true
        blurView.layer.cornerRadius = 12.0
        NSLayoutConstraint.activate([blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
                                    blurView.widthAnchor.constraint(equalTo: view.widthAnchor)])
    }
}




