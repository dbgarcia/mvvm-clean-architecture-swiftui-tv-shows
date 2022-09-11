//
//  DetailMidleView.swift
//  TVSeries
//
//  Created by Douglas Garcia on 11/09/22.
//

import SwiftUI

struct DetailMiddleView: View {
    var show: Showable
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Summary:")
                .fontWeight(.semibold)
                .font(.subheadline)
                .padding(.top)
                .padding(.horizontal)
            
            Text(show.toSummaryFormatted())
                .fontWeight(.light)
                .font(.footnote)
                .multilineTextAlignment(.leading)
                .padding(.horizontal)
                .padding(.top, 4)
            
            Text("Episodes:")
                .fontWeight(.semibold)
                .font(.subheadline)
                .padding(.top)
                .padding(.horizontal)
        }
    }
}
