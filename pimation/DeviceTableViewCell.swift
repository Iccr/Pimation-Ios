//
//  DeviceTableViewCell.swift
//  pimation
//
//  Created by shishir sapkota on 5/31/16.
//  Copyright © 2016 shishir sapkota. All rights reserved.
//

import UIKit

class DeviceTableViewCell: UITableViewCell {

    @IBOutlet weak var lblDeviceName: UILabel!
    @IBOutlet weak var switchState: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
