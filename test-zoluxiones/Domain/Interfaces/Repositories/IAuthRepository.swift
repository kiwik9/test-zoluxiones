//
//  AuthRepository.swift
//  test-zoluxiones
//
//  Created by Julio Perez on 9/05/22.
//

import Foundation
import RxSwift

protocol IAuthRepository {
    func login(user: User) -> Single<Bool>
}
