//
//  CurrencyVC.swift
//  MyNetworkApp
//
//  Created by Борис Крисько on 8/23/19.
//  Copyright © 2019 Borys Krisko. All rights reserved.
//

import UIKit

class CurrencyVC: UITableViewController {
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var allCurrecies: [Currency] = []

    let jsonUrl = "https://bank.gov.ua/NBUStatService/v1/statdirectory/exchange?json"

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
}

//Сделал правильные переменные в Currency.swift и CurrencyPrivat.swift
