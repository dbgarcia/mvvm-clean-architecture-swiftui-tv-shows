//
//  BaseSearchRepository.swift
//  TVSeries
//
//  Created by Douglas Garcia on 10/09/22.
//

import Foundation

protocol BaseSearchRepository {
    func fetchSearchShows(of name: String) async throws -> [Showable]
}
