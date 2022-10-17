//
//  SearchShowsStub.swift
//  TVSeriesTests
//
//  Created by Douglas Garcia on 17/10/22.
//

import Foundation

@testable import TVSeries

final class SearchShowsStub: SearchShowsUseCaseProtocol {
    
    var showsReturned: [Showable] = []
    
    func execute(name: String) async throws -> [Showable] {
        return showsReturned
    }
}
