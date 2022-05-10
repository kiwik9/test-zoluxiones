//
//  Api.swift
//  test-zoluxiones
//
//  Created by Julio Perez on 9/05/22.
//

import Moya
import Foundation

enum MyApiService {
    static private let apiKey = "507e2ac647e014f2a7e722713f2eeaa9"
    case fetchMovies(page: Int8)
}

extension MyApiService: TargetType {
  public var baseURL: URL {
    return URL(string: "https://api.themoviedb.org")!
  }

  public var path: String {
    switch self {
    case .fetchMovies(_): return "/3/movie/upcoming"
    }
  }

  public var method: Moya.Method {
    switch self {
    case .fetchMovies: return .get
    }
  }

  public var sampleData: Data {
    return Data()
  }

  public var task: Task {
    switch self {
    case .fetchMovies:
          return .requestParameters(parameters: ["page": 1, "api_key": MyApiService.apiKey], encoding: URLEncoding.default)
    }
  }

  public var headers: [String: String]? {
    return ["Content-Type": "application/json"]
  }

  public var validationType: ValidationType {
    return .successCodes
  }
}

