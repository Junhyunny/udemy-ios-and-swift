//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didFailWithError(error: Error)
    func didUpdateCurrency(_ coinManager: CoinManager, coinRate: CoinRateModel)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "265DED34-AAD8-42CB-8072-CCBF4C23948A"
    let currencyArray = ["AUD",  "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    var delegate: CoinManagerDelegate?
    
    func getCoinPrice(for currency: String) {
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        print(urlString)
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {(data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                }
                if let safeData = data {
                    if let coinRate = self.parseJSON(safeData) {
                        self.delegate?.didUpdateCurrency(self, coinRate: coinRate)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ safeData: Data) -> CoinRateModel? {
        let decoder = JSONDecoder()
        var rate: CoinRateModel?
        do {
            let result = try decoder.decode(CoinRateData.self, from: safeData)
            rate = CoinRateModel(
                time: result.time,
                assetIdBase: result.asset_id_base,
                assetIdQuote: result.asset_id_quote,
                rate: result.rate
            )
        } catch {
            self.delegate?.didFailWithError(error: error)
        }
        return rate
    }
}
