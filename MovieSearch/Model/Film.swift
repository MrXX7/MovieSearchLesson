//
//  Film.swift
//  MovieSearch
//
//  Created by Oncu Can on 14.08.2022.
//

import Foundation

struct Film: Codable {
    let title: String
    let year: String
    let imdbId: String
    let type: String
    let poster: String
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
}

struct IncomingFilms: Codable {
    let films: [Film]
    
    private enum CodingKeys: String, CodingKey {
        case films = "Search"
    }
}
