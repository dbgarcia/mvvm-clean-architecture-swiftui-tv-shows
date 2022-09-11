//
//  BaseRequest.swift
//  TVSeries
//
//  Created by Douglas Garcia on 10/09/22.
//

import Foundation

protocol BaseRequest {
    var baseURL: String { get }
    var path: String { get }
    var method: BaseMethod { get }
    var queryItems: [String: String]? { get }
}

extension BaseRequest {
    // Opcional -> Algumas APIs tem e outras não
    var queryItems: [String: String]? { return nil }
}
