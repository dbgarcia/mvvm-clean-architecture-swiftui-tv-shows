//
//  ShowsRepositorySpy.swift
//  TVSeriesTests
//
//  Created by Douglas Garcia on 04/10/22.
//

import Foundation

@testable import TVSeries

final class ShowsRepositorySpy: ShowsRepositoryProtocol {
    
    var shows: [Showable] = []
    
    private(set) var pagePassed: Int = 0
    private(set) var currentPage: Int = 0
    private(set) var fetchShowCalled: Bool = false
    
    func fetchShows(of page: Int) async throws -> [Showable] {
        fetchShowCalled = true
        currentPage += 1
        pagePassed = page
        return shows
    }
}
