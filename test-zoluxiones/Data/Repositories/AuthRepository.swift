//
//  AuthRepository.swift
//  test-zoluxiones
//
//  Created by Julio Perez on 9/05/22.
//

import Foundation
import RxSwift

final class AuthRepository {
    init() { }
}

extension AuthRepository: IAuthRepository {
    func login(user: User) -> Single<Bool> {
        return Single.create { single in
            if(user.username == "Admin" && user.password == "Password*123" ){
                single(.success(true))
            }else {
                single(.success(false))
            }
            return Disposables.create { }
        }
    }
}
