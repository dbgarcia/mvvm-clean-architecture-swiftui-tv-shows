//
//  SearchRepository.swift
//  TVSeries
//
//  Created by Douglas Garcia on 10/09/22.
//

import Foundation

protocol SearchRepositoryProtocol {
    func fetchSearchShows(with name: String) async throws -> [Showable]
}

final class SearchRepository: SearchRepositoryProtocol {
    private let network: Network
    
    init(network: Network = DIContainer.network()) {
        self.network = network
    }
    
    func fetchSearchShows(with name: String) async throws -> [Showable] {
        let baseRequest = SearchRequest(name: name)
        let response = try await network.request(with: baseRequest, responseType: [SearchResponse].self)
        let shows = response.map { $0.show }
        return shows
    }
}
