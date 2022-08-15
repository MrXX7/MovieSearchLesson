//
//  FilmDetailViewModel.swift
//  MovieSearch
//
//  Created by Oncu Can on 15.08.2022.
//

import Foundation
import SwiftUI

class FilmDetailViewModel: ObservableObject {
    @Published var filmDetaili: FilmDetailsViewModel?
    
    let downloaderClient = DownloaderClient()
    
    func takeFilmDetail(imdbId: String) {
        downloaderClient.downloadFilmDetail(imdbId: imdbId, completion: { (result) in
            switch result {
            case .failure(let wrong):
                print(wrong)
            case .success(let filmDetail):
                self.filmDetaili = FilmDetailsViewModel(detail: filmDetail)
            }
        })
    }
}

struct FilmDetailsViewModel {
    let detail: FilmDetail
    
    var title: String {
        detail.title
    }
    
    var poster: String {
        detail.poster
    }
    
    var year: String {
        detail.year
    }
    
    var imdbId: String {
        detail.imdbId
    }
    
    var director: String {
        detail.director
    }
    
    var writer: String {
        detail.writer
    }
    
    var awards: String {
        detail.awards
    }
    
    var plot: String {
        detail.plot
    }
    
}
