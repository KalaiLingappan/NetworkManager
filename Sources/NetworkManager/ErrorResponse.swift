//
//  ErrorResponse.swift
//  
//
//  Created by Kalaiprabha L on 03/01/24.
//

import Foundation

public enum ErrorResponse: Error {
    case noNetwork
    case invalidData
    case invalidURL
    case noResponse
    case unauthorized
    case unexpectedStatusCode
    case unknown

    var description: String {
        switch self {
        case .noNetwork:
            return "No internet connection"
        case .invalidData:
            return "Error while decoding the response"
        case .invalidURL:
            return "Invalid URL"
        case .unauthorized:
            return "Session expired"
        default:
            return "Unknown error"

        }
    }
}
