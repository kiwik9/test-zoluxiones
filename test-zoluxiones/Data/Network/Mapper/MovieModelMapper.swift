//
//  MovieModelMapper.swift
//  test-zoluxiones
//
//  Created by Julio Perez on 10/05/22.
//

import Foundation

public class MovieModelMapper {
    
    func transformToMovie(_ list : [MovieModel]) -> [Movie] {
        var movies = [Movie]()
        for movieModel in list {
            
            let movie = Movie(id: movieModel.id,
                              title:movieModel.title,
                              description: movieModel.overview,
                              posterImage: movieModel.poster_path ?? "",
                              releadeDate: movieModel.release_date,
                              average: movieModel.vote_average)
            
            movies.append(movie)
        }
        return movies
    }
    
}
