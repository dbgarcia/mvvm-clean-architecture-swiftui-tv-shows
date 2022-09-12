//
//  SearchViewModel.swift
//  TVSeries
//
//  Created by Douglas Garcia on 10/09/22.
//

import Foundation

final class SearchViewModel: ObservableObject, BaseSearchViewModel {
    var isVisibleLoading: Bool {
        return viewState == .loading
    }
    
    var isVisibleEmpty: Bool {
        return viewState == .empty
    }
    
    var isVisibleList: Bool {
        return viewState == .finish
    }
    
    
    private let searchRespository: SearchRepository
    private var searchViewState: SearchViewState = .loading
    
    @Published private(set) var shows: [Showable] = []
    @Published private(set) var viewState: ViewState = .empty
    
    init(searchRespository: SearchRepository = DIContainer.searchRepository()) {
        self.searchRespository = searchRespository
    }
    
    @MainActor
    func fetchSearch(with query: String) async {
        do {
            guard !query.isEmpty else { return }
            guard searchViewState == .loading else { return }
            viewState = .loading
            shows = try await searchRespository.fetchSearchShows(with: query.lowercased())
            viewState = shows.isEmpty ? .empty : .finish
        } catch {
            viewState = .empty
        }
    }
}
