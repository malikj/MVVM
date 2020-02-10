//
//  CurrencyDatasource.swift
//  MVVM-Sample
//
//  Created by malikj on 14/07/18.
//  Copyright © 2018 malikj. All rights reserved.
//

import Foundation
import UIKit

class CurrencyListDataSource: NSObject, UITableViewDataSource,UITableViewDelegate {
    
    private var currencies = [MoneyRate]()
    
    func setCurrecies(_ currencies:[MoneyRate]) {
        self.currencies = currencies
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.currencies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currency = self.currencies[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoneyListCell", for: indexPath)
        cell.textLabel?.text = currency.currencyIso
        let rate :String = String(format:"%f", currency.rate)
        cell.detailTextLabel?.text = rate
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("didselect")
    }
    
//    - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

    
    
}
