//
//  NetworkProtocol.swift
//  TVSeries
//
//  Created by Douglas Garcia on 16/10/22.
//

import Foundation

protocol NetworkProtocol {
    func request<T>(with request: RequestProtocol, responseType: T.Type) async throws -> T where T: Decodable
    func makeURLComponents(_ baseRequest: RequestProtocol) throws -> URLComponents?
    func makeURLRequest(_ urlComponents: URLComponents?, httpMethod: String) throws -> URLRequest
    func makeSessionData(_ urlRequest: URLRequest) async throws -> Data?
}
