//
//  FormulaModel.swift
//  Mathematical Analysis
//
//  Created by Андрей on 11.06.17.
//  Copyright © 2017 HSE. All rights reserved.
//

import Foundation

class FormulaModel: NSObject {
    
    //properties
    
    
    var name: String?
    var value: String?
    
    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //construct with @name, @address, @latitude, and @longitude parameters
    
    init(name: String, value: String) {
        
        self.name = name
        self.value = value
        
    }
    
    
    //prints object's current state
    
    override var description: String {
        return "Value: \(value), Name: \(name)"
        
    }
    
}
