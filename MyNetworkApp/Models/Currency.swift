//
//  Currency.swift
//  MyNetworkApp
//
//  Created by Борис Крисько on 8/23/19.
//  Copyright © 2019 Borys Krisko. All rights reserved.
//

struct Currency : Decodable {
    let r030 : Int
    let txt : String
    let rate : Double
    let cc : String
    let exchangedate: String
}
