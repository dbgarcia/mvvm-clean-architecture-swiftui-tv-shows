//
//  EpisodeResponse+Fixture.swift
//  TVSeriesTests
//
//  Created by Douglas Garcia on 04/10/22.
//

import Foundation

@testable import TVSeries

extension EpisodeResponse {
    
    static func fixture(id: Int = 0, name: String = "", season: Int = 0, number: Int = 0, image: ImageEntity? = nil) -> Self {
        .init(id: id, name: name, season: season, number: number, image: image)
    }
}
