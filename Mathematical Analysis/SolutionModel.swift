//
//  SolutionModel.swift
//  Mathematical Analysis
//
//  Created by Андрей on 11.06.17.
//  Copyright © 2017 HSE. All rights reserved.
//

import Foundation

class SolutionModel: NSObject {
    
    //properties
    

    var descriptionOfSolution: String?
    var taskId: String?
    
    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //construct with @name, @address, @latitude, and @longitude parameters
    
    init(descriptionOfSolution: String, taskId: String) {
        
        self.descriptionOfSolution = descriptionOfSolution
        self.taskId = taskId
        
    }
    
    
    //prints object's current state
    
    override var description: String {
        return "Description: \(descriptionOfSolution), TaskId: \(taskId)"
        
    }

}
