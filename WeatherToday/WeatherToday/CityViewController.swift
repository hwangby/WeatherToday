//
//  CityViewController.swift
//  WeatherToday
//
//  Created by 황병윤 on 16/05/2019.
//  Copyright © 2019 HBY. All rights reserved.
//

import UIKit

class CityViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var cityTableView: UITableView!
    var cities: [City] = []
    let cityCellIdentifier = "cityCell"
    
    var textToSet: String?
    var assetToSet: String?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cities.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cityCell: CityTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cityCellIdentifier, for: indexPath) as! CityTableViewCell
        
        let city: City = self.cities[indexPath.row]
        cityCell.cityLabel?.text = city.cityName
        cityCell.tempLabel?.text = city.celsiusAndFahrenheit
        if city.celsius < 10 {
            cityCell.tempLabel.textColor = UIColor.blue
        }
        cityCell.rainLabel?.text = "강수확률 \( String(city.rainfallProbability))%"
        if city.rainfallProbability >= 50 {
            cityCell.rainLabel.textColor = UIColor.orange
        } else {
            cityCell.rainLabel.textColor = UIColor.black
        }
        
        switch city.state {
        case 10:
            cityCell.iconView.image = UIImage.init(named: "sunny")
            cityCell.iconView.restorationIdentifier = "sunny"
        case 11:
            cityCell.iconView.image = UIImage.init(named: "cloudy")
            cityCell.iconView.restorationIdentifier = "cloudy"
        case 12:
            cityCell.iconView.image = UIImage.init(named: "rainy")
            cityCell.iconView.restorationIdentifier = "rainy"
        case 13:
            cityCell.iconView.image = UIImage.init(named: "snowy")
            cityCell.iconView.restorationIdentifier = "snowy"
        default:
            cityCell.iconView.image = UIImage.init()
        }

        return cityCell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //self.cityTableView.delegate = self
        //self.cityTableView.dataSource = self
        
        let cityJsonDecoder: JSONDecoder = JSONDecoder()
        guard let cityDataAsset: NSDataAsset = NSDataAsset(name:
            assetToSet!) else {
                return
        }
        
        do {
            self.cities = try cityJsonDecoder.decode([City].self, from: cityDataAsset.data)
        } catch {
            print(error)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.title = self.textToSet
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        guard let detailViewController: DetailViewController = segue.destination as? DetailViewController else {
            return
        }
        
        guard let cityCell: CityTableViewCell = sender as? CityTableViewCell else {
            return
        }
        
        detailViewController.cityToSet = cityCell.cityLabel.text
        detailViewController.imageToSet = cityCell.iconView.image
        detailViewController.imageId = cityCell.iconView.restorationIdentifier
        detailViewController.rainToSet = cityCell.rainLabel.text
        detailViewController.rainColor = cityCell.rainLabel.textColor
        detailViewController.tempToSet = cityCell.tempLabel.text
        detailViewController.tempColor = cityCell.tempLabel.textColor
     
    }
}
