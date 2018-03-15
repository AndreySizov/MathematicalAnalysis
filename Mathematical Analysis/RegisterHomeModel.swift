//
//  RegisterHomeModel.swift
//  Mathematical Analysis
//
//  Created by Андрей on 11.06.17.
//  Copyright © 2017 HSE. All rights reserved.
//

import Foundation

protocol RegisterHomeModelProtocal: class {
    func itemsDownloaded(items: NSArray)
}


class RegisterHomeModel: NSObject, URLSessionDataDelegate {
    
    //properties
    
    weak var delegate: RegisterHomeModelProtocal!
    
    var data : Data = Data()
    
    let urlPath: String = "http://matan.s32.wh1.su/logpass.php"
    
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
        let users: NSMutableArray = NSMutableArray()
        var i = 0
        let jsonPart = jsonResult["UserInfo"] as! [[String:Any]]
        print(jsonResult["UserInfo"])
        while(i < jsonPart.count)
        {
            
            jsonElement = jsonPart[i] as! NSDictionary
            
            let reg = RegisterModel()
            
            //the following insures none of the JsonElement values are nil through optional binding
            if let login = jsonElement["Login"] as? String{
                
                if  let password = jsonElement["Password"] as? String
                {if  let id = jsonElement["Id"] as? String{
                    
                    reg.login = login
                    reg.password = password
                    reg.id = id
                    }

                }
            }
            
            users.add(reg)
            i+=1
            
        }
        
        DispatchQueue.main.async(execute: { () -> Void in
            
            self.delegate.itemsDownloaded(items: users)
            
        })
    }
}


