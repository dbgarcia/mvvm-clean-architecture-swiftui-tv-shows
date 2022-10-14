//
//  EmptyView.swift
//  TVSeries
//
//  Created by Douglas Garcia on 11/09/22.
//

import SwiftUI

struct EmptyView: View {
    var systemName: String
    var message: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            Image(systemName: systemName)
                .font(.system(size: 50))
                .foregroundColor(Color.yellow)
            Text(message)
                .fontWeight(.light)
                .font(.body)
                .tint(Color.gray.opacity(0.7))
        }
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView(systemName: "exclamationmark.triangle.fill", message: "Empty Episodes...")
    }
}
