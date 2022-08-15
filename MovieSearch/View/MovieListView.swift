//
//  ContentView.swift
//  MovieSearch
//
//  Created by Oncu Can on 14.08.2022.
//

import SwiftUI

struct MovieListView: View {
    
   @ObservedObject var filmViewModel: FilmListViewModel
    
    init() {
        self.filmViewModel = FilmListViewModel()
        self.filmViewModel.doMovieSearch(movieName: "scarface")
    }
    
    var body: some View {
        List(filmViewModel.movies, id: \.imdbId) { film in
            HStack {
                Image("placeholder")
                    .resizable()
                    .frame(width: 100, height: 150)
                VStack (alignment: .leading) {
                    Text(film.title)
                        .font(.title3)
                        .foregroundColor(.blue)
                    Text(film.year)
                        .foregroundColor(.orange)
                }
            }
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
