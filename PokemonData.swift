//
//  MyModel.swift
//  FetchAPI
//
//  Created by SI CHEN on 9/21/22.
//

import Foundation

struct Root: Decodable{
    let Search: [Movie]
    
    init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        Search = try container.decode([Movie].self)
    }
}

struct Movie: Decodable{
    let Title: String
    let Year: String
    let imdbID: String
    let Poster:String    
}

/*
 {"Search":[{"Title":"Fast & Furious 6","Year":"2013","imdbID":"tt1905041","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BMTM3NTg2NDQzOF5BMl5BanBnXkFtZTcwNjc2NzQzOQ@@._V1_SX300.jpg"}
*/


