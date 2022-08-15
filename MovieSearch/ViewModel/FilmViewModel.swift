//
//  FilmViewModel.swift
//  MovieSearch
//
//  Created by Oncu Can on 15.08.2022.
//

import Foundation
import SwiftUI

class FilmListViewModel: ObservableObject {
    
   @Published var movies = [Film]()
    
    let downloaderClient = DownloaderClient()
    
    func doMovieSearch(movieName: String) {
        downloaderClient.downloadMovies(search: movieName) { (result) in
            switch result {
            case.failure(let wrong):
                print(wrong)
            case.success(let allMovie):
                if let allMovie = allMovie {
                    self.movies = allMovie
                }
            }
        }
    }
}
