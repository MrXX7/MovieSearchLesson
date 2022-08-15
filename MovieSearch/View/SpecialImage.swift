//
//  SpecialImage.swift
//  MovieSearch
//
//  Created by Oncu Can on 15.08.2022.
//

import SwiftUI

struct SpecialImage: View {
    let url: String
    @ObservedObject var imageDownloaderClient = ImageDownloaderClient()
    init(url: String) {
        self.url = url
        self.imageDownloaderClient.downloadImages(url: self.url)
    }
    
    var body: some View {
        if let data =
            self.imageDownloaderClient.downloadedImage {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        } else {
            return Image("placeholder").resizable()
        }
    }
}

struct SpecialImage_Previews: PreviewProvider {
    static var previews: some View {
        SpecialImage(url: "https://m.media-amazon.com/images/M/MV5BNjM0NTc0NzItM2FlYS00YzEwLWE0YmUtNTA2ZWIzODc2OTgxXkEyXkFqcGdeQXVyNTgwNzIyNzg@._V1_SX300.jpg")
    }
}
