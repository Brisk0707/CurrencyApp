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
    private var privatCurrencies = [Privat]()
    private let jsonUrl = "https://api.privatbank.ua/p24api/pubinfo?json&exchange&coursid=5"

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return privatCurrencies.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "privatCurrency", for: indexPath) as! PrivatCell
        
        let privatCurrency = privatCurrencies[indexPath.row]
        
        cell.configureCell(privatCurrency: privatCurrency)
        
        
        return cell

    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func getData() {
        
        guard let url = URL(string: jsonUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            
            guard let data = data else { return }
            do {
                
                self.privatCurrencies = try JSONDecoder().decode([Privat].self, from: data)
                print(self.privatCurrencies)
                
                DispatchQueue.main.async {
                   self.tableViewOutlet.reloadData()

                }
                  
                
                
            } catch let error {
                print(error)
            }
            
            } .resume()
        
    }

}
