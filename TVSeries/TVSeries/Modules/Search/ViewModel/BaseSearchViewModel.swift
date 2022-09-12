//
//  BaseSearchViewModel.swift
//  TVSeries
//
//  Created by Douglas Garcia on 12/09/22.
//

import Foundation

protocol BaseSearchViewModel {
    var isVisibleLoading: Bool { get }
    var isVisibleEmpty: Bool { get }
    var isVisibleList: Bool { get }
    
    func fetchSearch(with query: String) async
}
