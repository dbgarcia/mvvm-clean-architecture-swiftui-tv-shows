//
//  EpisodesRepositoryProtocol.swift
//  TVSeries
//
//  Created by Douglas Garcia on 14/10/22.
//

import Foundation

protocol EpisodesRepositoryProtocol {
    func fetchEpisodes(of idShow: Int) async throws -> [Episodeable]
}
