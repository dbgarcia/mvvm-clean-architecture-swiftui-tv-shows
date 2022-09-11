//
//  TVShowListView.swift
//  TVSeries
//
//  Created by Douglas Garcia on 10/09/22.
//

import SwiftUI

struct TVShowListView: View {
    var shows: [Showable]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 20) {
                    ForEach(shows, id: \.name) { show in
                        NavigationLink(destination: DetailView(viewModel: DetailViewModel(show: show))) {
                            TVShowRowView(show: show)
                        }
                    }
                }
            }
            .padding(.top)
            
            .navigationBarHidden(true)
        }
    }
}
