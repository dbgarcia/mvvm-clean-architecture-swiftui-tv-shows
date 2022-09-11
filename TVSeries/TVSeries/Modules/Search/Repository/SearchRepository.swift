//
//  SearchRepository.swift
//  TVSeries
//
//  Created by Douglas Garcia on 10/09/22.
//

import Foundation

final class SearchRepository: BaseSearchRepository {
    private let networking: NetworkManager
    
    init(networking: NetworkManager) {
        self.networking = networking
    }
    
    func fetchSearchShows(of name: String) async throws -> [Showable] {
        let baseRequest = SearchRequest(name: name)
        let response = try await networking.request(with: baseRequest, responseType: [SearchResponse].self)
        let shows = response.map { $0.show }
        return shows
    }
}
