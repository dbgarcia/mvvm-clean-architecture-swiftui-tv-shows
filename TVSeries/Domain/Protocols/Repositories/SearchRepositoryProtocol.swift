//
//  SearchRepositoryProtocol.swift
//  TVSeries
//
//  Created by Douglas Garcia on 14/10/22.
//

import Foundation

protocol SearchRepositoryProtocol {
    func getShows(name: String) async throws -> [Showable]
}
