//
//  ListTVSeriesRespository.swift
//  TVSeries
//
//  Created by Douglas Garcia on 10/09/22.
//

import Foundation

protocol ShowsRepositoryProtocol {
    func fetchShows(of page: Int) async throws -> [Showable]
}

final class ShowsRepository: ShowsRepositoryProtocol {
    private let network: NetworkProtocol
    
    init(network: NetworkProtocol = DIContainer.network()) {
        self.network = network
    }
    
    func fetchShows(of page: Int) async throws -> [Showable] {
        let baseRequest = ShowsRequest(page: page)
        let shows = try await network.request(with: baseRequest, responseType: [ShowResponse].self)
        return shows
    }
}
