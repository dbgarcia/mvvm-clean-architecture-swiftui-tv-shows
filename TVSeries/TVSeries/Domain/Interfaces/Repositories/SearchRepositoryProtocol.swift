//
//  SearchRepositoryProtocol.swift
//  TVSeries
//
//  Created by Douglas Garcia on 14/10/22.
//

import Foundation

protocol SearchRepositoryProtocol {
    func fetchSearchShows(with name: String) async throws -> [Showable]
}
