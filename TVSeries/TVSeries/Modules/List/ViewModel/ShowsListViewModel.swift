//
//  ListSeriesViewModel.swift
//  TVSeries
//
//  Created by Douglas Garcia on 10/09/22.
//

import Foundation

final class ShowsListViewModel: ObservableObject {
    private var page = 0
    private var repository: ShowsRepository
    
    @Published private(set) var viewState: ViewState = .loading
    @Published private(set) var shows: [Showable] = []
    
    init(repository: ShowsRepository = DIContainer.showsListRepository()) {
        self.repository = repository
    }
    
    @MainActor
    func fetchAll() async {
        do {
            viewState = .loading
            shows = try await repository.fetchShows(of: page)
            viewState = .finish
        } catch {
            debugPrint(error.localizedDescription)
        }
        
        viewState = shows.isEmpty ? .empty : .finish
    }
}

extension ShowsListViewModel {
    enum ViewState {
        case empty
        case loading
        case finish
    }
}
