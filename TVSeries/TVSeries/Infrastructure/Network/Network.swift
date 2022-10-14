//
//  Network.swift
//  TVSeries
//
//  Created by Douglas Garcia on 10/09/22.
//

import Foundation

protocol NetworkProtocol {
    func request<T>(with request: BaseRequest, responseType: T.Type) async throws -> T where T: Decodable
    func makeURLComponents(_ baseRequest: BaseRequest) throws -> URLComponents?
    func makeURLRequest(_ urlComponents: URLComponents?, httpMethod: String) throws -> URLRequest
    func makeSessionData(_ urlRequest: URLRequest) async throws -> Data?
}

protocol SessionProtocol {
    func data(for request: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse)
}

final class Network: NetworkProtocol {

    private let session: SessionProtocol
    private let jsonDecoder: JSONDecoder
    
    init(session: SessionProtocol = URLSession.shared, jsonDecoder: JSONDecoder = JSONDecoder()) {
        self.session = session
        self.jsonDecoder = jsonDecoder
    }
    
    func request<T>(with baseRequest: BaseRequest, responseType: T.Type) async throws -> T where T: Decodable {
        
        let urlComponents = try makeURLComponents(baseRequest)
        let request = try makeURLRequest(urlComponents, httpMethod: baseRequest.method.rawValue)
        let dataRequest = try await self.makeSessionData(request)
        
        guard let data = dataRequest else {
            throw BaseError.unexpectedResponse
        }
        
        let response = try jsonDecoder.decode(responseType, from: data)
        return response
    }
    
    func makeURLComponents(_ baseRequest: BaseRequest) throws -> URLComponents? {
        let urlString = baseRequest.baseURL + baseRequest.path
        let queryItems = baseRequest.queryItems?.compactMap { URLQueryItem(name: $0.key, value: $0.value) }
        
        var urlComponents = URLComponents(string: urlString)
        urlComponents?.queryItems = queryItems
        
        return urlComponents
    }
    
    func makeURLRequest(_ urlComponents: URLComponents?, httpMethod: String) throws -> URLRequest {
        
        guard let url = urlComponents?.url else {
            throw BaseError.invalidURL
        }
        
        let timeoutInterval = TimeInterval(30.0)
        let cachePolicy = URLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData
        
        var request = URLRequest(url: url, cachePolicy: cachePolicy, timeoutInterval: timeoutInterval)
        request.httpMethod = httpMethod
        
        return request
    }
    
    func makeSessionData(_ urlRequest: URLRequest) async throws -> Data? {
        let sessionRequest = try await session.data(for: urlRequest, delegate: nil)
        return sessionRequest.0
    }
}


extension URLSession: SessionProtocol { }
