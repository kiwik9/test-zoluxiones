//
//  IMovieRepository.swift
//  test-zoluxiones
//
//  Created by Julio Perez on 10/05/22.
//

import Foundation
import RxSwift

protocol IMovieRepository {
    func fetchMovies(page: Int8) -> Single<[Movie]>
}
