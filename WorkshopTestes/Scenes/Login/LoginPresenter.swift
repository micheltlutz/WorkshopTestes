//
//  LoginPresenter.swift
//  WorkshopTestes
//
//  Created by Michel Anderson Lutz Teixeira on 13/02/19.
//  Copyright © 2019 Michel Lutz. All rights reserved.
//

import Foundation

class LoginPresenter {
    
    weak var service: LoginServiceInput?
    weak var view: LoginView?
    var router: LoginRoutering
    
    private var emailValue: String?
    private var passwordValue: String?
    init(service: LoginServiceInput, router: LoginRoutering) {
        self.service = service
        self.router = router
    }
    
    func attachView(_ view: LoginView) {
        self.view = view
        view.setSceneTitle("CocoaHeads")
        view.setLoginPlaceHolder("Insira seu Login")
        view.setPasswordPlaceHolder("Insira sua senha")
        view.setPrimaryActionTitle("Entrar")
    }
    
    func emailInputDidChange(_ text: String) {
        emailValue = text
    }
    
    func passwordInputDidChange(_ text: String) {
        passwordValue = text
    }
    
    func primaryActionTriggered() {
        
        guard let emailValue = emailValue,
            let passwordValue = passwordValue,
            !emailValue.isEmpty,
            !passwordValue.isEmpty else {
                
                view?.showError(message: "Dados Inválidos")
                
            return
        }
        
        service?.validaLogin(email: emailValue, password: passwordValue)
        
    }
    
}

extension LoginPresenter: LoginServiceOutput {
    func validateLoginSuccess() {
        router.navigateToHome()
    }
    
    func validateLoginFailed() {
        view?.showError(message: "Erro no login")
    }
}
