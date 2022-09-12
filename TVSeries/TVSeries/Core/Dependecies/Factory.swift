//
//  Dependecies.swift
//  TVSeries
//
//  Created by Douglas Garcia on 10/09/22.
//

import Factory

class DIContainer {
    static let network = Factory(scope: .singleton) { NetworkManager() }
    static let showsListRepository = Factory(scope: .singleton) { ShowsRepository(network: network()) }
    static let episodesRepository = Factory(scope: .singleton) { EpisodesRepository(network: network()) }
    static let searchRepository = Factory(scope: .singleton) { SearchRepository(network: network()) }
}
