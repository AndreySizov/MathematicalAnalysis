//
//  PartModel.swift
//  Mathematical Analysis
//
//  Created by Андрей on 08.06.17.
//  Copyright © 2017 HSE. All rights reserved.
//

import Foundation

class PartModel: NSObject {
    
    //properties
    
    var id: String?
    var name: String?

    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //construct with @name, @address, @latitude, and @longitude parameters
    
    init(name: String, id: String) {
        
        self.name = name
        self.id = id
        
    }
    
    
    //prints object's current state
    
    override var description: String {
        return "Name: \(name), Id: \(id)"
        
    }
    
    
}
