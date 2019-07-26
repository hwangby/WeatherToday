//
//  ViewController.swift
//  WeatherToday
//
//  Created by 황병윤 on 15/05/2019.
//  Copyright © 2019 HBY. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let cellIdentifier = "cell"
    let countryCellIdentifier = "countryCell"
    var countries: [Country] = []

    // section title
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "세계날씨"
//    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let countryCell: CountryTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.countryCellIdentifier, for: indexPath) as! CountryTableViewCell

        let country: Country = self.countries[indexPath.row]
        countryCell.countryLabel?.text = country.koreanName
        countryCell.FlagImageView.image = UIImage.init(imageLiteralResourceName: "flag_" + country.assetName)
 
        countryCell.hiddenLabel?.text = country.assetName
        
        return countryCell
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        // Navigation Item - titleView
        
        //self.navigationController?.navigationBar.topItem?.title = "세계 날씨"
        
        
//        let titleLabel = UILabel()
//        titleLabel.attributedText = NSAttributedString(string: "세계 날씨")
//        //titleLabel.text = "세계 날씨"
//        titleLabel.sizeToFit()
//        titleLabel.textColor = UIColor.white
//        //navigationItem.titleView = titleLabel
//        self.navigationController?.navigationBar.topItem?.titleView = titleLabel

        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "countries") else {
            return
        }
        
        do {
            self.countries = try jsonDecoder.decode([Country].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    
    

    }

    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        // segue.identifier = // 세그가 여러개일때
        
        guard let nextViewController: CityViewController = segue.destination as? CityViewController else {
            return
        }
        
        guard let countryCell: CountryTableViewCell = sender as? CountryTableViewCell else {
            return
        }
        
        nextViewController.textToSet = countryCell.countryLabel.text
        nextViewController.assetToSet = countryCell.hiddenLabel.text
    }

}

