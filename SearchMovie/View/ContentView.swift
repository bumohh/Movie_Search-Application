//
//  ContentView.swift
//  SearchMovie
//
//  Created by Bruno Gomez on 3/9/22.
//

import SwiftUI

struct ContentView: View {
    @State private var searchFieldText = ""
    @State private var showClearButton = false
    @ObservedObject var movies = Movies { id in
        //
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Text("Movies")
                    .font(.title)
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Search...", text: $searchFieldText)
                }.modifier(CustomTextField(roundedCorners: 6, startColor: .white, endColor: .white, textColor: .black)).padding()
                    .onChange(of: searchFieldText) { _ in
                        movies.fetchMovies(with: searchFieldText)
                    }
                
                
                List(movies.getMovies()) {mov in
                    NavigationLink(destination: MovieView(movies: movies), tag: mov, selection: $movies.selectedMovie) {
                        Text(mov.title ?? "No Title")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
