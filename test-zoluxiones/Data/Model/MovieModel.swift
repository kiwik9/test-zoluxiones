//
//  MovieModel.swift
//  test-zoluxiones
//
//  Created by Julio Perez on 10/05/22.
//

import Foundation

struct MovieModel: Codable {
    var id: Int = 0
    var title: String = ""
    var original_title: String = ""
    var overview: String = ""
    var popularity: Double = 0.0
    var backdrop_path: String? = ""
    var poster_path: String? = ""
    var original_language: String = ""
    var adult: Bool = false
    var genre_ids: [Int] = [Int]()
    var release_date: String = ""
    var video: Bool = false
    var vote_count: Int = 0
    var vote_average: Double = 0.0
}
