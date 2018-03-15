//
//  HomeModel.swift
//  Mathematical Analysis
//
//  Created by Андрей on 08.06.17.
//  Copyright © 2017 HSE. All rights reserved.
//

import Foundation

protocol HomeModelProtocal: class {
    func partsDownloaded(parts: NSArray, topics: NSArray, points: NSArray, tasks:NSArray, answers: NSArray, solutions: NSArray, formulas:NSArray, extraInfo:NSArray, userActivity: NSArray)
}



class HomeModel: NSObject, URLSessionDataDelegate {
    
    //properties
    
    weak var delegate: HomeModelProtocal!
    
    var data : Data = Data()
    
    let urlPath: String = "http://matan.s32.wh1.su/service2.php"
    
    func downloadItems() {
        
//        let url: NSURL = NSURL(string: urlPath)!
//        var session: URLSession!
//        let configuration = URLSessionConfiguration.default
//        
////        session = URLSession(session: URLSession, task: URLSessionTask, didCompleteWithError: nil)
////        session = URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
//        
//        let task = session.dataTask(with: url as URL)
//        
//        task.resume()

        let myUrl = URL(string: urlPath);
        var request = URLRequest(url:myUrl!);
        request.httpMethod = "GET";
        
        let task = URLSession.shared.dataTask(with: request) {
            datta, response, error in
            
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            print(String(data: datta!, encoding: String.Encoding.utf8)!)
//            self.data = datta!
//            print(String(self.data[0]))
            self.parseJSON(da: datta!)
        }
        
        task.resume()
        
    }
    
//    func URLSession(session: URLSession, dataTask: URLSessionDataTask, didReceiveData data: NSData) {
//        self.data.append(data as Data);
//        
//    }
    
//    private func URLSession(session: URLSession, task: URLSessionTask, didCompleteWithError error: NSError?) {
//        if error != nil {
//            print("Failed to download data")
//        }else {
//            print("Data downloaded")
//            self.parseJSON()
//        }
//        
//    }
    func parseJSON(da:Data) {
        
        var jsonResult: [String:Any]!
        
        do{
//            jsonResult = try JSONSerialization.jsonObject(with: da as Data, options:JSONSerialization.ReadingOptions.mutableContainers) as! AnyObject
            jsonResult = try JSONSerialization.jsonObject(with: da as Data, options:JSONSerialization.ReadingOptions.mutableContainers) as! [String:Any]
            print (jsonResult)
            
        } catch let error as NSError {
            print(error)
            
        }
        
        var jsonElement: NSDictionary = NSDictionary()
        let parts: NSMutableArray = NSMutableArray()
        var i = 0
        let jsonPart = jsonResult["Part"] as! [[String:Any]]
        print(jsonResult["Part"])
        while(i < jsonPart.count)
        {
            
            jsonElement = jsonPart[i] as! NSDictionary
            
            let part = PartModel()
            
            //the following insures none of the JsonElement values are nil through optional binding
            if let name = jsonElement["Name"] as? String{
            
              if  let id = jsonElement["Id"] as? String
                {
                
                part.name = name
                part.id = id
                print(part.name!)
                }
            }
            
            parts.add(part)
            i+=1
        
        }
        

        let topics: NSMutableArray = NSMutableArray()
        i = 0
        let jsonTopic = jsonResult["Topic"] as! [[String:Any]]
        print(jsonResult["Topic"])
        while(i < jsonTopic.count)
        {
            
            jsonElement = jsonTopic[i] as! NSDictionary
            
            let topic = TopicModel()
            
            //the following insures none of the JsonElement values are nil through optional binding
            if let name = jsonElement["Name"] as? String{
                
                if  let id = jsonElement["Id"] as? String
                {if  let partId = jsonElement["Part_Id"] as? String{
                    
                 
                    topic.name = name
                    topic.id = id
                    topic.partId = partId
                    print(topic.name!)
                    
                    }
                    
                }
            }
            
            topics.add(topic)
            i+=1
            
        }

        let points: NSMutableArray = NSMutableArray()
        i = 0
        let jsonPoint = jsonResult["Point"] as! [[String:Any]]
        print(jsonResult["Point"])
        while(i < jsonPoint.count)
        {
            
            jsonElement = jsonPoint[i] as! NSDictionary
            
            let point = PointModel()
            
            //the following insures none of the JsonElement values are nil through optional binding
            if let name = jsonElement["Name"] as? String{
                
                if  let id = jsonElement["Id"] as? String
                {
                    if  let topicId = jsonElement["Topic_Id"] as? String
                    {
                        if  let descriptionOfPoint = jsonElement["Description"] as? String
                        {
                            if  let typeOfPoint = jsonElement["TypeOfPoint"] as? String
                            {
                    
                    
                                point.name = name
                                point.id = id
                                point.topicId = topicId
                                point.descriptionOfPoint = descriptionOfPoint
                                point.typeOfPoint = typeOfPoint
                    
                            }
                        
                    
                        }
                    
                    
                    }
                }
            }
            
            points.add(point)
            i+=1
            
        }
        
        
        let tasks: NSMutableArray = NSMutableArray()
        i = 0
        let jsonTask = jsonResult["Task"] as! [[String:Any]]
        print(jsonResult["Task"])
        while(i < jsonTask.count)
        {
            
            jsonElement = jsonTask[i] as! NSDictionary
            
            let task = TaskModel()
            
            //the following insures none of the JsonElement values are nil through optional binding

                if  let id = jsonElement["Id"] as? String
                {
                        if  let descriptionOfTask = jsonElement["Description"] as? String
                        {
                            if  let pointId = jsonElement["Point_Id"] as? String
                            {
                                

                                task.id = id
                                task.pointId = pointId
                                task.descriptionOfTask = descriptionOfTask

                                
                            }
                            
                            
                        }
                    
                }
            
            tasks.add(task)
            i+=1
            
        }
        
        let answers: NSMutableArray = NSMutableArray()
        i = 0
        let jsonAnswer = jsonResult["Answer"] as! [[String:Any]]
        print(jsonResult["Answer"])
        while(i < jsonAnswer.count)
        {
            
            jsonElement = jsonAnswer[i] as! NSDictionary
            
            let answer = AnswerModel()
            
            //the following insures none of the JsonElement values are nil through optional binding
            

                if  let value = jsonElement["Value"] as? String
                {
                    if  let taskId = jsonElement["Task_Id"] as? String
                    {
                        
                        answer.value = value
                        answer.taskId = taskId
                        
                        
                    }
                    
                    
                }
                

            
            answers.add(answer)
            i+=1
            
        }
        
        let solutions: NSMutableArray = NSMutableArray()
        i = 0
        let jsonSolution = jsonResult["Solution"] as! [[String:Any]]
        print(jsonResult["Solution"])
        while(i < jsonSolution.count)
        {
            
            jsonElement = jsonSolution[i] as! NSDictionary
            
            let solution = SolutionModel()
            
            //the following insures none of the JsonElement values are nil through optional binding
            
            
            if  let descriptionOfSolution = jsonElement["Description"] as? String
            {
                if  let taskId = jsonElement["Task_Id"] as? String
                {
                    
                    solution.descriptionOfSolution = descriptionOfSolution
                    solution.taskId = taskId
                    
                    
                }
                
                
            }
            
            
            
            solutions.add(solution)
            i+=1
            
        }
        
        let formulas: NSMutableArray = NSMutableArray()
        i = 0
        let jsonFormula = jsonResult["Formula"] as! [[String:Any]]
        print(jsonResult["Formula"])
        while(i < jsonFormula.count)
        {
            
            jsonElement = jsonFormula[i] as! NSDictionary
            
            let formula = FormulaModel()
            
            //the following insures none of the JsonElement values are nil through optional binding
            
            
            if  let name = jsonElement["Name"] as? String
            {
                if  let value = jsonElement["Value"] as? String
                {
                    
                    formula.name = name
                    formula.value = value
                    
                    
                }
                
                
            }
            
            
            
            formulas.add(formula)
            i+=1
            
        }
        
        
        let extras: NSMutableArray = NSMutableArray()
        i = 0
        let jsonExtraInfo = jsonResult["ExtraInfo"] as! [[String:Any]]
        print(jsonResult["ExtraInfo"])
        while(i < jsonExtraInfo.count)
        {
            
            jsonElement = jsonExtraInfo[i] as! NSDictionary
            
            let extraInfo = ExtraInfoModel()
            
            //the following insures none of the JsonElement values are nil through optional binding

                
                if  let id = jsonElement["Id"] as? String
                {
                    if  let pointId = jsonElement["Point_Id"] as? String
                    {
                        if  let descriptionOfExtraInfo = jsonElement["Description"] as? String
                        {
                            if  let typeOfExtraInfo = jsonElement["TypeOfExtraInfo"] as? String
                            {
                                
                                
                                extraInfo.id = id
                                extraInfo.descriptionOfExtraInfo = descriptionOfExtraInfo
                                extraInfo.pointId = pointId
                                extraInfo.typeOfExtraInfo = typeOfExtraInfo
                                
                            }
                            
                            
                        }
                        
                        
                    }
                }
            
            
            extras.add(extraInfo)
            i+=1
            
        }
        
        
        let userActivities: NSMutableArray = NSMutableArray()
        i = 0
        let jsonUserActivity = jsonResult["UserActivity"] as! [[String:Any]]
        print(jsonResult["UserActivity"])
        while(i < jsonUserActivity.count)
        {
            
            jsonElement = jsonUserActivity[i] as! NSDictionary
            
            let userActivity = UserActivityModel()
            
            //the following insures none of the JsonElement values are nil through optional binding
            
            
            if  let dateTimeInfo = jsonElement["DateTime"] as? String
            {
                if  let result = jsonElement["Result"] as? String
                {
                    if  let taskId = jsonElement["Task_Id"] as? String
                    {
                        if  let login = jsonElement["Login"] as? String
                        {
                            
                            
                            userActivity.dateTimeInfo = dateTimeInfo
                            userActivity.result = result
                            userActivity.taskId = taskId
                            userActivity.userLogin = login
                            
                        }
                        
                        
                    }
                    
                    
                }
            }
            
            
            userActivities.add(userActivity)
            i+=1
            
        }
        
        DispatchQueue.main.async(execute: { () -> Void in
            
            self.delegate.partsDownloaded(parts: parts, topics: topics, points: points, tasks:tasks, answers: answers, solutions: solutions, formulas: formulas, extraInfo: extras, userActivity: userActivities)
//            self.topicdelegate.topicsDownloaded(items: topics)
            
        })

    }
}

