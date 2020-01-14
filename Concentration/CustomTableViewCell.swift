//
//  CustomTableViewCell.swift
//  Concentration
//
//  Created by Максим Чесников on 14.01.2020.
//  Copyright © 2020 Максим Чесников. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var themeName: UILabel!
    @IBOutlet weak var emoji: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
