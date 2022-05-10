//
//  MovieRepository.swift
//  test-zoluxiones
//
//  Created by Julio Perez on 10/05/22.
//

import Foundation
import RxSwift
import Moya

final class MovieRepository {
    init() { }
}

extension MovieRepository: IMovieRepository {
    func fetchMovies(page: Int8) -> Single<[Movie]> {
        return Single.create { single in
            let provider = MoyaProvider<MyApiService>()
            provider.request(.fetchMovies(page: page)) { result in
                switch result {
                case let .success(resp):
                    do {
                        let moviesModel = try resp.map(FetchMovieResponse.self)
                        let movies = MovieModelMapper().transformToMovie(moviesModel.results)
                        single(.success(movies))
                    }
                    catch {
                        single(.success([]))
                    }
                    break
                case let .failure(error):
                    single(.failure(error))
                    break
                   }
            }
            return Disposables.create { }
        }
    }
}
