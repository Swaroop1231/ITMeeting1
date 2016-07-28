//
//  CalenderTableViewCell.swift
//  ITMeeting
//
//  Created by TEJA on 10/06/16.
//  Copyright © 2016 Satya Swaroop. All rights reserved.
//

import UIKit

class CalenderTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var companyLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    @IBOutlet weak var noteButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
