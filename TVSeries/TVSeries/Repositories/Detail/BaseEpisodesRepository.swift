//
//  BaseEpisodesRepository.swift
//  TVSeries
//
//  Created by Douglas Garcia on 10/09/22.
//

import Foundation

protocol BaseEpisodesRepository {
    func fetchEpisodes(of idShow: Int) async throws -> [Episodeable]
}
