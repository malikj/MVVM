//
//  MoneyViewController.swift
//  MVVM-Sample
//
//  Created by malikj on 13/07/18.
//  Copyright © 2018 malikj. All rights reserved.
//

import UIKit

class MoneyViewController: UIViewController {
    
    let dataSource = CurrencyListDataSource()

    var viewModel : MoneyViewModel?

    @IBOutlet weak var tableView : UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = MoneyViewModel(datasourcsse: dataSource)
        self.tableView.dataSource = self.dataSource
        self.tableView.delegate = self.dataSource

        self.viewModel?.fetchMoney({ (success,error) in
            if success {
                self.tableView.reloadData()
            }
            else {
                // show error
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
