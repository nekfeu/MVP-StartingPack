//
//  APIRequestManager.swift
//  MVP Starting pack
//
//  Created by Kevin Empociello on 11/07/2019.
//  Copyright © 2019 Kevin Empociello. All rights reserved.
//

import Foundation
import Alamofire
import CodableFirebase

public enum RequestTag {
    case signin
}

protocol APIRequestManagerDelegate: class {
    func onSuccess(data: Data, tag: RequestTag)
    func onFailure(data: Data, tag: RequestTag)
}

class APIRequestManager: NSObject {
    
    weak var delegate: APIRequestManagerDelegate?
    var headers: HTTPHeaders?
    let APIUrl = "https://ton.api:4242"
    
    override init() {
        super.init()
        
        if let token = UserDefaults.standard.value(forKey: "access-token") as? String {
            headers = ["Authorization": "JWT \(token)"]
        }
    }

    func signIn(email: String, password: String) {
        let parameters = ["email": email, "password": password]
        let request = Alamofire.request("\(APIUrl)/rest-auth/login/", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil)
        
        request.validate()
        request.responseJSON { response in
            switch response.result {
            case .success(let data):
                if let responseData = try? JSONSerialization.data(withJSONObject: data) {
                    self.delegate?.onSuccess(data: responseData, tag: .signin)
                }
                
            case .failure:
                if let responseData = response.data,
                    let json = String(data: responseData, encoding: String.Encoding.utf8),
                    let data = json.data(using: String.Encoding.utf8) {
                    self.delegate?.onFailure(data: data, tag: .signin)
                }
            }
        }
    }
}
