//
//  BaseShowsViewModel.swift
//  TVSeries
//
//  Created by Douglas Garcia on 11/09/22.
//

import Foundation

protocol BaseShowsViewModel {
    var isVisibleLoading: Bool { get }
    var isVisibleEmpty: Bool { get }
    var isVisibleList: Bool { get }
    
    func fetchShows() async
    func fetchMoreShows(of show: Showable) async
}
