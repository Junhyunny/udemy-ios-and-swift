//
//  CoinRate.swift
//  ByteCoin
//
//  Created by JUNHYUN KANG on 2022/07/25.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct CoinRateData: Codable {
    var time: String
    var asset_id_base: String
    var asset_id_quote: String
    var rate: Double
}
