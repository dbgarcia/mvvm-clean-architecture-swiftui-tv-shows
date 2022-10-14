//
//  SearchBarView.swift
//  TVSeries
//
//  Created by Douglas Garcia on 12/09/22.
//

import SwiftUI

struct SearchBarView: View {
    var placeHolder: String
    var onChange: (String) -> Void
    
    @State private var text = ""
    @FocusState private var isFocused: Bool
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField(placeHolder, text: $text)
                    .focused($isFocused)
                    .onChange(of: text, perform: onChange)
                    .font(.system(size: 14))
                    .submitLabel(.return)
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .frame(height: 35)
            
            if !text.isEmpty {
                Button("Cancel") {
                    isFocused = false
                    text = ""
                }
            }
            
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(placeHolder: "Search") { newValue in
            debugPrint(newValue)
        }
    }
}
