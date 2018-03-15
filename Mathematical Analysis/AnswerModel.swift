//
//  AnswerModel.swift
//  Mathematical Analysis
//
//  Created by Андрей on 11.06.17.
//  Copyright © 2017 HSE. All rights reserved.
//

import Foundation

class AnswerModel: NSObject {
    
    //properties
    
    
    var value: String?
    var taskId: String?
    
    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //construct with @name, @address, @latitude, and @longitude parameters
    
    init(value: String, taskId: String) {
        
        self.value = value
        self.taskId = taskId
        
    }
    
    
    //prints object's current state
    
    override var description: String {
        return "Value: \(value), TaskId: \(taskId)"
        
    }
    
}
