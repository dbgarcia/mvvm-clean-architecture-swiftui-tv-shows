//
//  BaseError.swift
//  TVSeries
//
//  Created by Douglas Garcia on 10/09/22.
//

import Foundation

enum BaseError: Swift.Error {
    case invalidURL
    case unexpectedResponse
}

extension BaseError: LocalizedError {
    var errorDescription: String? {
            switch self {
            case .invalidURL: return "Invalid Compose URL..."
            case .unexpectedResponse: return "Unexpected response from the server..."
        }
    }
}
