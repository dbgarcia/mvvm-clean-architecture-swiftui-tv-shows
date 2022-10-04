//
//  ShowResponse+Fixture.swift
//  TVSeriesTests
//
//  Created by Douglas Garcia on 04/10/22.
//

import Foundation

@testable import TVSeries

extension ShowResponse {
    
    func fixture(id: Int = 0, name: String = "", genres: [String] = [], summary: String?, image: ImageEntity?) -> ShowResponse {
        return ShowResponse(id: id, name: name, genres: genres, summary: summary, image: image)
    }
}
