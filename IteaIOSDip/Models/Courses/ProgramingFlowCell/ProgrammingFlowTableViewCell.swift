//
//  ProgrammingFlowTableViewCell.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/26/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

class ProgrammingFlowTableViewCell: UITableViewCell {

    @IBOutlet weak var programmingFlowImageView: UIImageView!
    @IBOutlet weak var programmingFlowTextlabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateFlowCourseInfo(programmingFlow: TypesOfProgrammingFlow) {
        programmingFlowTextlabel.text = programmingFlow.name
        programmingFlowImageView.image = UIImage(named: programmingFlow.flowImage ?? "noImage")
        programmingFlowImageView.contentMode = .scaleAspectFit
        programmingFlowImageView.clipsToBounds = true
        programmingFlowImageView.layer.masksToBounds = false
        programmingFlowImageView.layer.cornerRadius = 12
        programmingFlowImageView.layer.shadowColor = UIColor.black.cgColor
        programmingFlowImageView.layer.shadowOffset = CGSize(width: 3, height: 3)
        programmingFlowImageView.layer.shadowRadius = 12.0
        programmingFlowImageView.layer.shadowOpacity = 0.3
    }
}
