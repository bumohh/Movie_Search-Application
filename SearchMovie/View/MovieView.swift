//
//  MovieView.swift
//  SearchMovie
//
//  Created by Bruno Gomez on 3/10/22.
//

import SwiftUI

struct MovieView: View {
    @ObservedObject var movies : Movies
    var body: some View {
        VStack(alignment: .center) {
            Image(uiImage: UIImage(systemName: "person") ?? UIImage())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            HStack {
                Text("Title:\n\(movies.getMovieTitle())")
                    .padding()
                Spacer()
                Text("Release Date:\n\(movies.getMovieReleaseDate())")
                    .padding()
            }
            HStack {
                Text("Adult:\n\(movies.getMovieAdult())")
                    .padding()
                Spacer()
                Text("ID:\n\(movies.getMovieId())")
                    .padding()
            }
            VStack {
                HStack {
                    Text("Revenue:\n\(movies.getMovieRevenue())")
                }
            }
        }
        .onDisappear {
            movies.removeMoveMovie()
        }
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        let movies = Movies(onMovie: nil)
        MovieView(movies: movies)
    }
}
