//
//  ContentView.swift
//  MovieSearch
//
//  Created by Oncu Can on 14.08.2022.
//

import SwiftUI

struct MovieListView: View {
    
   @ObservedObject var filmViewModel: FilmListViewModel
    
    @State var willSearchMovie = ""
    
    init() {
        self.filmViewModel = FilmListViewModel()
        
    }
    
    var body: some View {
        NavigationView {
            VStack {
            TextField("Search for Movies", text: $willSearchMovie, onEditingChanged: { _ in }, onCommit: {
                self.filmViewModel.doMovieSearch(movieName: willSearchMovie)
            }).padding().textFieldStyle(RoundedBorderTextFieldStyle())
            
        List(filmViewModel.movies, id: \.imdbId) { film in
            HStack {
                SpecialImage(url: film.poster)
                    .frame(width: 80, height: 120)
                
                VStack (alignment: .leading) {
                    Text(film.title)
                        .font(.title3)
                        .foregroundColor(.blue)
                    Text(film.year)
                    .foregroundColor(.orange)
                }
            }
        }.navigationTitle("Movies")
                
            }
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MovieListView()
        }
    }
}
