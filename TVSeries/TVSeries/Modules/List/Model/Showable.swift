//
//  Serieable.swift
//  TVSeries
//
//  Created by Douglas Garcia on 10/09/22.
//

import Foundation

protocol Showable {
    var id: Int { get }
    var name: String { get }
    var genres: [String] { get }
    var status: String { get }
    var image: ImageEntity? { get }
    var summary: String { get }
}

extension Showable {
    func toGenresFormated() -> String {
        return genres.joined(separator: " | ")
    }
    
    func toSummaryFormatted() -> String {
        return summary.makeCleanerHtml()
    }
}
