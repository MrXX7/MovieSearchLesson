//
//  ImageDownloaderClient.swift
//  MovieSearch
//
//  Created by Oncu Can on 15.08.2022.
//

import Foundation

class ImageDownloaderClient: ObservableObject {
    
   @Published var downloadedImage: Data?
    
    func downloadImages(url: String) {
        
        guard let imageUrl = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self.downloadedImage = data
            }
        } .resume()
    }
}
