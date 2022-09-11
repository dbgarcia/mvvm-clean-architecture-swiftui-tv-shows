//
//  BaseNetwork.swift
//  TVSeries
//
//  Created by Douglas Garcia on 10/09/22.
//

import Foundation

protocol BaseNetwork {
    func request<T>(with request: BaseRequest, responseType: T.Type) async throws -> T where T: Decodable
}
