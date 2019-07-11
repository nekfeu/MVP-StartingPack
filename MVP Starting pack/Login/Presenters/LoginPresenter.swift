//
//  LoginPresenter.swift
//  MVP Starting pack
//
//  Created by Kevin Empociello on 11/07/2019.
//  Copyright © 2019 Kevin Empociello. All rights reserved.
//

import Foundation
import UIKit

protocol LoginDelegate: class {
    func signInSucceed()
    func signInFailed(error: String)
}

class LoginPresenter {
    
    weak var delegate: LoginDelegate?
    
    init(delegate: LoginDelegate) {
        self.delegate = delegate
    }
    
    func signIn(email: String?, password: String?) {
        guard let email = email, let password = password,
            email.count > 4, password.count > 8 else {
            return
        }
            
        let manager = APIRequestManager()
        
        manager.delegate = self
        manager.signIn(email: email, password: password)
    }
}

extension LoginPresenter: APIRequestManagerDelegate {
    func onSuccess(data: Data, tag: RequestTag) {
        // decoder l'utilisateur par exemple et le retourner au controller via le delegate
        delegate?.signInSucceed()
    }
    
    func onFailure(data: Data, tag: RequestTag) {
        delegate?.signInFailed(error: "Impossible de se connecter")
    }
}
