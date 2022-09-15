//
//  GridCell.swift
//  VideClub
//
//  Created by Boris Chirino on 7/9/22.
//
import SwiftUI
import ModelLibrary

struct GridCell: View, ShapeStyle {
  var videoItem: VideoSourceItemRepresentable
    
  var body: some View {

    HStack(alignment: .center) {
        AsyncImage(url: URL(string: videoItem.thumbnail) ) { image in
           image.resizable()
                .frame(width: 120, height: 130, alignment: .center)
                .clipShape(Rectangle())
                .cornerRadius(6.0)
                .shadow(radius: 4.0)
        } placeholder: {
            ProgressView()
                .padding()
        }
        VStack (alignment: .leading, spacing: 2) {
            Text(videoItem.title)
                .font(.headline)
                .foregroundColor(.black)
            Text(videoItem.description)
                .font(.caption)
                .foregroundColor(.black)
                .padding(2.0)
                .truncationMode(.tail)
                .frame(height: 100, alignment: .leading)
        }
   
    }.frame(width: 300, height: 150, alignment: .leading)
  }
}

struct GridCell_Previews: PreviewProvider {
    static let videoSource = VideoItemTest(
        thumbnail: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerFun.jpg",
        title: "For Bigger Fun",
        subtitle: "Comcast",
        description: "Introducing Chromecast. The easiest way to enjoy online video and music on your TV. For $35.  Find out more at google.com/chromecast.",
        sources: ["http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4"])
    
    static var previews: some View {
        GridCell(videoItem: videoSource).previewLayout(PreviewLayout.sizeThatFits)
            .environment(\.colorScheme, .dark)
        ContentView()
    }
}


struct VideoItemTest: VideoSourceItemRepresentable {
    var thumbnail: String
    var title: String
    var subtitle: String
    var description: String
    var sources: [String]
}
