//
//  EpisodesRepository.swift
//  TVSeries
//
//  Created by Douglas Garcia on 10/09/22.
//

import Foundation

final class EpisodesRepository: EpisodesRepositoryProtocol {
    private let network: NetworkProtocol
    
    init(network: NetworkProtocol = DIContainer.network()) {
        self.network = network
    }
    
    func fetchEpisodes(of idShow: Int) async throws -> [Episodeable] {
        let baseRequest = EpisodesRequest(idShow: idShow)
        let episodes = try await network.request(with: baseRequest, responseType: [EpisodeResponse].self)
        return episodes
    }
}
