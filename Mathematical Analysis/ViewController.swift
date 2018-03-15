//
//  ViewController.swift
//  Mathematical Analysis
//
//  Created by Андрей on 01.05.17.
//  Copyright © 2017 HSE. All rights reserved.
//

import UIKit

class ViewController: UIViewController, HomeModelProtocal {

    var mainDictionary: Dictionary = [String: NSArray]()
    var userActivitiesArray: NSMutableArray = NSMutableArray()
    
    @IBOutlet weak var theoryButton: UIButton!
    @IBOutlet weak var resultButton: UIButton!
    @IBOutlet weak var logOutButton: UIButton!
    @IBOutlet weak var formulaButton: UIButton!
    @IBOutlet weak var practiceButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(mainDictionary["users"])
        self.navigationItem.title = "Меню"

        theoryButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 35)
        practiceButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 35)
        resultButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 30)
        formulaButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 30)
        logOutButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 25)
        logOutButton.setTitleColor(UIColor(red: 8.0/255.0, green: 142.0/255.0, blue: 166.0/255.0, alpha: 1.0), for: UIControlState.normal)
        
//        let homeModel = HomeModel()
//        homeModel.delegate = self
//        homeModel.downloadItems()
        
    }
    func partsDownloaded(parts: NSArray, topics: NSArray, points: NSArray, tasks:NSArray, answers: NSArray, solutions: NSArray, formulas:NSArray, extraInfo:NSArray, userActivity:NSArray) {
        
        mainDictionary["parts"] = parts
        mainDictionary["topics"] = topics
        mainDictionary["points"] = points
        mainDictionary["tasks"] = tasks
        mainDictionary["answers"] = answers
        mainDictionary["solutions"] = solutions
        mainDictionary["formulas"] = formulas
        mainDictionary["extraInfo"] = extraInfo
        mainDictionary["userActivity"] = userActivity
        print(mainDictionary["userActivity"])
        print(mainDictionary["points"])
        print(mainDictionary["extraInfo"])
        print(mainDictionary["parts"])
        print(mainDictionary["topics"])
        print(mainDictionary["tasks"])
        print(mainDictionary["answers"])
        print(mainDictionary["solutions"])
        print(mainDictionary["formulas"])
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showList(_ sender: UIButton) {
        performSegue(withIdentifier: "showTable", sender: sender)
    }
    
    @IBAction func showFormula(_ sender: Any) {
        performSegue(withIdentifier: "showFormulaTable", sender: sender)
    }
    
    @IBAction func showResult(_ sender: Any) {
        performSegue(withIdentifier: "showResultVC", sender: sender)
    }
    @IBAction func showPractice(_ sender: Any) {
        performSegue(withIdentifier: "showPracticeVC", sender: sender)
    }
    @IBAction func logOff(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "EnterVC") as! EnterViewController
        present(vc, animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showTable"){
        let destinationVC = segue.destination as! TableViewController
//        if (theoryButton.isEqual(sender)){
//            destinationVC.type = "theory"
//        }else{
//            destinationVC.type = "practice"
//        }

        destinationVC.mainDictionary = mainDictionary
        }
        if (segue.identifier == "showPracticeVC"){
            let destinationVC = segue.destination as! PracticeTableViewController
            
            destinationVC.mainDictionary = mainDictionary
        }
        if (segue.identifier == "showFormulaTable"){
            let destinationVC = segue.destination as! FormulaTableViewController
            
            destinationVC.mainDictionary = mainDictionary
        }
        if (segue.identifier == "showResultVC"){
            let destinationVC = segue.destination as! ResultTableViewController
            
            
            destinationVC.mainDictionary = mainDictionary
            
            var i=0
            while (i<mainDictionary["userActivity"]!.count){
                let d = mainDictionary["userActivity"]![i] as! UserActivityModel
                let defaults = UserDefaults.standard
                let loginString = defaults.object(forKey: "login") as! String
                
                if(d.userLogin! as String == loginString){
                    userActivitiesArray.add(mainDictionary["userActivity"]![i])
                }
                i+=1
                
            }
            destinationVC.activities = userActivitiesArray
            
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        let colorTop = UIColor(red: 8.0/255.0, green: 142.0/255.0, blue: 166.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 160.0/255.0, alpha: 1.0).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [ colorTop, colorBottom]
        gradientLayer.locations = [ 0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.clear]
        let homeModel = HomeModel()
        homeModel.delegate = self
        homeModel.downloadItems()
        userActivitiesArray.removeAllObjects()
    }

}

