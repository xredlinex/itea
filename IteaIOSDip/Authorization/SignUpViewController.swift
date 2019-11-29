//
//  SignUpViewController.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/18/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateSignUpUI()

       
    }
    
    @IBAction func didTapGoBackActionButton(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }
    

}

extension SignUpViewController {
    func updateSignUpUI() {
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "filterBackground")
        backgroundImage.contentMode = .scaleAspectFill
        let backgroundForImage = UIView(frame: UIScreen.main.bounds)
        backgroundForImage.backgroundColor = UIColor.red
        backgroundForImage.alpha = 0.8
        view.addSubview(backgroundImage)
        view.addSubview(backgroundForImage)
        self.view.sendSubviewToBack(backgroundForImage)
        self.view.sendSubviewToBack(backgroundImage)
        
        
}


}
