//
//  DetailViewController.swift
//  WeatherToday
//
//  Created by 황병윤 on 18/05/2019.
//  Copyright © 2019 HBY. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var cityToSet: String?
    var tempToSet: String?
    var tempColor: UIColor?
    var rainToSet: String?
    var rainColor: UIColor?
    var imageToSet: UIImage?
    var imageId: String?
    
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var detailTempLabel: UILabel!
    @IBOutlet weak var detailRainLabel: UILabel!
    
    @IBOutlet weak var detailIconView: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.title = self.cityToSet
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.detailIconView.image = imageToSet
        switch imageId {
        case "sunny":
            self.weatherLabel.text = "맑음"
        case "cloudy":
            self.weatherLabel.text = "구름"
        case "rainy":
            self.weatherLabel.text = "비"
        case "snowy":
            self.weatherLabel.text = "눈"
        default:
            self.weatherLabel.text = "알수없음"
        }
        
        self.detailTempLabel.text = tempToSet
        self.detailTempLabel.textColor = tempColor
        self.detailRainLabel.text = rainToSet
        self.detailRainLabel.textColor = rainColor

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
