//
//  ListTVSeriesRespository.swift
//  TVSeries
//
//  Created by Douglas Garcia on 10/09/22.
//

import Foundation

final class ShowsRepository: BaseShowsRepository {
    private let network: NetworkManager
    
    init(network: NetworkManager) {
        self.network = network
    }
    
    func fetchShows(of page: Int) async throws -> [Showable] {
        let baseRequest = ShowsRequest(page: page)
        let shows = try await network.request(with: baseRequest, responseType: [ShowResponse].self)
        return shows
    }
}
