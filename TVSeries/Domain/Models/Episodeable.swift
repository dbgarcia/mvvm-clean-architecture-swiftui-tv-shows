//
//  Episodeable.swift
//  TVSeries
//
//  Created by Douglas Garcia on 10/09/22.
//

import Foundation

protocol Episodeable {
    var id: Int { get }
    var name: String { get}
    var season: Int { get }
    var number: Int { get }
    var image: ImageEntity? { get }
}

extension Episodeable {
    func toSeasonEpisodeTitle() -> String {
        let seasonTitle = toSeasonTitle()
        let episodeTitle = toEpisodeTitle()
        return "\(seasonTitle) | \(episodeTitle)"
    }
    
    func toSeasonTitle() -> String {
        if season > 9 {
            return "S\(self.season)"
        } else {
            return "S0\(self.season)"
        }
    }
    
    func toEpisodeTitle() -> String {
        if number > 9 {
            return "E\(self.number)"
        } else {
            return "E0\(self.number)"
        }
    }
}
