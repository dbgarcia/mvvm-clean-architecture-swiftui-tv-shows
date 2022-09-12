//
//  ListSeriesViewModel.swift
//  TVSeries
//
//  Created by Douglas Garcia on 10/09/22.
//

import Foundation

final class ShowsListViewModel: ObservableObject, BaseShowsViewModel {    
    private var currentPage = 0
    private var repository: ShowsRepository
    
    @Published private(set) var viewState: ViewState = .loading
    @Published private(set) var shows: [Showable] = []

    init(repository: ShowsRepository = DIContainer.showsListRepository()) {
        self.repository = repository
    }
    
    @MainActor
    func fetchShows() async {
        do {
            viewState = .loading
            shows = try await repository.fetchShows(of: currentPage)
            viewState = .finish
        } catch {
            viewState = shows.isEmpty ? .empty : .finish
        }
    }
    
    @MainActor
    func fetchMoreShows() async {
        do {
            currentPage += 1
            let newShows = try await repository.fetchShows(of: currentPage)
            shows.append(contentsOf: newShows)
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
}
