//
//  ShowsRepositoryTests.swift
//  TVSeriesTests
//
//  Created by Douglas Garcia on 12/09/22.
//

import XCTest
@testable import TVSeries

final class ShowsRepositoryTests: XCTestCase {
    
    private let networkSpy = NetworkSpy()
    private lazy var sut = ShowsRepository(network: networkSpy)
    
    func test_fetchShows_shouldBeCalled() async throws {
        
        networkSpy.responsePassed = [ShowResponse]()

        _ = try await sut.getShows(page: 0)
        
        XCTAssertTrue(networkSpy.requestCalled)
    }
    
    func test_fetchShows_shouldCalledOnceOnly() async throws {
        
        networkSpy.responsePassed = [ShowResponse]()

        _ = try await sut.getShows(page: 0)
        
        XCTAssertEqual(networkSpy.requestCount, 1)
    }

    func test_fetchShows_shouldReturnListCorrectly() async throws {
        
        let expectedResponse = [ShowResponse.fixture(id: 0, name: "Arrow")]
        networkSpy.responsePassed = expectedResponse

        let shows = try await sut.getShows(page: 0)
        
        XCTAssertEqual(shows.count, 1)
        XCTAssertEqual(shows.first?.name, expectedResponse.first?.name)
    }
    
    func test_fetchShows_shouldReturnListEmpty() async throws {
        
        let expectedResponse: [ShowResponse] = []
        networkSpy.responsePassed = expectedResponse

        let shows = try await sut.getShows(page: 0)
        
        XCTAssertTrue(shows.isEmpty)
    }
}
