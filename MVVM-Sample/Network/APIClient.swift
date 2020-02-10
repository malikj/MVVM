//
//  APIClient.swift
//  MVVM-Sample
//
//  Created by malikj on 13/07/18.
//  Copyright © 2018 malikj. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

let endpoint = "http://data.fixer.io/api/latest?access_key=8e73365e22feaa8ca3e9948844256c13"


/*
 swifty {
 "base" : "EUR",
 "date" : "2018-07-14",
 "timestamp" : 1531545547,
 "rates" : {
 "XAF" : 655.56672800000001,
 "RON" : 4.6434660000000001,
 "MYR" : 4.7344920000000004,
 "ZMK" : 10521.520044999999,
 "XAU" : 0.00094200000000000002,
 "ANG" : 2.1512500000000001,
 "SVC" : 10.228320999999999,
 "BTN" : 80.186638000000002,
 "NGN" : 418.46712600000001,
 "BWP" : 11.970608,
 "MRO" : 414.96042299999999,
 "MAD" : 11.063698,
 "HTG" : 78.772267999999997,
 "SGD" : 1.595906,
 "ALL" : 125.66157,
 "RWF" : 996.38326400000005,
 "SEK" : 10.362550000000001,
 "JEP" : 0.883243,
 "AMD" : 561.85588099999995,
 "TZS" : 2651.0689090000001,
 "SLL" : 9584.9923889999991,
 "MVR" : 18.200237999999999,
 "GEL" : 2.8405520000000002,
 "USD" : 1.168901,
 "LAK" : 9821.1104969999997,
 "TWD" : 35.726303000000001,
 "BND" : 1.5801259999999999,
 "GYD" : 242.06779900000001,
 "FJD" : 2.440788,
 "KGS" : 79.839714999999998,
 "AOA" : 297.16398099999998,
 "GNF" : 10530.633691999999,
 "CUP" : 30.975888999999999,
 "BDT" : 97.790300999999999,
 "OMR" : 0.44979799999999998,
 "INR" : 80.056889999999996,
 "MZN" : 68.252155000000002,
 "JOD" : 0.82817099999999999,
 "THB" : 38.912731000000001,
 "CNY" : 7.819839,
 "COP" : 3338.2655719999998,
 "LSL" : 15.488390000000001,
 "CUC" : 1.168901,
 "AUD" : 1.573814,
 "XDR" : 0.83374499999999996,
 "PKR" : 142.068285,
 "EUR" : 1,
 "ZAR" : 15.500456,
 "LBP" : 1759.78557,
 "MKD" : 61.344392999999997,
 "TJS" : 11.010472,
 "SHP" : 0.88310999999999995,
 "VND" : 26942.009811,
 "IQD" : 1383.9793320000001,
 "CAD" : 1.537812,
 "WST" : 3.038681,
 "DJF" : 207.48455799999999,
 "DKK" : 7.4548220000000001,
 "SBD" : 9.1937650000000009,
 "KES" : 117.41614800000001,
 "PLN" : 4.314654,
 "JPY" : 131.30270400000001,
 "TND" : 3.0981779999999999,
 "RUB" : 73.093746999999993,
 "BRL" : 4.500159,
 "LRD" : 185.890398,
 "CDF" : 1829.9198220000001,
 "PEN" : 3.8170519999999999,
 "BTC" : 0.00018799999999999999,
 "CVE" : 110.465743,
 "PYG" : 6667.414342,
 "KZT" : 400.301984,
 "SRD" : 8.6386149999999997,
 "TMT" : 3.9742649999999999,
 "KYD" : 0.95894699999999999,
 "HKD" : 9.1724160000000001,
 "MNT" : 2861.4711849999999,
 "MXN" : 22.071242999999999,
 "CLF" : 0.027668000000000002,
 "UZS" : 9097.5604739999999,
 "PAB" : 1.168901,
 "GHS" : 5.597289,
 "GGP" : 0.883243,
 "KHR" : 4730.544629,
 "ILS" : 4.2478340000000001,
 "IDR" : 16800.620722,
 "XCD" : 3.1602489999999999,
 "DOP" : 57.779259000000003,
 "ERN" : 17.522292,
 "VUV" : 128.871814,
 "XOF" : 655.56672800000001,
 "MWK" : 833.94106199999999,
 "IRR" : 50484.854581,
 "SDG" : 20.987863999999998,
 "KWD" : 0.35394799999999998,
 "BHD" : 0.442083,
 "FKP" : 0.88275899999999996,
 "MDL" : 19.444721999999999,
 "MUR" : 39.917986999999997,
 "ARS" : 31.789442999999999,
 "GBP" : 0.88318700000000006,
 "BMD" : 1.168901,
 "CZK" : 25.888831,
 "IMP" : 0.883243,
 "MMK" : 1661.0093830000001,
 "XAG" : 0.073913000000000006,
 "STD" : 24508.356965999999,
 "NAD" : 15.491496,
 "ZMW" : 11.514104,
 "HRK" : 7.4170350000000003,
 "NZD" : 1.7285759999999999,
 "UYU" : 36.633800999999998,
 "BSD" : 1.168901,
 "TTD" : 7.8939469999999998,
 "BAM" : 1.9591270000000001,
 "BGN" : 1.9635260000000001,
 "LVL" : 0.72536199999999995,
 "GIP" : 0.88310999999999995,
 "EGP" : 20.853660999999999,
 "CRC" : 659.50591999999995,
 "HUF" : 322.72199999999998,
 "MOP" : 9.4475339999999992,
 "NOK" : 9.4792109999999994,
 "LYD" : 1.6026100000000001,
 "KRW" : 1319.1097319999999,
 "NIO" : 36.563239000000003,
 "BBD" : 2.3378030000000001,
 "HNL" : 27.968351999999999,
 "JMD" : 151.665415,
 "BOB" : 8.0191309999999998,
 "GMD" : 55.370860999999998,
 "DZD" : 137.532951,
 "GTQ" : 8.7556609999999999,
 "KMF" : 493.38161400000001,
 "QAR" : 4.2545719999999996,
 "UAH" : 30.636906,
 "SZL" : 15.514015000000001,
 "SAR" : 4.3836190000000004,
 "AED" : 4.2930289999999998,
 "ISK" : 125.18934400000001,
 "AZN" : 1.986553,
 "BZD" : 2.3352360000000001,
 "AFN" : 84.347933999999995,
 "PGK" : 3.8013129999999999,
 "PHP" : 62.547915000000003,
 "ETB" : 31.922698,
 "BYR" : 22910.468667000001,
 "BIF" : 2046.72306,
 "VEF" : 139917.50546300001,
 "AWG" : 2.0806450000000001,
 "KPW" : 1052.011726,
 "LTL" : 3.5636350000000001,
 "ZWL" : 376.801244,
 "TOP" : 2.7110379999999998,
 "SOS" : 666.27422899999999,
 "MGA" : 3822.308188,
 "SCR" : 15.692546999999999,
 "SYP" : 601.96085200000005,
 "TRY" : 5.6557339999999998,
 "NPR" : 128.030248,
 "RSD" : 118.01288,
 "BYN" : 2.291512,
 "UGX" : 4374.029665,
 "CHF" : 1.170426,
 "CLP" : 759.93791399999998,
 "YER" : 292.05003699999997,
 "XPF" : 119.361677,
 "LKR" : 186.38133500000001
 },
 "success" : true
 }
 */

protocol CurrencyServiceProtocol : class {
    func retriveConverter(_ completion: @escaping ([String:Double]?,APIError?) -> Void)
}

class ApiClient:CurrencyServiceProtocol {
    func retriveConverter(_ completion: @escaping ([String:Double]?,APIError?) -> Void) {
        Alamofire.request(endpoint).responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let responseInJson = JSON(responseData.result.value!)
                if let resData = responseInJson["rates"].dictionaryObject {
                    completion(resData as? [String : Double],nil)
                }
                else {
                    completion(nil,APIError.ServerError(message: "error in response data"))
                }
            }
            else {
                completion(nil,APIError.HTTPError(statusCode: 404))
            }
        }
    }
    
    static let shared = ApiClient()

    func retriveConverter() {
        Alamofire.request(endpoint).responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
            let swiftyJsonVar = JSON(responseData.result.value!)
                print("swifty \(swiftyJsonVar)")
            }
    }

        // Alamofire 3
//        Alamofire.request(.GET, endpoint).response { request, response, data, error in
//            print(request)
//            print(response)
//            print(data)
//            print(error)
//        }
        
//        Alamofire.request(<#T##url: URLConvertible##URLConvertible#>, method: <#T##HTTPMethod#>, parameters: Parameters?, encoding: <#T##ParameterEncoding#>, headers: <#T##HTTPHeaders?#>)
//        Alamofire.request(Endpoints.Posts.fetch.url).responseJSON { (responseData) -> Void in
//            if((responseData.result.value) != nil) {
//                let swiftyJsonVar = JSON(responseData.result.value!)
//                if let resData = swiftyJsonVar["contacts"].arrayObject {
//                    print(resData);
////                    self.networkRequestHandler?.onContactsRetrieved(responseArray: resData)
//                }
//                else {
////                    self.networkRequestHandler?.onError()
//                }
//            }
//            else {
////                self.networkRequestHandler?.onError()
//            }
//        }
        
    }
    
}
