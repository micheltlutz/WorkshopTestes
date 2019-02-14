//
//  LoginRouter.swift
//  WorkshopTestes
//
//  Created by Michel Anderson Lutz Teixeira on 13/02/19.
//  Copyright © 2019 Michel Lutz. All rights reserved.
//

import UIKit

class LoginRouter: LoginRoutering {
    weak var view: UIViewController?
    
    func makeViewController() -> UIViewController {
        let service = LoginService()
        let presenter = LoginPresenter(service: service, router: self)
        service.output = presenter
        let viewController = LoginViewController(presenter: presenter)
        self.view = viewController
        
        return viewController
    }
    
    func navigateToHome() {
        
    }
}
