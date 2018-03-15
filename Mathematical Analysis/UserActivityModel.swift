//
//  UserActivityModel.swift
//  Mathematical Analysis
//
//  Created by Андрей on 12.06.17.
//  Copyright © 2017 HSE. All rights reserved.
//

import Foundation

class UserActivityModel: NSObject {
    
    //properties
    
    var dateTimeInfo: String?
    var result: String?
    var taskId: String?
    var userLogin: String?

    
    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //construct with @name, @address, @latitude, and @longitude parameters
    
    init(dateTimeInfo: String, result: String, taskId: String,topicId: String,userLogin: String) {
        
        self.dateTimeInfo = dateTimeInfo
        self.result = result
        self.taskId = taskId
        self.userLogin = userLogin
        
    }
    
    
    //prints object's current state
    
    override var description: String {
        return "DateTime: \(dateTimeInfo),Result: \(result), TaskId: \(taskId), UserLogin: \(userLogin)"
        
    }
    
}
