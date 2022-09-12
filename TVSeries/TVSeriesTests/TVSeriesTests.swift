//
//  TVSeriesTests.swift
//  TVSeriesTests
//
//  Created by Douglas Garcia on 10/09/22.
//

import XCTest
@testable import TVSeries

class TVSeriesTests: XCTestCase {

    func testShowsRepositoryIntegration() async throws {
        
        let network = DIContainer.network()
        let repository = ShowsRepository(network: network)
        let viewModel = ShowsListViewModel(repository: repository)
        
        // when
        await viewModel.fetchShows()
        
        // then
        XCTAssertFalse(viewModel.isVisibleLoading)
        XCTAssertTrue(viewModel.shows.count > 0)
        XCTAssertTrue(viewModel.isVisibleList)
    }
    
    func testEpisodesRepositoryIntegration() async throws {
        
        let show = ShowResponse(id: 1, name: "Example 1", genres: [])
        let network = DIContainer.network()
        let episodesRepository = EpisodesRepository(network: network)
        let viewModel = DetailViewModel(show: show, episodesRepository: episodesRepository)
        
        // when
        await viewModel.fetchEpisodes()
        
        // then
        XCTAssertFalse(viewModel.isVisibleLoading)
        XCTAssertTrue(viewModel.episodes.count > 0)
        XCTAssertTrue(viewModel.isVisibleList)
    }
    
    func testSearchRepositoryIntegration() async throws {
        
        let network = DIContainer.network()
        let searchRepository = SearchRepository(network: network)
        let viewModel = SearchViewModel(searchRespository: searchRepository)
        
        // when
        await viewModel.fetchSearch(with: "arrow")
        
        // then
        XCTAssertFalse(viewModel.isVisibleLoading)
        XCTAssertTrue(viewModel.shows.count > 0)
        XCTAssertTrue(viewModel.isVisibleList)
    }
}
