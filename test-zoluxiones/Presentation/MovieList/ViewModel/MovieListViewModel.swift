//
//  MovieListViewModel.swift
//  test-zoluxiones
//
//  Created by Julio Perez on 10/05/22.
//

import Foundation


class MovieListViewModel: NSObject {

    typealias FetchMovieListener = (_ status : ResponseStatus?, _ message : String) -> Void
    private var fetchMovieListener : FetchMovieListener?
        
    private let fetchMoviesUseCase = FetchMoviesUseCase(movieRepository: MovieRepository())

    
    public func fetchMovies(){
        _ = fetchMoviesUseCase.excute(query: 1).subscribe { _ in
            self.fetchMovieListener?(ResponseStatus.OK, "Exito.")
        } onFailure: { Error in
            self.fetchMovieListener?(ResponseStatus.ERROR, "Error al consultar las peliculas.")
        }
    }
    
    public func onFetchMoviesListener(listener: @escaping FetchMovieListener) {
        self.fetchMovieListener = listener
    }
}
