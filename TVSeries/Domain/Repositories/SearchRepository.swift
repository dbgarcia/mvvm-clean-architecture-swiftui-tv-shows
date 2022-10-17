//
//  SearchRepository.swift
//  TVSeries
//
//  Created by Douglas Garcia on 10/09/22.
//

import Foundation

final class SearchRepository: SearchRepositoryProtocol {
    private let network: NetworkProtocol
    
    init(network: NetworkProtocol = DIContainer.network()) {
        self.network = network
    }
    
    func getShows(name: String) async throws -> [Showable] {
        let baseRequest = SearchRequest(name: name)
        let response = try await network.request(with: baseRequest, responseType: [SearchResponse].self)
        let shows = response.map { $0.show }
        return shows
    }
}
