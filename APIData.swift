//
//  APIData.swift
//  FetchAPI
//

import UIKit

class APIData: ObservableObject{
    var title: String = ""
    var year: String = ""
    var imdbID: String = ""
    var poster: String = ""
    var movies = [Movie]()
    
    init(Title: String){

        fetchAPIData(completionHandler: { (Movie) in
            self.title = Movie.Title
            self.year = Movie.Year
            self.imdbID = Movie.imdbID
            self.poster = Movie.Poster
        })
    }
    
    func fetchNew (Title: String) -> Void{
            self.fetchAPIData(completionHandler: { (Movie) in
             self.title = Movie.Title
            self.year = Movie.Year
            self.imdbID = Movie.imdbID
            self.poster = Movie.Poster
        })

    }
    func fetchAPIData(completionHandler: @escaping (Movie) -> Void) {
        let url = URL(string: "https://www.omdbapi.com/?apikey=a324cc08&s=Fast&type=movie")!
        movies.removeAll()
        
        var task = URLSession.shared.dataTask(with: url){(data, response, error) in
            
            guard let data = data else{return}
                        
            do {
                let result = try JSONDecoder().decode(Movie.self, from: data)
                completionHandler(result)
            }
            catch {
                let error = error
                print(error)
            }
        }.resume()
    }
}
