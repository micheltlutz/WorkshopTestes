//
//  LoginViewController.swift
//  WorkshopTestes
//
//  Created by Michel Anderson Lutz Teixeira on 13/02/19.
//  Copyright © 2019 Michel Lutz. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    private let presenter: LoginPresenter
    init(presenter: LoginPresenter) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        
        setupTitleLayout()
        setupEmailFieldLayout()
        setupPasswordFieldLayout()
        setupPrimaryActionLayout()
        
        presenter.attachView(self)
    }
    
    private func setupTitleLayout() {}
    private func setupEmailFieldLayout() {}
    private func setupPasswordFieldLayout() {}
    private func setupPrimaryActionLayout() {}
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginViewController: LoginView {
    func setSceneTitle(_ text: String) {
        
    }
    
    func setLoginPlaceHolder(_ text: String) {
        
    }
    
    func setPasswordPlaceHolder(_ text: String) {
        
    }
    
    func setPrimaryActionTitle(_ text: String) {
        
    }
    
    func showError(message: String) {
        
    }
    
    
}

