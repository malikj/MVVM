//
//  CurrencyDatasourceTests.swift
//  MVVM-SampleTests
//
//  Created by malikj on 14/07/18.
//  Copyright © 2018 malikj. All rights reserved.
//

import XCTest

@testable import MVVM_Sample

class CurrencyDatasourceTests: XCTestCase {
    
    var datasource : CurrencyListDataSource!
    override func setUp() {
       datasource = CurrencyListDataSource()
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testEmptyValueinDataSource() {
        
        let finalRates = [MoneyRate]()
        
        datasource.setCurrecies(finalRates)
        
        let tableView = UITableView()
        tableView.dataSource = datasource
        
        // expected one section
         XCTAssertEqual(datasource.numberOfSectionsInTableView(tableView: tableView),1,"expected one section in tableview")
        // expected zero cells
        XCTAssertEqual(datasource.tableView(tableView, numberOfRowsInSection: 0), 0, "Expected no cell in table view")
    }
    
    func testValueInDataSource() {
        
        let rate1 = MoneyRate(currencyIso: "INR", rate: 80)
        let rate2 = MoneyRate(currencyIso: "GET", rate: 1.0)
        let finalRates = [rate1,rate2]
        // giving data value
        
        let tableView = UITableView()
        tableView.dataSource = datasource

        datasource.setCurrecies(finalRates)
        
        // expected one section
        XCTAssertEqual(datasource.numberOfSectionsInTableView(tableView: tableView),1,"expected one section in tableview")

        // expected two cells
        XCTAssertEqual(datasource.tableView(tableView, numberOfRowsInSection: 0), 2, "Expected two cell in table view")
    }
    
    func testValueCell() {
        
        // giving data value
        let rate1 = MoneyRate(currencyIso: "INR", rate: 80)
        let finalRates = [rate1]
        
        let tableView = UITableView()
        tableView.dataSource = datasource
        datasource.setCurrecies(finalRates)
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MoneyListCell")

        // expected CurrencyCell class
        guard let _ = datasource.tableView(tableView, cellForRowAt: indexPath) as? UITableViewCell else {
            XCTAssert(false, "Expected MoneyListCell class")
            return
        }
    }
    
}
