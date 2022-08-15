//
//  DownloaderClient.swift
//  MovieSearch
//
//  Created by Oncu Can on 14.08.2022.
//

import Foundation

class DownloaderClient {
    
    func downloadMovies(search: String, completion: @escaping (Result<[Film]?, DownloaderError>) -> Void) {
        guard let url = URL(string: "https://www.omdbapi.com/?s=\(search)&apikey=d1e130e3") else {
            return completion(.failure(.wrongUrl))
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return completion(.failure(.dataDidntCome))
        }
            guard let movieAnswer = try? JSONDecoder().decode(IncomingFilms.self, from: data) else {
                return completion(.failure(.dataCouldNot))
            }
            completion(.success(movieAnswer.films))
        }.resume()
    }
    func downloadFilmDetail(imdbId: String, completion: @escaping (Result<FilmDetail,DownloaderError>) -> Void) {
        guard let url = URL(string: "https://www.omdbapi.com/?i=\(imdbId)&apikey=d1e130e3") else {
            return completion(.failure(.wrongUrl))
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return completion(.failure(.dataDidntCome))
            }
            guard let incomingFilmDetail = try? JSONDecoder().decode(FilmDetail.self, from: data) else {
                return completion(.failure(.dataCouldNot))
            }
            completion(.success(incomingFilmDetail))
        }.resume()
    }
}

enum DownloaderError: Error {
    case wrongUrl
    case dataDidntCome
    case dataCouldNot
}
