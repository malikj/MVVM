//
//  ApiClientTests.swift
//  MVVM-SampleTests
//
//  Created by malikj on 14/07/18.
//  Copyright © 2018 malikj. All rights reserved.
//

import XCTest
@testable import MVVM_Sample


class ApiClientTests: XCTestCase {
    
    var viewModel : MoneyViewModel!
    
    fileprivate var service : ApiClient!
    
    
    override func setUp() {
        super.setUp()
        let dataSource = CurrencyListDataSource()
        self.service = ApiClient()
        self.viewModel = MoneyViewModel(service: service, datasourcsse: dataSource)
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testFetchCurrencyDownload () {
        let expectation = XCTestExpectation(description: "Download Currencies")
        viewModel.fetchMoney { (money, error) in
        XCTAssertNotNil(money, "no money data was downloaded");       expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
    
}
