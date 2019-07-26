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
