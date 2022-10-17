//
//  GetAllEpisodes.swift
//  TVSeries
//
//  Created by Douglas Garcia on 16/10/22.
//

import Foundation

final class GetAllEpisodes: GetAllEpisodesUseCaseProtocol {
    private let repository: EpisodesRepositoryProtocol
    
    init(repository: EpisodesRepositoryProtocol = EpisodesRepository()) {
        self.repository = repository
    }
    
    func execute(id: Int) async throws -> [Episodeable] {
        return try await self.repository.getEpisodes(id: id)
    }
}
