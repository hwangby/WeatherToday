//
//  Country.swift
//  WeatherToday
//
//  Created by 황병윤 on 15/05/2019.
//  Copyright © 2019 HBY. All rights reserved.
//

import Foundation

/*
 {"korean_name":"한국","asset_name":"kr"},
 {"korean_name":"독일","asset_name":"de"},
 {"korean_name":"이탈리아","asset_name":"it"},
 {"korean_name":"미국","asset_name":"us"},
 {"korean_name":"프랑스","asset_name":"fr"},
 {"korean_name":"일본","asset_name":"jp"}
 */

struct Country: Codable {
    
    let koreanName: String
    let assetName: String

    
    enum CodingKeys: String, CodingKey {
        case koreanName = "korean_name"
        case assetName = "asset_name"
    }
}

/*
 {
 "city_name":"베를린",
 "state":12,
 "celsius":10.8,
 "rainfall_probability":60
 }
 */
struct City: Codable {
    let cityName: String
    let state: Int
    let celsius: Double
    let rainfallProbability: Int
    
    var celsiusAndFahrenheit: String {
        let fahrenheit: Double = round((celsius * 1.8 + 32) * 10)
        return "섭씨 \(self.celsius)도 / 화씨 \((fahrenheit/10))도"
    }
    
    
    enum CodingKeys: String, CodingKey {
        case state, celsius
        case cityName = "city_name"
        case rainfallProbability = "rainfall_probability"
    }
    
}
