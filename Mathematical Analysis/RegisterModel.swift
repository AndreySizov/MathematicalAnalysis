//
//  RegisterModel.swift
//  Mathematical Analysis
//
//  Created by Андрей on 11.06.17.
//  Copyright © 2017 HSE. All rights reserved.
//

import Foundation

class RegisterModel: NSObject {
    
    //properties
    
    var login: String?
    var password: String?
    var id:String?
    
    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //construct with @name, @address, @latitude, and @longitude parameters
    
    init(login: String, password: String, id: String) {
        
        self.login = login
        self.password = password
        self.id = id
        
    }
    
    
    //prints object's current state
    
    override var description: String {
        return "Login: \(login), Password: \(password), Id: \(id)"
        
    }
    
    
}
