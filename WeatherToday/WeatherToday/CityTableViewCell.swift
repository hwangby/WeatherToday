//
//  CityTableViewCell.swift
//  WeatherToday
//
//  Created by 황병윤 on 17/05/2019.
//  Copyright © 2019 HBY. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var rainLabel: UILabel!
    
    @IBOutlet weak var iconView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
