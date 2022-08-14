//
//  ContentView.swift
//  MovieSearch
//
//  Created by Oncu Can on 14.08.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button(action: {
            DownloaderClient().downloadMovies(search: "Pulp") {
                (result) in
                switch result {
                case .success(let allMovies):
                    print(allMovies)
                case .failure(let wrong):
                    print(wrong)
                }
            }
        }, label: {
            Text("Do it Test")
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
