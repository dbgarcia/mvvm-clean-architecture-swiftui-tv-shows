//
//  SearchView.swift
//  TVSeries
//
//  Created by Douglas Garcia on 10/09/22.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel: SearchViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBarView(placeHolder: "Search for TV Show name..") { query in
                    Task {
                        await viewModel.fetchSearch(with: query)
                    }
                }
                .padding()
                
                ZStack {
                    
                    EmptyView(systemName: "exclamationmark.triangle.fill", message: "No results TV Shows...")
                        .visiblity(viewModel.isVisibleEmpty)
                    
                    LoadingView()
                        .visiblity(viewModel.isVisibleLoading)
                    
                    SearchListView(shows: viewModel.shows)
                        .visiblity(viewModel.isVisibleList)
                }
            }
            
            .navigationBarHidden(true)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        let network = NetworkManager()
        let repository = SearchRepository(network: network)
        let viewModel = SearchViewModel(searchRespository: repository)
        SearchView(viewModel: viewModel)
    }
}
