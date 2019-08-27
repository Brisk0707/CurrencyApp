//
//  CurrencyPrivat.swift
//  MyNetworkApp
//
//  Created by Борис Крисько on 8/24/19.
//  Copyright © 2019 Borys Krisko. All rights reserved.
//

struct Privat: Decodable {
    let ccy: String?
    let baseCcy: String?
    let buy: String?
    let sale: String?
    
    init(dictionaryCurrency: [String : Any]) {
        ccy = dictionaryCurrency["ccy"] as? String
        baseCcy = dictionaryCurrency["baseCcy"] as? String
        buy = dictionaryCurrency["buy"] as? String
        sale = dictionaryCurrency["sale"] as? String
    }
    
    static func getCurrencies (from response: Any) -> [Privat] {
        
        var privatCurrencies: [Privat] = []
        
        guard let jsonData = response as? Array<[String: Any]> else { return []}
        
        
        for dictionaryCurrency in jsonData {
            let currency = Privat(dictionaryCurrency: dictionaryCurrency)
            privatCurrencies.append(currency)
        }
        return privatCurrencies
    }
    
}
