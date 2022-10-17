//
//  SessionProtocol.swift
//  TVSeries
//
//  Created by Douglas Garcia on 16/10/22.
//

import Foundation

protocol SessionProtocol {
    func data(for request: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse)
}

extension URLSession: SessionProtocol { }
