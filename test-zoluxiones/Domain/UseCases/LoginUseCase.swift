//
//  LoginUseCase.swift
//  test-zoluxiones
//
//  Created by Julio Perez on 9/05/22.
//

import Foundation
import RxSwift

protocol LoginUseCaseProtocol {
    func excute(query: User) -> Single<Bool>
}

class LoginUseCase:  LoginUseCaseProtocol {
    
    private let authRepository: AuthRepository
    
    init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }
    
    func excute(query user: User) -> Single<Bool> {
        return authRepository.login(user: user)
    }
    
}
