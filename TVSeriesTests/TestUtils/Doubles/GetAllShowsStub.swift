//
//  GetAllShowsStub.swift
//  TVSeriesTests
//
//  Created by Douglas Garcia on 17/10/22.
//

import Foundation

@testable import TVSeries

final class GetAllShowsStub: GetAllShowsUseCaseProtocol {
    
    var showsReturned: [Showable] = []
    
    func execute(page: Int) async throws -> [Showable] {
        return showsReturned
    }
}
