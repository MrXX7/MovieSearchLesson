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
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Spacer()
            SpecialImage(url: filmDetailViewModel.filmDetaili?.poster ?? "")
                .frame(width: UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.height * 0.3, alignment: .center)
                Spacer()
            }
            Text(filmDetailViewModel.filmDetaili?.title ?? "").font(.title).padding()
            
            Text(filmDetailViewModel.filmDetaili?.plot ?? "").padding()
            
            Text("Director: \(filmDetailViewModel.filmDetaili?.director ?? "")").padding()
            
            Text("Writer: \(filmDetailViewModel.filmDetaili?.writer ?? "")").padding()
            
            Text("Awards: \(filmDetailViewModel.filmDetaili?.awards ?? "")").padding()
            Text("Year: \(filmDetailViewModel.filmDetaili?.year ?? "")").padding()
            Spacer()
            
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
