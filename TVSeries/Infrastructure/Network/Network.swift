//
//  Network.swift
//  TVSeries
//
//  Created by Douglas Garcia on 10/09/22.
//

import Foundation

final class Network: NetworkProtocol {

    private let session: SessionProtocol
    private let jsonDecoder: JSONDecoder
    
    init(session: SessionProtocol = URLSession.shared, jsonDecoder: JSONDecoder = JSONDecoder()) {
        self.session = session
        self.jsonDecoder = jsonDecoder
    }
    
    func request<T>(with baseRequest: RequestProtocol, responseType: T.Type) async throws -> T where T: Decodable {
        let urlComponents = try makeURLComponents(baseRequest)
        let request = try makeURLRequest(urlComponents, httpMethod: baseRequest.method.rawValue)
        let dataRequest = try await self.makeSessionData(request)
        
        guard let data = dataRequest else {
            throw NetworkError.unexpectedResponse
        }
        
        let response = try jsonDecoder.decode(responseType, from: data)
        return response
    }
    
    func makeURLComponents(_ baseRequest: RequestProtocol) throws -> URLComponents? {
        let urlString = baseRequest.baseURL + baseRequest.path
        let queryItems = baseRequest.queryItems?.compactMap { URLQueryItem(name: $0.key, value: $0.value) }
        
        var urlComponents = URLComponents(string: urlString)
        urlComponents?.queryItems = queryItems
        
        return urlComponents
    }
    
    func makeURLRequest(_ urlComponents: URLComponents?, httpMethod: String) throws -> URLRequest {
        guard let url = urlComponents?.url else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url, cachePolicy: .reloadRevalidatingCacheData, timeoutInterval: .init(30))
        request.httpMethod = httpMethod
        
        return request
    }
    
    func makeSessionData(_ urlRequest: URLRequest) async throws -> Data? {
        let sessionRequest = try await session.data(for: urlRequest, delegate: nil)
        return sessionRequest.0
    }
}
