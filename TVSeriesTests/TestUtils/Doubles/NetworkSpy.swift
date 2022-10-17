//
//  MockNetwork.swift
//  TVSeriesTests
//
//  Created by Douglas Garcia on 17/09/22.
//

import Foundation

@testable import TVSeries

final class NetworkSpy: NetworkProtocol {
    
    var dataPassed: Data?
    var responsePassed: Decodable?
    
    private(set) var requestCount: Int = 0
    private(set) var requestCalled = false
    private(set) var baseRequest: RequestProtocol?
    
    func request<T>(with request: RequestProtocol, responseType: T.Type) async throws -> T where T : Decodable {
        self.requestCount += 1
        self.requestCalled = true
        self.baseRequest = request
        
        return responsePassed as! T
    }
    
    func makeSessionData(_ urlRequest: URLRequest) async throws -> Data? {
        return dataPassed
    }
    
    func makeURLComponents(_ baseRequest: RequestProtocol) throws -> URLComponents? {
        return URLComponents()
    }
    
    func makeURLRequest(_ urlComponents: URLComponents?, httpMethod: String) throws -> URLRequest {
        return URLRequest(url: .init(fileURLWithPath: ""))
    }
}
