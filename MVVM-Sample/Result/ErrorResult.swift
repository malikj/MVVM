//
//  ErrorResult.swift
//  MVVM-Sample
//
//  Created by malikj on 14/07/18.
//  Copyright © 2018 malikj. All rights reserved.
//

import Foundation

enum ErrorResult: Error {
    case network(string: String)
    case parser(string: String)
    case custom(string: String)
}

enum APIError {
    case NoInternet
    case HTTPError(statusCode: Int)
    case ServerError(message: String)
    case Custom(string: String)

}
