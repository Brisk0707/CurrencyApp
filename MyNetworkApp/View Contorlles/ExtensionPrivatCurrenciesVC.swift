//
//  ExtensionPrivatCurrenciesVC.swift
//  MyNetworkApp
//
//  Created by Борис Крисько on 8/25/19.
//  Copyright © 2019 Borys Krisko. All rights reserved.
//

import UIKit

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
    
    func getData() {
        
        guard let url = URL(string: jsonUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            
            guard let data = data else { return }
            do {
                
                self.privatCurrencies = try JSONDecoder().decode([Privat].self, from: data)
                
                DispatchQueue.main.async {
                    self.tableViewOutlet.reloadData()
                    
                }
                
            } catch let error {
                print(error)
            }
            
            } .resume()
        
    }
}
