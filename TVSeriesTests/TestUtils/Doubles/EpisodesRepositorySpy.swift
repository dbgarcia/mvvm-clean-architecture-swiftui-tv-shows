//
//  EpisodesRepositorySpy.swift
//  TVSeriesTests
//
//  Created by Douglas Garcia on 12/09/22.
//

import Foundation

@testable import TVSeries

final class EpisodesRepositorySpy: EpisodesRepositoryProtocol {
    
    var episodes: [Episodeable] = []
    
    private(set) var idShow: Int = 0
    private(set) var fetchEpisodesCalled: Bool = false
    private(set) var fetchEpisodesCount: Int = 0
    
    func fetchEpisodes(of idShow: Int) async throws -> [Episodeable] {
        fetchEpisodesCalled = true
        fetchEpisodesCount += 1
        self.idShow = idShow
        
        return episodes
    }
}
