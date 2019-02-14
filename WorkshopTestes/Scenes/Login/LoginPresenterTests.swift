import Quick
import Nimble

@testable import WorkshopTestes

class LoginPresenterTests: QuickSpec {
    override func spec() {
        var presenter: LoginPresenter!
        var view: LoginViewSpy!
        var service: LoginServiceInputSpy!
        var router: LoginRouteringSpy!
        
        describe("Login Presenter") {
            
            beforeEach {
                router = LoginRouteringSpy()
                service = LoginServiceInputSpy()
                view = LoginViewSpy()
                presenter = LoginPresenter(service: service, router: router)
                
//                viewController = Login
                presenter.attachView(view)
            }
            
            describe("Quando a view Carregar") {
                
                it("Deverá configurar o título da cena") {
                    expect(view.valorDoTituloPassado) == "CocoaHeads"
                    expect(view.setarTituloDaCenaFoiChamado) == true
                }
                
                it("então deverá configurar o placeholder do login") {
                    expect(view.valorDoPlaceholderLoginPassado) == "Insira seu Login"
                    expect(view.setarPlaceHolderLoginFoiChamado) == true
                }
                
                it("então deverá configurar o placeholder da senha") {
                    expect(view.valorDoPlaceholderSenhaPassado) == "Insira sua senha"
                    expect(view.setarPlaceHolderSenhaFoiChamado) == true
                }
                
                it("então deverá configurar o título ação primária") {
                    expect(view.valorTituloDoBotaoPassado) == "Entrar"
                    expect(view.setarTituloAcaoPrimarioFoiPassado) == true
                }
            }
            
//            describe("Quando o input de email alterar") {
//
//                it("")
//
//            }
//
//            describe("Quando o input de senha alterar") {
//
//                it("")
//
//            }
            
            describe("Quando a ação primaria for acionada") {
                
                context("e os dados imputados foram validos") {
                    
                    beforeEach {
                        presenter.emailInputDidChange("michel_lutz@icloud.com")
                        presenter.passwordInputDidChange("123456")
                        presenter.primaryActionTriggered()
                    }
                    
                    it("Então deverá delegar a validação do login") {
                        expect(service.valorDeEmailPassado) == "michel_lutz@icloud.com"
                        expect(service.valorDePasswordPassado) == "123456"
                        expect(service.validarLoginChamado) == true
                    }
                    
                }
                
                context("e os dados imputados não foram validos") {
                    
                    beforeEach {
                        presenter.emailInputDidChange("")
                        presenter.passwordInputDidChange("")
                        presenter.primaryActionTriggered()
                    }
                    
                    it("Então deverá exibir um alerta de erro ao usuário") {
                        expect(view.showErrorMessagePassed) == "Dados Inválidos"
                        expect(view.showErrorCalled) == true
                    }
                }
            }
            
            describe("Quando a validação retornar sucesso") {
                beforeEach {
                    presenter.validateLoginSuccess()
                }
                it("então deverá delegar a navegação para `Home`") {
                    expect(router.navigateToHomeCalled) == true
                }

            }

            describe("Quando a validação retornar errp") {
                beforeEach {
                    presenter.validateLoginFailed()
                }
                it("então deverá exibir alerta para usuário") {
                    expect(view.showErrorCalled) == true
                    expect(view.showErrorMessagePassed) == "Erro no login"
                }
            }
        }
    }
}

private class LoginViewSpy: LoginView {
    
    var valorDoTituloPassado: String?
    var setarTituloDaCenaFoiChamado: Bool?
    
    var valorDoPlaceholderLoginPassado: String?
    var setarPlaceHolderLoginFoiChamado: Bool?
    
    var valorDoPlaceholderSenhaPassado: String?
    var setarPlaceHolderSenhaFoiChamado: Bool?
    
    var valorTituloDoBotaoPassado: String?
    var setarTituloAcaoPrimarioFoiPassado: Bool?
    
    var showErrorMessagePassed: String?
    var showErrorCalled: Bool?
    
    func setSceneTitle(_ text: String) {
        valorDoTituloPassado = text
        setarTituloDaCenaFoiChamado = true
    }
    
    func setLoginPlaceHolder(_ text: String) {
        valorDoPlaceholderLoginPassado = text
        setarPlaceHolderLoginFoiChamado = true
    }
    
    func setPasswordPlaceHolder(_ text: String) {
        valorDoPlaceholderSenhaPassado = text
        setarPlaceHolderSenhaFoiChamado = true
    }
    
    func setPrimaryActionTitle(_ text: String) {
        valorTituloDoBotaoPassado = text
        setarTituloAcaoPrimarioFoiPassado = true
    }
    
    func showError(message: String) {
        showErrorMessagePassed = message
        showErrorCalled = true
    }
}

private class LoginServiceInputSpy: LoginServiceInput {
    var output: LoginServiceOutput?
    
    var valorDeEmailPassado: String?
    var valorDePasswordPassado: String?
    var validarLoginChamado: Bool?
    
    func validaLogin(email: String, password: String) {
        valorDeEmailPassado = email
        valorDePasswordPassado = password
        validarLoginChamado = true
    }
}


private class LoginRouteringSpy: LoginRoutering {
    var navigateToHomeCalled: Bool?
    func navigateToHome() {
        navigateToHomeCalled = true
    }
    
    
}

/**
 
 describe - descreve o método (indica quando a view é carregada
 
 
 
 */
