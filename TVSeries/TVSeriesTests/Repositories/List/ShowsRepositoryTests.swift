//
//  ShowsRepositoryTests.swift
//  TVSeriesTests
//
//  Created by Douglas Garcia on 12/09/22.
//

import XCTest
@testable import TVSeries

class ShowsRepositoryTests: XCTestCase {

    func testFecthShows() async throws {
        
        let mockShows = [ShowResponse(id: 0, name: "Example 1", genres: ["Action"], summary: nil, image: nil),
                         ShowResponse(id: 1, name: "Example 2", genres: ["Commedy", "Action"], summary: nil, image: nil),
                         ShowResponse(id: 2, name: "Example 3", genres: [], summary: nil, image: nil)]
        
        let sut = MockShowsRepository(shows: mockShows)
        
        
        // when
        let shows = try await sut.fetchShows(of: 0)
        
        // then
        XCTAssertFalse(sut.currentPage == 0)
        XCTAssertEqual(sut.hasCalledFetchShows, true)
        XCTAssertEqual(sut.currentPage, 1)
        XCTAssertEqual(shows.count, mockShows.count)
    }
}
