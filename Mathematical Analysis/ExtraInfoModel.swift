//
//  ExtraInfoModel.swift
//  Mathematical Analysis
//
//  Created by Андрей on 11.06.17.
//  Copyright © 2017 HSE. All rights reserved.
//

import Foundation

class ExtraInfoModel: NSObject {
    
    //properties
    
    var id: String?
    var descriptionOfExtraInfo: String?
    var pointId: String?
    var typeOfExtraInfo: String?
    
    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //construct with @name, @address, @latitude, and @longitude parameters
    
    init(id: String, descriptionOfExtraInfo: String,pointId: String,typeOfExtraInfo: String) {
        
        self.id = id
        self.descriptionOfExtraInfo = descriptionOfExtraInfo
        self.pointId = pointId
        self.typeOfExtraInfo = typeOfExtraInfo
        
    }
    
    
    //prints object's current state
    
    override var description: String {
        return "Id: \(id), Description: \(descriptionOfExtraInfo), PointId: \(pointId), TypeOfExtraInfo: \(typeOfExtraInfo)"
        
    }
    
}
