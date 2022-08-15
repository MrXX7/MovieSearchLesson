//
//  DetailView.swift
//  MovieSearch
//
//  Created by Oncu Can on 15.08.2022.
//

import SwiftUI

struct DetailView: View {
    
    let imdbId: String
    @ObservedObject var filmDetailViewModel = FilmDetailViewModel()
    
    var body: some View {
        VStack {
            Text(filmDetailViewModel.filmDetaili?.plot ?? "")
        }.onAppear(perform: {
            self.filmDetailViewModel
                .takeFilmDetail(imdbId: imdbId)
        })
   }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(imdbId: "test")
    }
}
