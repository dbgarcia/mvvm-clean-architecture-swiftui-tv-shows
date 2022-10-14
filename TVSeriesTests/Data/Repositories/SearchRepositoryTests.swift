//
//  SearchRepositoryTests.swift
//  TVSeriesTests
//
//  Created by Douglas Garcia on 04/10/22.
//

import XCTest

@testable import TVSeries

final class SearchRepositoryTests: XCTestCase {

    private let networkSpy = NetworkSpy()
    private lazy var sut = SearchRepository(network: networkSpy)
    
    func test_fetchSearchShows_shouldReturnEmptyList() async throws {
        
        networkSpy.responsePassed = [ShowResponse]()
        
        let shows = try await sut.fetchSearchShows(with: "Black List")
        
        XCTAssertTrue(shows.isEmpty)
    }
    
    func test_fetchSearchShows_shouldReturnListCorrectly() async throws {
        
        let expectedShows = [ShowResponse.fixture(name: "Seal Team")]
        networkSpy.responsePassed = expectedShows
        
        let shows = try await sut.fetchSearchShows(with: "")
        
        XCTAssertFalse(shows.isEmpty)
        XCTAssertEqual(shows.count, 1)
        XCTAssertEqual(shows.first?.name, expectedShows.first?.name)
    }
}
