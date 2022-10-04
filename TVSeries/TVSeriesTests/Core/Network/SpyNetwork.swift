//
//  MockNetwork.swift
//  TVSeriesTests
//
//  Created by Douglas Garcia on 17/09/22.
//

@testable import TVSeries
import Foundation

class SpyNetwork: NetworkProtocol {
    
    private var dataPassed: Data?
    private(set) var responsePassed: Decodable?
    
    private(set) var requestCalled = false
    private(set) var baseRequest: BaseRequest?
    
    func request<T>(with request: BaseRequest, responseType: T.Type) async throws -> T where T : Decodable {
        self.requestCalled = true
        self.baseRequest = request
        
        return responsePassed as! T
    }
    
    func makeURLRequest(_ baseRequest: BaseRequest) throws -> URLRequest {
        self.baseRequest = baseRequest
        
        return URLRequest(url: .init(string: baseRequest.baseURL)!)
    }
    
    func makeSessionData(_ urlRequest: URLRequest) async throws -> Data? {
        return dataPassed
    }
    
    func makeURLComponents(_ baseRequest: BaseRequest) throws -> URLComponents? {
        return URLComponents()
    }
    
    func makeURLRequest(_ urlComponents: URLComponents?, httpMethod: String) throws -> URLRequest {
        return URLRequest(url: .init(fileURLWithPath: ""))
    }
}
