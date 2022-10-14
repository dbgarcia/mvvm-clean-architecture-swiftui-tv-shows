//
//  NetworkTests.swift
//  TVSeriesTests
//
//  Created by Douglas Garcia on 17/09/22.
//

import XCTest

@testable import TVSeries

final class NetworkTests: XCTestCase {
    
    private let sessionSpy = SessionSpy()
    private lazy var sut = Network(session: sessionSpy)
    
    func test_givenBaseRequest_shouldReturnURLComponentsValid() throws {
        
        let baseRequest = ShowsRequest(page: 0)
        
        let urlComponents = try sut.makeURLComponents(baseRequest)
        
        XCTAssertEqual(urlComponents?.url?.description, "https://api.tvmaze.com/shows?page=0")
    }
    
    func test_givenBaseRequest_shouldReturnURLRequestValid() throws {
        
        let urlRequest = try sut.makeURLRequest(.fixture(), httpMethod: "GET")
        
        XCTAssertEqual(urlRequest.url?.description, "https://api.tvmaze.com/shows?page=0")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }
    
    func test_givenBaseRequest_shouldReturnDecodeResponseTypeValid() async throws {
        
        sessionSpy.dataReturned = .fixture()
        sessionSpy.urlResponseReturned = URLResponse()
        
        let response = try await sut.makeSessionData(.fixture()!)
        
        XCTAssertEqual(response, .fixture())
    }
}
