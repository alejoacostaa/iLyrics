//
//  ErrorEnums.swift
//  iLyrics
//
//  Created by Alejo Acosta on 03/05/2021.
//

import Foundation

//Error enums in case the API call fails
enum APIError: Error {
    case sessionError
    case parsingError
    case missingDataError
    case requestError
    case timeoutError
    case offline
    case internalServerError
    case notFound
    case genericError
}

enum Status: Int {
    case multipleChoices = 300
    case badRequest = 400
    case forbidden = 403
    case notFound = 404
    case requestTimeout = 408
    case internalServerError = 500
    case notImplemented = 501
    case badGateway = 502
    case serviceUnavailabe = 503
    case gatewayTimeout = 504
}
