//
//  MockShowsRepository.swift
//  TVSeriesTests
//
//  Created by Douglas Garcia on 12/09/22.
//

@testable import TVSeries

class MockShowsRepository: ShowsRepositoryProtocol {
    
    private(set) var currentPage = 0
    private(set) var hasCalledFetchShows = false
    
    private(set) var shows: [Showable]
    
    init(shows: [Showable]) {
        self.shows = shows
    }
    
    func fetchShows(of page: Int) async throws -> [Showable] {
        hasCalledFetchShows = true
        currentPage += 1
        return shows
    }
}
