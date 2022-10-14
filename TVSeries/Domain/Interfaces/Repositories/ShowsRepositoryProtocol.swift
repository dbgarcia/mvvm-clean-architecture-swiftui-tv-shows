//
//  ShowsRepositoryProtocol.swift
//  TVSeries
//
//  Created by Douglas Garcia on 14/10/22.
//

import Foundation

protocol ShowsRepositoryProtocol {
    func fetchShows(of page: Int) async throws -> [Showable]
}
