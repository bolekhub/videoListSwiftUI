//
//  ContentView.swift
//  VideClub
//
//  Created by Boris Chirino on 1/9/22.
//

import SwiftUI
import Combine
import ModelLibrary

struct ContentView: View {
    @StateObject private var contentViewModel: CatalogViewModel = CatalogViewModel()
    
    init() {
        //contentViewModel.fetchList()
    }
    
    var body: some View {
        VStack {
            Text(contentViewModel.stateText)
            NavigationView {
                List(contentViewModel.videos) { item in
                    NavigationLink {
                        VideoView(videoItem: item)
                    } label: {
                        GridCell(videoItem: item)
                    }
                }.navigationTitle("Videos")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            //.environment(\.colorScheme, .dark)
    }
}
