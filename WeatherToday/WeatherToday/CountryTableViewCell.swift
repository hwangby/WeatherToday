//
//  CountryTableViewCell.swift
//  WeatherToday
//
//  Created by 황병윤 on 15/05/2019.
//  Copyright © 2019 HBY. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var FlagImageView: UIImageView!
    @IBOutlet weak var hiddenLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
