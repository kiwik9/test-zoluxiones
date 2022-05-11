//
//  MovieListViewModel.swift
//  test-zoluxiones
//
//  Created by Julio Perez on 10/05/22.
//

import Foundation


class MovieListViewModel: NSObject {

    typealias FetchMovieListener = (_ movies: [Movie]?, _ message : String) -> Void
    private var fetchMovieListener : FetchMovieListener?
        
    private let fetchMoviesUseCase = FetchMoviesUseCase(movieRepository: MovieRepository())

    
    public func fetchMovies(page: Int8){
        _ = fetchMoviesUseCase.excute(query: page).subscribe { result in
            self.fetchMovieListener?(result, "Exito.")
        } onFailure: { Error in
            self.fetchMovieListener?(nil, "Error al consultar las peliculas.")
        }
    }
    
    public func onFetchMoviesListener(listener: @escaping FetchMovieListener) {
        self.fetchMovieListener = listener
    }
}
