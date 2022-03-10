//
//  MovieDB.swift
//  SearchMovie
//
//  Created by Bruno Gomez on 3/9/22.
//

import Foundation

class MovieDB {
    static let shared = MovieDB.init()
    private init() {}
    
    public func fetchMovie(with name : String, fetchComplete completion : @escaping (Data?, URLResponse?, Error?) -> Void) -> Bool {
        guard let movieNameQuery = URL(string: "\(search_url_movie_without_query)\(name)") else { return false}
        print("connecting")
        URLSession.shared.dataTask(with: movieNameQuery) {data, response, error in
            guard let response = response as? HTTPURLResponse else { return }
            if response.statusCode >= 200 && response.statusCode < 400 {
                completion(data, response, error)
            } else {
                completion(nil, nil, MovieDBError.StatusError)
            }
        }.resume()
        return false
    }
}
