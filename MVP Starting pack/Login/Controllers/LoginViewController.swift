//
//  ViewController.swift
//  MVP Starting pack
//
//  Created by Kevin Empociello on 11/07/2019.
//  Copyright © 2019 Kevin Empociello. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    var presenter: LoginPresenter?
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPresenter()
    }

    func setupPresenter() {
        presenter = LoginPresenter(delegate: self)
    }

    
    @IBAction func signInButtonTapped(_ sender: Any) {
        presenter?.signIn(email: emailField.text, password: passwordField.text)
    }
}

extension LoginViewController: LoginDelegate {
    func signInSucceed() {
        // récupéré l'utilisateur si retourné par presenter, et passer a l'écran suivant
    }
    
    func signInFailed(error: String) {
        // afficher une erreur par exemple
    }
}
