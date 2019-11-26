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
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateFlowCourseInfo(programmingFlow: TypesOfProgrammingFlow) {
        
        programmingFlowImageView.image = UIImage(named: programmingFlow.flowImage ?? "noImage")
        programmingFlowImageView.contentMode = .scaleAspectFill
    }
    
}
