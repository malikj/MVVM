//
//  MoneyViewModelTests.swift
//  MVVM-SampleTests
//
//  Created by malikj on 14/07/18.
//  Copyright © 2018 malikj. All rights reserved.
//

import XCTest
@testable import MVVM_Sample

class MoneyViewModelTests: XCTestCase {
    
    var viewModel : MoneyViewModel!
    
    fileprivate var service : MockClient!

    override func setUp() {
        super.setUp()
        let dataSource = CurrencyListDataSource()
        self.service = MockClient()
        self.viewModel = MoneyViewModel(service: service, datasourcsse: dataSource)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    func testViewModelNil() {
        XCTAssertNotNil(self.viewModel)
    }
    
    func testServiceNil() {
        XCTAssertNotNil(self.service)
    }
    
    func testfetchMoneyWithoutService() {
        // giving no service to a view model
        viewModel.service = nil
        viewModel.fetchMoney { (moneyRate, error) in
            XCTAssertNotNil(error)
        }
    }
    
    func testFetchMoney() {
        let moneyRate : [String : Double] = ["INR" : 80.0]
        service.moneys = moneyRate
        viewModel.fetchMoney { (moneys, error) in
//            XCTAssertTrue(moneys![0].currencyIso == "INR")
        }
    }
    
    func testRetriveConverter() {
        viewModel.fetchMoney { (moneys, error) in
            XCTAssert(moneys == nil)
        }
    }
    
    
    func testDownloadData() {
        
        let expectation = XCTestExpectation(description: "Download apple.com home page")
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=8e73365e22feaa8ca3e9948844256c13")!
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, _) in
            // Make sure we downloaded some data.
            XCTAssertNotNil(data, "No data was downloaded.")
            
            // Fulfill the expectation to indicate that the background task has finished successfully.
            expectation.fulfill()
            
        }
        
        // Start the download task.
        dataTask.resume()
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
}

 class MockClient : CurrencyServiceProtocol {
    var moneys : [String : Double]?
    func retriveConverter(_ completion: @escaping ([String : Double]? , APIError?) -> Void) {
        if moneys != nil {
            completion(moneys,nil)
        }
        else {
            completion(nil,APIError.Custom(string: "no money available"))

        }
    }
    
    
}
