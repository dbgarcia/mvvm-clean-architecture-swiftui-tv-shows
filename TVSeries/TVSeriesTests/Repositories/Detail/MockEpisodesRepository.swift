//
//  MockEpisodesRepository.swift
//  TVSeriesTests
//
//  Created by Douglas Garcia on 12/09/22.
//

@testable import TVSeries

class MockEpisodesRepository: EpisodesRepositoryProtocol {
    
    private(set) var idShow = 0
    private(set) var hasCalledFetchEpisodes = false
    
    private(set) var episodes: [Episodeable]
    
    init(episodes: [Episodeable]) {
        self.episodes = episodes
    }
    
    func fetchEpisodes(of idShow: Int) async throws -> [Episodeable] {
        hasCalledFetchEpisodes = true
        self.idShow = idShow
        return episodes
    }
}
