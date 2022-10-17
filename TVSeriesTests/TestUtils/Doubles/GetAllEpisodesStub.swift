//
//  GetAllEpisodesDumny.swift
//  TVSeriesTests
//
//  Created by Douglas Garcia on 17/10/22.
//

import Foundation

@testable import TVSeries

final class GetAllEpisodesStub: GetAllEpisodesUseCaseProtocol {
    
    var episodesReturned: [Episodeable] = []
    
    func execute(id: Int) async throws -> [Episodeable] {
        return episodesReturned
    }
}
