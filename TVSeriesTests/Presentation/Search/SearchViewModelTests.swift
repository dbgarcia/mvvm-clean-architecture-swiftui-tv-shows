//
//  SearchViewModelTests.swift
//  TVSeriesTests
//
//  Created by Douglas Garcia on 04/10/22.
//

import XCTest

@testable import TVSeries

class SearchViewModelTests: XCTestCase {
    
    private let searchShowsStub = SearchShowsStub()
    private lazy var sut = SearchViewModel(searchShows: searchShowsStub)
    
    func test_givenStateInitial_shouldReturnLoadingVisible() async throws {
        
        _ = await sut.fetchSearch(with: "aaa")
        
        XCTAssertTrue(sut.shows.isEmpty)
    }
    
    func test_fetchSearch_shouldReturnListShowsCorrectly() async throws {
        
        searchShowsStub.showsReturned = [ShowResponse.fixture(name: "Black List")]
        
        await sut.fetchSearch(with: "Black List")
        
        XCTAssertTrue(sut.isVisibleList)
        XCTAssertFalse(sut.shows.isEmpty)
    }
    
    func test_fetchSearch_shouldReturnListEmpty() async throws {
        
        searchShowsStub.showsReturned = [ShowResponse]()
        
        await sut.fetchSearch(with: "")
        
        XCTAssertTrue(sut.isVisibleEmpty)
        XCTAssertTrue(sut.shows.isEmpty)
    }
}
