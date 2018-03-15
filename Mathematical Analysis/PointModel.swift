//
//  PointModel.swift
//  Mathematical Analysis
//
//  Created by Андрей on 11.06.17.
//  Copyright © 2017 HSE. All rights reserved.
//

import Foundation

class PointModel: NSObject {
    
    //properties
    
    var id: String?
    var name: String?
    var descriptionOfPoint: String?
    var topicId: String?
    var typeOfPoint: String?
    
    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //construct with @name, @address, @latitude, and @longitude parameters
    
    init(id: String, name: String, descriptionOfPoint: String,topicId: String,typeOfPoint: String) {
        
        self.id = id
        self.name = name
        self.descriptionOfPoint = descriptionOfPoint
        self.topicId = topicId
        self.typeOfPoint = typeOfPoint
        
    }
    
    
    //prints object's current state
    
    override var description: String {
        return "Id: \(id),Name: \(name), Description: \(descriptionOfPoint), TopicId: \(topicId), TypeOfPoint: \(typeOfPoint)"
        
    }
    
}
