//
//  FetchMoviesResponse.swift
//  test-zoluxiones
//
//  Created by Julio Perez on 10/05/22.
//

import Foundation

struct FetchMovieResponse: Codable {
    let page: Int
    let results: [MovieModel]
}
