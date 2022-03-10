//
//  MoviePage.swift
//  SearchMovie
//
//  Created by Bruno Gomez on 3/9/22.
//

import Foundation

struct MoviePage : Decodable {
    var page: Int?
    var results: [Movie]?
    var total_pages : Int?
    var total_results : Int?
}
