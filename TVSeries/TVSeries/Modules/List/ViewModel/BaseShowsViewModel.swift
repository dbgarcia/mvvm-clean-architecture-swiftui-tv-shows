//
//  BaseShowsViewModel.swift
//  TVSeries
//
//  Created by Douglas Garcia on 11/09/22.
//

import Foundation

protocol BaseShowsViewModel {
    func fetchShows() async
    func fetchMoreShows() async
}
