//
//  CoursesViewController.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/19/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

class CoursesFlowViewController: UIViewController {
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var coursesCollectionView: UICollectionView!
    
    var courses: [CourseFlow] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        courses = IteaCourse().makeCoursesFlow()
        
        coursesCollectionView.register(UINib(nibName: "CoursesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CoursesCollectionViewCell")
        coursesCollectionView.reloadData()

    }
    
    @IBAction func didTapProfileActionButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Profile", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func didTapFilterActionButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Courses", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "FilterViewController") as! FilterViewController
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension CoursesFlowViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return courses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CoursesCollectionViewCell", for: indexPath) as! CoursesCollectionViewCell
        cell.updateCourseCellInfo(coursesFlow: courses[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           let size = CGSize(width: collectionView.frame.width / 2 - 5, height: collectionView.frame.height / 5 - 5)
           return size
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        
    }
    
}

extension CoursesFlowViewController {
    

    
    
    
}
