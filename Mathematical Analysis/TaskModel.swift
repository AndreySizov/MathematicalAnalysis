//
//  TaskModel.swift
//  Mathematical Analysis
//
//  Created by Андрей on 11.06.17.
//  Copyright © 2017 HSE. All rights reserved.
//

import Foundation

class TaskModel: NSObject {
    
    //properties
    
    var id: String?
    var descriptionOfTask: String?
    var pointId: String?
    
    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //construct with @name, @address, @latitude, and @longitude parameters
    
    init(descriptionOfTask: String, id: String, pointId: String) {
        
        self.descriptionOfTask = descriptionOfTask
        self.id = id
        self.pointId = pointId
        
    }
    
    
    //prints object's current state
    
    override var description: String {
        return "Description: \(descriptionOfTask), Id: \(id), PointId: \(pointId)"
        
    }
    
    
}
