//
//  BaseListSeriesRepository.swift
//  TVSeries
//
//  Created by Douglas Garcia on 10/09/22.
//

import Foundation

protocol BaseShowsRepository {
    func fetchShows(of page: Int) async throws -> [Showable]
}
