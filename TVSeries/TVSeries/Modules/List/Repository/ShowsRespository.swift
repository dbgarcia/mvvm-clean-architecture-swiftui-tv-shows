//
//  ListTVSeriesRespository.swift
//  TVSeries
//
//  Created by Douglas Garcia on 10/09/22.
//

import Foundation

final class ShowsRepository: BaseShowsRepository {
    private let networking: NetworkManager
    
    init(networking: NetworkManager) {
        self.networking = networking
    }
    
    func fetchShows(of page: Int) async throws -> [Showable] {
        let baseRequest = ShowsRequest(page: page)
        let shows = try await networking.request(with: baseRequest, responseType: [ShowResponse].self)
        return shows
    }
}
