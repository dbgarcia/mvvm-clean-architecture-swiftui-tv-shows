//
//  SessionSpy.swift
//  TVSeriesTests
//
//  Created by Douglas Garcia on 04/10/22.
//

import Foundation

@testable import TVSeries

final class SessionSpy: SessionProtocol {
    
    var dataReturned: Data?
    var urlResponseReturned: URLResponse?
    
    private(set) var requestCalled: Bool = false
    private(set) var requestCount: Int = 0
    
    func data(for request: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse) {
        requestCalled = true
        requestCount += 1
        
        guard let dataReturned = dataReturned else {
            throw NSError.init(domain: "", code: 999)
        }

        guard let urlResponseReturned = urlResponseReturned else {
            throw NSError.init(domain: "", code: 999)
        }
        
        return (dataReturned, urlResponseReturned)
    }
}
