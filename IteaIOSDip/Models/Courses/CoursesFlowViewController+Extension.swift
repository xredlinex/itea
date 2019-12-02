//
//  CoursesViewController+Extension.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/20/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

//  MARK: - COLLECTION VIEW - ALL COURSES -
extension CoursesFlowViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return flow.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CoursesCollectionViewCell", for: indexPath) as! CoursesCollectionViewCell
        cell.updateCourseCellInfo(coursesFlow: flow[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: collectionView.frame.width / 2 - 5, height: 200 )
           return size
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Courses", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "FlowViewController") as! FlowViewController
        viewController.recieveFlow = flow[indexPath.row]
        navigationController?.pushViewController(viewController, animated: true)
    }
}
