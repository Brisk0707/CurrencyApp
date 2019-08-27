//
//  Currency.swift
//  MyNetworkApp
//
//  Created by Борис Крисько on 8/23/19.
//  Copyright © 2019 Borys Krisko. All rights reserved.
//

struct Currency: Decodable {
    let currencyCode: Int
    let txt: String
    let rate: Double
    let currencyChar: String
    let exchangeDate: String
    
    enum CodingKeys: String, CodingKey {
        case currencyCode = "r030"
        case txt = "txt"
        case rate = "rate"
        case currencyChar = "cc"
        case exchangeDate = "exchangedate"
    }
}
