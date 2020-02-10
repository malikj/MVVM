//
//  MoneyViewModel.swift
//  MVVM-Sample
//
//  Created by malikj on 13/07/18.
//  Copyright © 2018 malikj. All rights reserved.
//

import Foundation

struct MoneyViewModel {
    
    weak var service: CurrencyServiceProtocol?
    
    weak var dataSource : CurrencyListDataSource?

    init (service:CurrencyServiceProtocol = ApiClient.shared, datasourcsse:CurrencyListDataSource) {
        self.service = service
        self.dataSource = datasourcsse
    }

    func checkEmptyService(_ completion: @escaping (Bool, APIError?) -> Void)  {
        guard service != nil else {
            completion(false, APIError.ServerError(message: "missing Service"))
            return
        }
    }
    
    func fetchMoney(_ completion: @escaping (Bool, APIError?) -> Void)  {
        checkEmptyService(completion)
        self.service?.retriveConverter({ (response, error) in
            if response != nil {
                self.handleResponse(response!, completion)
            }
            else if error != nil {
                completion(false,APIError.ServerError(message: "Server error"));
            }
        })
    }
    
    func handleResponse(_ response :[String:Double], _ completion: @escaping (Bool, APIError?) -> Void ) {
        let finalRates : [MoneyRate] = response.compactMap({ MoneyRate(currencyIso: $0.key, rate: $0.value) })
        self.dataSource?.setCurrecies(finalRates)
        completion(true, nil)
    }
}
