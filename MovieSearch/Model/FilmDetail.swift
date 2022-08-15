//
//  FilmDetail.swift
//  MovieSearch
//
//  Created by Oncu Can on 15.08.2022.
//

import Foundation

struct FilmDetail: Codable {
    let title: String
    let year: String
    let genre: String
    let director: String
    let writer: String
    let actors: String
    let plot: String
    let awards: String
    let poster: String
    let metascore: String
    let imdbRating: String
    let imdbId: String
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case awards = "Awards"
        case poster = "Poster"
        case metascore = "Metascore"
        case imdbRating = "imdbRating"
        case imdbId = "imdbID"
    }
}