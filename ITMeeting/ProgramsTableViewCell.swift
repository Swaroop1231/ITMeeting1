//
//  ProgramsTableViewCell.swift
//  ITMeeting
//
//  Created by TEJA on 30/05/16.
//  Copyright © 2016 Satya Swaroop. All rights reserved.
//

import UIKit

class ProgramsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var titlelabel: UILabel!
    @IBOutlet weak var programLabel: UILabel!
    
    
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
