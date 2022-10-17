//
//  EpisodesRepositoryTests.swift
//  TVSeriesTests
//
//  Created by Douglas Garcia on 12/09/22.
//

import XCTest

@testable import TVSeries

final class EpisodesRepositoryTests: XCTestCase {
    
    private let networkSpy = NetworkSpy()
    private lazy var sut = EpisodesRepository(network: networkSpy)

    func test_fetchEpisodes_shouldReturnListCorrectly() async throws {
        
        let expectedResponse = [EpisodeResponse.fixture(name: "Episode 1", season: 1, number: 1)]
        networkSpy.responsePassed = expectedResponse
        
        let episodes = try await sut.getEpisodes(id: 0)

        XCTAssertEqual(episodes.count, 1)
        XCTAssertEqual(episodes.first?.name, expectedResponse.first?.name)
    }
    
    func test_fetchEpisodes_shouldReturnListEmpty() async throws {
        
        networkSpy.responsePassed = [EpisodeResponse]()
        
        let episodes = try await sut.getEpisodes(id: 0)

        XCTAssertTrue(episodes.isEmpty)
    }
}
