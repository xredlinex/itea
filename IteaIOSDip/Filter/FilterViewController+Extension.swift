//
//  FilterViewController+Extension.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/27/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

extension FilterViewController {
    
    
    func uidesignFilter() {
      
              let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
              backgroundImage.image = UIImage(named: "filterBackground")
              backgroundImage.contentMode = .scaleAspectFill
              let backgroundForImage = UIView(frame: UIScreen.main.bounds)
           let blackBackgound = UIView(frame: UIScreen.main.bounds)
               backgroundForImage.backgroundColor = UIColor.red
        blackBackgound.backgroundColor = UIColor.black
               backgroundForImage.alpha = 0.7
        blackBackgound.alpha = 0.2
              view.addSubview(backgroundImage)
        view.addSubview(blackBackgound)
                      view.addSubview(backgroundForImage)
        self.view.sendSubviewToBack(blackBackgound)
                      self.view.sendSubviewToBack(backgroundForImage)
              self.view.sendSubviewToBack(backgroundImage)
      
          }
    
    
    
}
