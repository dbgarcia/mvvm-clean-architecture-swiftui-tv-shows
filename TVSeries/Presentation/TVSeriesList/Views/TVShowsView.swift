//
//  TVShowsView.swift
//  TVSeries
//
//  Created by Douglas Garcia on 11/09/22.
//

import SwiftUI

struct TVShowsView: View {
    @StateObject var viewModel: ShowsListViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                
                LoadingView()
                    .visiblity(viewModel.isVisibleLoading)
                
                TVShowListView()
                    .environmentObject(viewModel)
                    .visiblity(viewModel.isVisibleList)

                EmptyView(systemName: "exclamationmark.triangle.fill", message: "Empty TV Shows...")
                    .visiblity(viewModel.isVisibleEmpty)
            }
            
            .task {
                await viewModel.fetchShows()
            }
            
            .navigationBarHidden(true)
        }
    }
}

struct TVShowsView_Previews: PreviewProvider {
    static var previews: some View {
        TVShowsView(viewModel: ShowsListViewModel())
    }
}
