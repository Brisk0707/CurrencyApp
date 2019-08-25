//
//  PrivatCell.swift
//  MyNetworkApp
//
//  Created by Борис Крисько on 8/25/19.
//  Copyright © 2019 Borys Krisko. All rights reserved.
//

import UIKit

class PrivatCell: UITableViewCell {
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var buyLabel: UILabel!
    @IBOutlet weak var sellLabel: UILabel!
    
    func configureCell (privatCurrency: Privat) {
        var correctBuy : Double
        var correctSell: Double
        
        correctBuy = round(Double(privatCurrency.buy)! * 100.00) / 100.00
        correctSell = round(Double(privatCurrency.sale)! * 100.00) / 100.00
        
        
        currencyLabel.text = privatCurrency.ccy
        buyLabel.text = String(correctBuy)
        sellLabel.text = String(correctSell)
//        sellLabel.text = privatCurrency.sale
        
    }
}
