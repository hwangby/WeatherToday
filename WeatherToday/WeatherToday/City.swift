//
//  City.swift
//  WeatherToday
//
//  Created by 황병윤 on 18/05/2019.
//  Copyright © 2019 HBY. All rights reserved.
//

import Foundation

/*
 "city_name":"베를린",
 "state":12,
 "celsius":10.8,
 "rainfall_probability":60
 */
struct City: Codable {
    let cityName: String
    let state: Int
    let celsius: Double
    let rainfallProbability: Int
    
    enum CodingKeys: String, CodingKey {
        case state, celsius
        case cityName = "city_name"
        case rainfallProbability = "rainfall_probability"
    }

}
