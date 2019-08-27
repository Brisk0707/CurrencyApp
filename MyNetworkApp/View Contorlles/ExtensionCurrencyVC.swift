//
//  ExtensionCurrencyVC.swift
//  MyNetworkApp
//
//  Created by Борис Крисько on 8/25/19.
//  Copyright © 2019 Borys Krisko. All rights reserved.
//

import UIKit


extension CurrencyVC {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allCurrecies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "currency", for: indexPath)
        
        cell.textLabel?.text = allCurrecies[indexPath.row].txt
        cell.detailTextLabel?.text = String(allCurrecies[indexPath.row].rate)
        
        return cell
    }
    
    func getData() {
        
        guard let url = URL(string: jsonUrl) else { return  }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            
            
            guard let data = data else { return }
            
            do {
                self.allCurrecies = try JSONDecoder().decode([Currency].self, from: data)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.dateLabel.text = "Курси валют станом на " + self.allCurrecies[0].exchangeDate
                }
                
            } catch let error {
                print(error)
            }
            } .resume()
    }

}
