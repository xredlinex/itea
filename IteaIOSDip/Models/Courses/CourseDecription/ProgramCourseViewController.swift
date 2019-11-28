//
//  ProgramCourseViewController.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/22/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

class ProgramCourseViewController: UIViewController {

    
    @IBOutlet weak var clearImageView: UIImageView!
    @IBOutlet weak var programTextLabel: UILabel!
    
    @IBOutlet weak var courseProgramTextView: UITextView!
    
    @IBOutlet weak var programCourseView: UIView!
    var courseRecieve = Courses()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        programInfoUpdate(course: courseRecieve)
       
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
                   let backgroundForImage = UIView(frame: UIScreen.main.bounds)
                   backgroundImage.image = UIImage(named: "programBg")
                   backgroundImage.contentMode = .scaleAspectFill
                   backgroundForImage.backgroundColor = UIColor.init(red: 19/255, green: 58/255, blue: 85/255, alpha: 1)
                   backgroundForImage.alpha = 0.9
                   view.addSubview(backgroundImage)
                   view.addSubview(backgroundForImage)
                   self.view.sendSubviewToBack(backgroundForImage)
                   self.view.sendSubviewToBack(backgroundImage)
        
    }
    
    @IBAction func didTapBackToMain(_ sender: Any) {
        let blurEffect = UIBlurEffect(style: .systemMaterialLight)
              let blurVisualEffectView = UIVisualEffectView(effect: blurEffect)
              blurVisualEffectView.frame = view.bounds
              self.view.addSubview(blurVisualEffectView)
        
        let backAlert = UIAlertController(title: "Перейти", message: "назад к выбору курса?", preferredStyle: .alert)
        let backACtion = UIAlertAction(title: "Да", style: .default) { (_) in
             blurVisualEffectView.removeFromSuperview()
            let storyboard = UIStoryboard(name: "Courses", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "CoursesFlowViewController") as! CoursesFlowViewController
            self.navigationController?.pushViewController(viewController, animated: false)
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel) { (_) in
            blurVisualEffectView.removeFromSuperview()
        }
        backAlert.addAction(backACtion)
        backAlert.addAction(cancelAction)
        
        present(backAlert, animated: true, completion: nil)
        
        
    }
    
    
    @IBAction func didTapGoBackActionButton(_ sender: Any) {
        navigationController?.popViewController(animated: false)
        
     
    }
    
    
    
    
    
 

}

extension ProgramCourseViewController {
    
    func programInfoUpdate(course: Courses) {
        courseProgramTextView.text = course.courseProgram
        
        
    }
    
  
    
}


extension ProgramCourseViewController {
    
    func addBlurToView() {
//        var blurEffect: UIBlurEffect!
//        blurEffect = UIBlurEffect(style: .light)
//        let blurEffectView = UIVisualEffectView(effect: blurEffect)
//        blurEffectView.frame = self.bounds
//        blurEffectView.alpha = 0.9
//        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        self.addSubview(blurEffectView)
      
        
    }
    
    func removeBlurFromView() {
//        for subview in self.subviews {
//            if subview is UIVisualEffectView{
//                subview.removeFromSuperview()
//
                
//                blurVisualEffectView.removeFromSuperview()
//            }
//        }
    }
}





//let alertController = UIAlertController.init(title: "Title", message: "Message", preferredStyle: .Alert)
//
//alertController.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action: UIAlertAction!) in
//    print("Handle Ok logic here")
//
//}))
//
//alertController.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: { (action: UIAlertAction!) in
//    print("Handle Cancel Logic here")
//
//}))
//
//self.presentViewController(alertController, animated: true, completion: nil)
