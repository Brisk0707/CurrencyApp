//
//  PrivatCurrenciesVC.swift
//  MyNetworkApp
//
//  Created by Борис Крисько on 8/25/19.
//  Copyright © 2019 Borys Krisko. All rights reserved.
//

import UIKit

class PrivatCurrenciesVC: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    var privatCurrencies = [Privat]()
    
    let jsonUrl = "https://api.privatbank.ua/p24api/pubinfo?json&exchange&coursid=5"

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
}
