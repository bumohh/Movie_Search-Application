//
//  Movies.swift
//  SearchMovie
//
//  Created by Bruno Gomez on 3/9/22.
//

import Foundation
import UIKit

class Movies: ObservableObject {
    
    let session = MovieDB.shared
    @Published private var arr = [Movie]()
    @Published var selectedMovie : Movie? {
        willSet {
            if let nv = newValue {
                selected = nv
                lastSelectedMovie = nv
                willChangeMovie?(selected)
            }
        }
    }
    
    private var lastSelectedMovie : Movie?
    private var selected : Movie = Movie()
    let willChangeMovie : ((Movie) -> Void)?
    init( onMovie : ((Movie) -> Void)? ) {
        willChangeMovie = onMovie
        selectedMovie = Movie()
    }
    
    func getMovies() -> [Movie] {
        return arr
    }
    
    func getMovie() -> Movie? {
        guard let movie = lastSelectedMovie else { return nil }
        return movie
    }
    
    func setMovie(with movie : Movie?) {
        self.lastSelectedMovie = movie
    }
    
    func getMovieTitle() -> String {
        return getMovie()?.title ?? "No Title"
    }
    
    func getMovieReleaseDate() -> String {
        return getMovie()?.release_date ?? "Unknown Date"
    }
    
    func getMovieRevenue() -> String {
        return "$\(getMovie()?.revenue ?? 0)"
    }
    
    func getMovieAdult() -> String {
        return "\(getMovie()?.adult ?? false)"
    }
    
    func getMovieLanguage() -> String {
        return getMovie()?.original_language ?? "Unknown"
    }
    
    func getMovieId() -> String {
        return "\(getMovie()?.id ?? 0)"
    }
    func removeMoveMovie() {
        self.lastSelectedMovie = nil
    }
    
    func setMovies(movies : [Movie]) {
        print("setting \(movies.count) movies")
        DispatchQueue.main.async {
            self.arr = movies
        }
    }
    
    func addMovie(movie : [Movie]) {
        self.arr.append(contentsOf: movie)
    }
    
    func clearMovies() {
        self.arr.removeAll()
    }
    
    func fetchMovies(with names : String){
        let safeName = names.replacingOccurrences(of: " ", with: "+")
        let success = session.fetchMovie(with: safeName) {[weak self] data, _, error in
            guard let self = self else { return }
            guard error == nil else { return }
            guard let data = data else {
                self.clearMovies()
                print(MovieError.DataReturnedNil)
                return
            }
            
            do {
                let moviePages = try JSONDecoder().decode(MoviePage.self, from: data)
                guard let movies = moviePages.results else { print("Error Unwrapping movies"); return }
                guard movies.count > 0 else { print("No Movies Returned"); return}
                print("successfully returned movies from decode")
                self.setMovies(movies: movies)
            } catch let err {
                print(err)
                return
            }
        }
        if !success {
            print("No Data Returned")
            clearMovies()
        }
    }
}
