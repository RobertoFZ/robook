//
//  LoginPresenter.swift
//  robook
//
//  Created by Roberto Franco on 03/01/21.
//

import Foundation

protocol LoginViewDelegate: BaseViewDelegate {
    func sendToHome(loginResponse: User?)
}

class LoginPresenter {
    private let loginService:LoginService
    weak private var loginViewDelegate : LoginViewDelegate?
    
    init(loginService:LoginService){
        self.loginService = loginService
    }
    
    func setViewDelegate(loginViewDelegate:LoginViewDelegate?){
        self.loginViewDelegate = loginViewDelegate
    }
    
    func doLogin(email:(String), password:(String)){
        if Validation.isEmpty(email) || !Validation.validateEmail(email) {
            self.loginViewDelegate?.showError("Escribe un correo electrónico válido", okText: "Cerrar")
            return
        }
        
        if Validation.isEmpty(password) {
            self.loginViewDelegate?.showError("Escribe tu contraseña", okText: "Cerrar")
            return
        }
        loginViewDelegate?.showActivityIndicator()
        loginService.doLogin(email: email, password: password, callback: self.onLogin)
    }
    
    func onLogin(loginResponse: User?) -> Void {
        loginViewDelegate?.hideActivityIndicator()
        self.loginViewDelegate?.sendToHome(loginResponse: loginResponse)
    }
    
    func doSignup(
        firstName: String,
        lastName: String,
        email: String,
        password: String
    ){
        loginViewDelegate?.showActivityIndicator()
        loginService.doSignup(firstName: firstName, lastName: lastName, email: email, password: password, callback: self.onSignup)
    }
    
    func onSignup(loginResponse: User?) -> Void {
        loginViewDelegate?.hideActivityIndicator()
        self.loginViewDelegate?.sendToHome(loginResponse: loginResponse)
    }
}

