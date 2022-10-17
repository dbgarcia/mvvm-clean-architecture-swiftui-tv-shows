//
//  SearchShows.swift
//  TVSeries
//
//  Created by Douglas Garcia on 17/10/22.
//

import Foundation

final class SearchShows: SearchShowsUseCaseProtocol {
    private let repository: SearchRepositoryProtocol
    
    init(repository: SearchRepositoryProtocol = SearchRepository()) {
        self.repository = repository
    }
    
    func execute(name: String) async throws -> [Showable] {
        return try await self.repository.getShows(name: name)
    }
}
