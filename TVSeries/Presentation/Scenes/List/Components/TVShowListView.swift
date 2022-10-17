//
//  TVShowListView.swift
//  TVSeries
//
//  Created by Douglas Garcia on 10/09/22.
//

import SwiftUI

struct TVShowListView: View {
    @EnvironmentObject var viewModel: ShowsListViewModel
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 12) {
                ForEach(viewModel.shows, id: \.id) { show in
                    NavigationLink(destination: DetailView(viewModel: DetailViewModel(show: show))) {
                        VStack {
                            TVShowRowView(show: show)

                            if viewModel.isLoadingMore(with: show) {
                                LoadingView()
                                    .task {
                                        await viewModel.fetchMoreShows(of: show)
                                    }
                            }
                        }
                    }
                }
            }
        }
    }
}
