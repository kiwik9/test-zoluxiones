//
//  FetchMoviesUseCase.swift
//  test-zoluxiones
//
//  Created by Julio Perez on 10/05/22.
//

import Foundation
import RxSwift

protocol FetchMoviesProtocol {
    func excute(query: Int8) -> Single<[Movie]>
}

class FetchMoviesUseCase:  FetchMoviesProtocol {
    
    private let movieRepository : MovieRepository
    
    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }
    
    func excute(query page: Int8) -> Single<[Movie]> {
        return movieRepository.fetchMovies(page: page)
    }
    
}
