//
//  LoginProtocols.swift
//  WorkshopTestes
//
//  Created by Michel Anderson Lutz Teixeira on 13/02/19.
//  Copyright © 2019 Michel Lutz. All rights reserved.
//

import Foundation

protocol LoginView: AnyObject {
    func setSceneTitle(_ text: String)
    func setLoginPlaceHolder(_ text: String)
    func setPasswordPlaceHolder(_ text: String)
    func setPrimaryActionTitle(_ text: String)
    func showError(message: String)
}

protocol LoginServiceInput: AnyObject {
    var output: LoginServiceOutput? { get set }
    
    func validaLogin(email: String, password: String)
}

protocol LoginServiceOutput: AnyObject {
    func validateLoginSuccess()
    func validateLoginFailed()
}

protocol LoginRoutering: AnyObject {
    func navigateToHome()
}
