//
//  LoginViewController.swift
//  robook
//
//  Created by Roberto Franco on 03/01/21.
//

import UIKit

class LoginViewController: BaseViewController, LoginViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var emailField: UITextField! {
       didSet {
        //emailField.styleInput("Correo electrónico")
       }
    }
    @IBOutlet weak var passwordField: UITextField! {
       didSet {
        //passwordField.styleInput("Contraseña")
       }
    }
    @IBOutlet weak var loginButton: UIButton!;
    
    private let loginPresenter = LoginPresenter(loginService: LoginService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginPresenter.setViewDelegate(loginViewDelegate: self)
        self.assignbackground(true)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    @IBAction func doLogin(_ sender: UIButton) {
        self.loginButton.isEnabled = false
        self.loginPresenter.doLogin(
            email: self.emailField.text!,
            password: self.passwordField.text!
        )
    }
    
    func sendToHome(loginResponse: User?) {
        var message = ""
        var okButtonText = ""
        
        if loginResponse != nil {
            let user = User(id: loginResponse!.id, first_name: loginResponse!.first_name, last_name: loginResponse!.last_name, email: loginResponse!.email, token: loginResponse!.token, profile: loginResponse!.profile)
            UserDefaultsManager.saveUser(user)
            
            NavigationHelper.sendToHomeViewController()
        } else {
            message = "Tus credenciales son incorrectas"
            okButtonText = "Intentar de nuevo"
            self.showError(message, okText: okButtonText)
            self.loginButton.isEnabled = true
        }
    }
    
    func showError(_ error: String, okText: String?) {
        self.loginButton.isEnabled = true
        let alert = UIAlertController(title: error, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: okText ?? "Aceptar", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
}
