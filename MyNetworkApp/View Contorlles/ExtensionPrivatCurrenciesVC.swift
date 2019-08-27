//
//  ExtensionPrivatCurrenciesVC.swift
//  MyNetworkApp
//
//  Created by Борис Крисько on 8/25/19.
//  Copyright © 2019 Borys Krisko. All rights reserved.
//

import UIKit
import Alamofire

extension PrivatCurrenciesVC {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return privatCurrencies.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "privatCurrency", for: indexPath) as! PrivatCell
        
        let privatCurrency = privatCurrencies[indexPath.row]
        
        cell.configureCell(privatCurrency: privatCurrency)
        
        return cell
    }
    
    func getDataAlamofire() {
        guard let url = URL(string: jsonUrl) else { return }
        
        request(url).validate().responseJSON { response in
            
            switch response.result {
            case .success(let value):
                
                self.privatCurrencies = Privat.getCurrencies(from: value)
                
                DispatchQueue.main.async {
                    self.tableViewOutlet.reloadData()
                }
                
            case .failure(let error):
                print(error)
            }
        }
}
}
