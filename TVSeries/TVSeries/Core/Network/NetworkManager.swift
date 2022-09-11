//
//  NetworkManager.swift
//  TVSeries
//
//  Created by Douglas Garcia on 10/09/22.
//

import Foundation

final class NetworkManager: BaseNetwork {
    func request<T>(with baseRequest: BaseRequest, responseType: T.Type) async throws -> T where T: Decodable {
        
        let request = try makeURLRequest(baseRequest)
        let dataRequest = try await self.makeSessionData(request)
        
        guard let data = dataRequest else {
            throw BaseError.unexpectedResponse
        }
        
        debugPrint("🌎 URL: \(request.url.unsafelyUnwrapped.absoluteString)")
//        debugPrint(String(data: data, encoding: .utf8) as Any)
        
        let response = try JSONDecoder().decode(responseType, from: data)
        return response
    }
    
    private func makeURLRequest(_ baseRequest: BaseRequest) throws -> URLRequest {
        let urlString = baseRequest.baseURL + baseRequest.path
        let queryItems = baseRequest.queryItems?.compactMap { URLQueryItem(name: $0.key, value: $0.value) }
        
        var urlComponents = URLComponents(string: urlString)
        urlComponents?.queryItems = queryItems
        
        guard let url = urlComponents?.url else {
            throw BaseError.invalidURL
        }
        
        let timeoutInterval = TimeInterval(30.0)
        let cachePolicy = URLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData
        
        var request = URLRequest(url: url, cachePolicy: cachePolicy, timeoutInterval: timeoutInterval)
        request.httpMethod = baseRequest.method.rawValue
        request.allHTTPHeaderFields?.removeAll()
        
        return request
    }
    
    private func makeSessionData(_ urlRequest: URLRequest) async throws -> Data? {
        let sessionRequest = try await URLSession.shared.data(for: urlRequest)
        return sessionRequest.0
    }
}
