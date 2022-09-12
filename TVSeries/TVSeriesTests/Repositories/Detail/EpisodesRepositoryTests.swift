//
//  EpisodesRepositoryTests.swift
//  TVSeriesTests
//
//  Created by Douglas Garcia on 12/09/22.
//

import XCTest
@testable import TVSeries

class EpisodesRepositoryTests: XCTestCase {

    func testFecthEpisodes() async throws {
        
        let mockEpisodes = [EpisodeResponse(id: 0, name: "Episode 0", season: 1, number: 1, image: nil),
                            EpisodeResponse(id: 1, name: "Episode 1", season: 1, number: 2, image: nil),
                            EpisodeResponse(id: 2, name: "Episode 2", season: 2, number: 1, image: nil),
                            EpisodeResponse(id: 3, name: "Episode 3", season: 2, number: 2, image: nil)]
        
        let sut = MockEpisodesRepository(episodes: mockEpisodes)
        
        // when
        let episodes = try await sut.fetchEpisodes(of: 1)
        
        // then
        XCTAssertEqual(sut.hasCalledFetchEpisodes, true)
        XCTAssertEqual(sut.idShow, 1)
        XCTAssertEqual(episodes.count, mockEpisodes.count)
    }
}
