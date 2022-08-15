//
//  FilmViewModel.swift
//  MovieSearch
//
//  Created by Oncu Can on 15.08.2022.
//

import Foundation
import SwiftUI

class FilmListViewModel: ObservableObject {
    
   @Published var movies = [FilmViewModel]()
    
    let downloaderClient = DownloaderClient()
    
    func doMovieSearch(movieName: String) {
        downloaderClient.downloadMovies(search: movieName) { (result) in
            switch result {
            case.failure(let wrong):
                print(wrong)
            case.success(let allMovie):
                if let allMovie = allMovie {
                    DispatchQueue.main.async {
                        self.movies = allMovie.map(FilmViewModel.init)
                    }
                }
            }
        }
    }
}

struct FilmViewModel {
    let film: Film
    
    var title: String {
        film.title
    }
    
    var poster: String {
        film.poster
    }
    var year: String {
        film.year
    }
    var imdbId: String {
        film.imdbId
    }
}
