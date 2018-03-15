//
//  TopicModel.swift
//  Mathematical Analysis
//
//  Created by Андрей on 11.06.17.
//  Copyright © 2017 HSE. All rights reserved.
//

import Foundation

class TopicModel: NSObject {
    
    //properties
    
    var id: String?
    var name: String?
    var partId: String?
    
    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //construct with @name, @address, @latitude, and @longitude parameters
    
    init(name: String, id: String, partId: String) {
        
        self.name = name
        self.id = id
        self.partId = partId
        
    }
    
    
    //prints object's current state
    
    override var description: String {
        return "Name: \(name), Id: \(id), PartId: \(partId)"
        
    }
    
    
}
