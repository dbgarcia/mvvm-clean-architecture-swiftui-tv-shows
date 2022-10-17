//
//  DetailViewModelTests.swift
//  TVSeriesTests
//
//  Created by Douglas Garcia on 04/10/22.
//

import XCTest

@testable import TVSeries

final class DetailViewModelTests: XCTestCase {

    private let showResponse = ShowResponse.fixture(name: "Arrow")
    private let getAllEpisodesStub = GetAllEpisodesStub()
    private lazy var sut = DetailViewModel(show: showResponse, getEpisodes: getAllEpisodesStub)
    
    func test_givenStateInitial_shouldReturnLoadingVisible() async throws {
        
        XCTAssertTrue(sut.isVisibleLoading)
        XCTAssertEqual(sut.show.name, showResponse.name)
    }
    
    func test_fetchEpisodes_shouldReturnListShowsCorrectly() async throws {
        
        getAllEpisodesStub.episodesReturned = [EpisodeResponse.fixture(name: "Black List")]
        
        await sut.fetchEpisodes()
        
        XCTAssertTrue(sut.isVisibleList)
        XCTAssertFalse(sut.episodes.isEmpty)
    }
    
    func test_fetchEpisodes_shouldReturnListEmpty() async throws {
        
        getAllEpisodesStub.episodesReturned = [EpisodeResponse]()
        
        await sut.fetchEpisodes()
        
        XCTAssertTrue(sut.isVisibleEmpty)
        XCTAssertTrue(sut.episodes.isEmpty)
    }
}
