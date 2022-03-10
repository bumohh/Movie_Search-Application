//
//  Movies.swift
//  SearchMovie
//
//  Created by Bruno Gomez on 3/9/22.
//

import Foundation

struct Movie : Codable, Identifiable, Hashable {
    var adult : Bool?
    var id : Int?
    var original_language : String?
    var revenue : Int?
    var title : String?
    var release_date : String?
}

//struct Genres : Codable {
//    var id : Int?
//    var name : String?
//}
