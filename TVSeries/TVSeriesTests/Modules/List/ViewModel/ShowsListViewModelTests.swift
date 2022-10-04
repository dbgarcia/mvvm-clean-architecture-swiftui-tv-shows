//
//  ShowsListViewModelTests.swift
//  TVSeriesTests
//
//  Created by Douglas Garcia on 04/10/22.
//

import XCTest

@testable import TVSeries

final class ShowsListViewModelTests: XCTestCase {
    
    private lazy var repositorySpy = ShowsRepositorySpy()
    private lazy var sut = ShowsListViewModel(repository: repositorySpy)

    func test_givenStateInitial_shouldReturnLoadingVisible() async throws {
        
        XCTAssertTrue(sut.isVisibleLoading)
        XCTAssertTrue(sut.shows.isEmpty)
    }
    
    func test_triggerFetchShows_shouldReturnListShowsCorrectly() async throws {
        
        repositorySpy.shows = [ShowResponse.fixture(id: 1, name: "Arrow")]
        
        await sut.fetchShows()
        
        XCTAssertTrue(sut.isVisibleList)
        XCTAssertFalse(sut.shows.isEmpty)
    }
}
