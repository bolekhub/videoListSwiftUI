//
//  VideClubApp.swift
//  VideClub
//
//  Created by Boris Chirino on 1/9/22.
//

import SwiftUI
import ModelLibrary

@main
struct VideClubApp: App {
    @StateObject private var testVideoItem = VideoItemTest()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(testVideoItem)
        }
    }
}

//MARK: - Only for test purpose on views
class VideoItemTest: ObservableObject, VideoSourceItemRepresentable {
    var thumbnail: String
    var title: String
    var subtitle: String
    var description: String
    var sources: [String]
    
    init() {
        thumbnail = "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerFun.jpg"
        title = "For Bigger Fun"
        subtitle = "Comcast"
        description = "Introducing Chromecast. The easiest way to enjoy online video and music on your TV. For $35.  Find out more at google.com/chromecast."
        sources = ["http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4"]
    }
}
