//
//  GetAllTvShows.swift
//  TVSeries
//
//  Created by Douglas Garcia on 16/10/22.
//

import Foundation

final class GetAllShows: GetAllShowsUseCaseProtocol {
    private let repository: ShowsRepositoryProtocol
    
    init(repository: ShowsRepositoryProtocol = ShowsRepository()) {
        self.repository = repository
    }
    
    func execute(page: Int) async throws -> [Showable] {
        return try await self.repository.getShows(page: page)
    }
}
