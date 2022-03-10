//
//  Constants.swift
//  SearchMovie
//
//  Created by Bruno Gomez on 3/9/22.
//

import Foundation

//core db url
public let main_url = "https://api.themoviedb.org/3/"

//api key used for access using account
public let api_key = "?api_key=f81be451f5147c1647611a12b2ed0626"

//search a movie using a query for name
public let search_url_movie_without_query = "\(main_url)search/movie\(api_key)&query="
