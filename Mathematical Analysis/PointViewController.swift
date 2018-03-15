//
//  PointViewController.swift
//  Mathematical Analysis
//
//  Created by Андрей on 11.06.17.
//  Copyright © 2017 HSE. All rights reserved.
//

import UIKit

class PointViewController: UIViewController {

    var mainDictionary: Dictionary = [String: NSArray]()
    var num:String!
    var pointM:PointModel!
    var tableName:String!
    var extras: NSMutableArray = NSMutableArray()
    var tasks: NSMutableArray = NSMutableArray()
    var asd: String!
    
    @IBOutlet weak var svButton: UIButton!
    @IBOutlet weak var slButton: UIButton!
    @IBOutlet weak var zamButton: UIButton!
    @IBOutlet weak var practiceButton: UIButton!
    @IBOutlet weak var pointTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        svButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 22)
        slButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 22)
        zamButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 22)
        practiceButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 37)
//        practiceButton.layer.borderWidth = 0.8
//        practiceButton.layer.borderColor = UIColor.white.cgColor

//        svButton.setTitleColor(UIColor(red: 8.0/255.0, green: 142.0/255.0, blue: 166.0/255.0, alpha: 1.0), for: UIControlState.normal)
//        slButton.setTitleColor(UIColor(red: 8.0/255.0, green: 142.0/255.0, blue: 166.0/255.0, alpha: 1.0), for: UIControlState.normal)
//        zamButton.setTitleColor(UIColor(red: 8.0/255.0, green: 142.0/255.0, blue: 166.0/255.0, alpha: 1.0), for: UIControlState.normal)
//        practiceButton.setTitleColor(UIColor(red: 8.0/255.0, green: 142.0/255.0, blue: 166.0/255.0, alpha: 1.0), for: UIControlState.normal)
        
        var i=0
        while (i<mainDictionary["points"]!.count){

            let d = mainDictionary["points"]![i] as! PointModel
            
            if(d.id! as String == num){
                pointTextView.text = d.descriptionOfPoint! as String
                pointM = d
            }
            i+=1
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showExtra(_ sender: UIButton) {
        if(sender.titleLabel?.text == "Свойство  >"){
            tableName = "Свойство"
        }
        if(sender.titleLabel?.text == "Следствие >"){
            tableName = "Следствие"
        }
        if(sender.titleLabel?.text == "Замечание >"){
            tableName = "Замечание"
        }
        performSegue(withIdentifier: "showExtraInfo", sender: sender)
    }


    @IBAction func showTask(_ sender: UIButton) {
                performSegue(withIdentifier: "showPracticeTask", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "showExtraInfo"){
            let destinationVC = segue.destination as! ExtraInfoViewController
            var i=0
            while (i<mainDictionary["extraInfo"]!.count){
                
                let o = mainDictionary["extraInfo"]![i] as! ExtraInfoModel
                
                if((o.pointId! as String == pointM.id)&&(o.typeOfExtraInfo! as String == tableName)){
                    destinationVC.extraInfoText = o.descriptionOfExtraInfo!
                }
                i+=1
                
            }
            destinationVC.titleOfView = tableName
            destinationVC.mainDictionary = mainDictionary
        }
        if(segue.identifier == "showPracticeTask"){
        let destinationVC = segue.destination as! PracticeTaskTableViewController
        var i=0
        while (i<mainDictionary["tasks"]!.count){
            
            let d = mainDictionary["tasks"]![i] as! TaskModel
            
 
            if(d.pointId! as String == pointM.id){
                tasks.add(mainDictionary["tasks"]![i])
            }
            i+=1
            
        }
        destinationVC.tasks = tasks
        destinationVC.mainDictionary = mainDictionary
    }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        asd = pointM.name
        var w = asd.substring(to:asd.index(asd.startIndex, offsetBy: 6))
        w = w + "..."
        self.navigationItem.title = w
        self.navigationController?.navigationBar.tintColor = UIColor.white
        let colorTop = UIColor(red: 8.0/255.0, green: 142.0/255.0, blue: 166.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 160.0/255.0, alpha: 1.0).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [ colorTop, colorBottom]
        gradientLayer.locations = [ 0.0, 2.0]
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear

        tasks.removeAllObjects()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
