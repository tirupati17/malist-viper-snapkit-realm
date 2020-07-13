//
//  BaseTableViewCell.swift
//  MAList
//
//  Created by Tirupati Balan on 10/07/20.
//  Copyright © 2020 Celerstudio. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    var didSetupConstraints = false

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
