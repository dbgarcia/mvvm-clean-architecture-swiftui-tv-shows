//
//  EpisodesRepository.swift
//  TVSeries
//
//  Created by Douglas Garcia on 10/09/22.
//

import Foundation

final class EpisodesRepository: BaseEpisodesRepository {
    private let networking: NetworkManager
    
    init(networking: NetworkManager) {
        self.networking = networking
    }
    
    func fetchEpisodes(of idShow: Int) async throws -> [Episodeable] {
        let baseRequest = EpisodesRequest(idShow: idShow)
        let episodes = try await networking.request(with: baseRequest, responseType: [EpisodeResponse].self)
        return episodes
    }
}
