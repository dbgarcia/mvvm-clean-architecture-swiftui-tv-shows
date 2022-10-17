//
//  SearchViewModel.swift
//  TVSeries
//
//  Created by Douglas Garcia on 10/09/22.
//

import Foundation

protocol SearchViewModelProtocol {
    var isVisibleLoading: Bool { get }
    var isVisibleEmpty: Bool { get }
    var isVisibleList: Bool { get }
    
    func fetchSearch(with query: String) async
}

final class SearchViewModel: ObservableObject, SearchViewModelProtocol {
    private let searchShows: SearchShowsUseCaseProtocol
    
    init(searchShows: SearchShowsUseCaseProtocol = SearchShows()) {
        self.searchShows = searchShows
    }
    
    var isVisibleLoading: Bool {
        return viewState == .loading
    }
    
    var isVisibleEmpty: Bool {
        return viewState == .empty
    }
    
    var isVisibleList: Bool {
        return viewState == .finish
    }
    
    private var searchViewState: SearchViewState = .loading
    
    @Published private(set) var shows: [Showable] = []
    @Published private(set) var viewState: ViewState = .empty
    
    @MainActor
    func fetchSearch(with query: String) async {
        do {
            guard !query.isEmpty else { return }
            guard searchViewState == .loading else { return }
            viewState = .loading
            shows = try await searchShows.execute(name: query.lowercased())
            viewState = shows.isEmpty ? .empty : .finish
        } catch {
            viewState = .empty
        }
    }
}
