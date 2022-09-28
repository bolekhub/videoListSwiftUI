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
      //VStack {
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
      
      //}
  }
}

struct GridCell_Previews: PreviewProvider {
    static let videoSource = VideoItemTest()
    
    static var previews: some View {
        GridCell(videoItem: videoSource)
            .previewLayout(.fixed(width: 300, height: 150))
            .environment(\.colorScheme, .dark)
        ContentView()
    }
}
