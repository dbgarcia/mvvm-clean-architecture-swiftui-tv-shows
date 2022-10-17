//
//  SearchRepositorySpy.swift
//  TVSeriesTests
//
//  Created by Douglas Garcia on 04/10/22.
//

import Foundation

@testable import TVSeries

final class SearchRepositorySpy: SearchRepositoryProtocol {
    
    var dataReturned: [Showable] = []
    
    private(set) var namePassed: String?
    private(set) var fetchSearchShowsCount: Int = 0
    private(set) var fetchSearchShowsCalled: Bool = false
    
    func getShows(name: String) async throws -> [Showable] {
        fetchSearchShowsCount += 1
        fetchSearchShowsCalled = true
        namePassed = name
        
        return dataReturned
    }
}
