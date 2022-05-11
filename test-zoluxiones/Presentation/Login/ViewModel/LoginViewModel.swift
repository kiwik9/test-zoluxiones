//
//  LoginViewModel.swift
//  test-zoluxiones
//
//  Created by Julio Perez on 9/05/22.
//

import Foundation

class LoginViewModel: NSObject {

    typealias LoginListener = (_ response : ResponseStatus, _ message : String) -> Void
    
    private var loginListener : LoginListener?
    private let loginUseCase = LoginUseCase(authRepository: AuthRepository())
        
    public func validateAuth(_ username: String, _ password: String) {
        let user = User(username: username, password: password)
        _ = loginUseCase.excute(query: user).subscribe { result in
            let message = (result  ? "Inicio de Sesion Exitoso." : "Usuario y/o contrasena incorrectos.")
            self.loginListener?( (result ? ResponseStatus.OK : ResponseStatus.ERROR) , message)
        } onFailure: { Error in
            self.loginListener?(ResponseStatus.ERROR, "Error.")
        }
    }
    
    public func onLoginListener(listener: @escaping LoginListener) {
        self.loginListener = listener
    }
}
