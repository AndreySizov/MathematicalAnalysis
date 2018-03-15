//
//  ItemVC.swift
//  Mathematical Analysis
//
//  Created by Андрей on 01.05.17.
//  Copyright © 2017 HSE. All rights reserved.
//

import UIKit


class ItemVC: UIViewController {
    
    var mainDictionary: Dictionary = [String: NSArray]()
    var task: TaskModel = TaskModel()

    var type:String!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var valueButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 16)
        valueButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 32)

        nextButton.setTitleColor(UIColor(red: 8.0/255.0, green: 142.0/255.0, blue: 166.0/255.0, alpha: 1.0), for: UIControlState.normal)
        valueButton.setTitleColor(UIColor(red: 8.0/255.0, green: 142.0/255.0, blue: 166.0/255.0, alpha: 1.0), for: UIControlState.normal)

        textView.backgroundColor = UIColor.clear
        textView.text = task.descriptionOfTask
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showNextItem(_ sender: Any) {
        performSegue(withIdentifier: "showSolutionVC", sender: sender)
    }

    @IBAction func changeableAction(_ sender: Any) {
        performSegue(withIdentifier: "showAnswerVC", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "showAnswerVC"){
        let destinationVC = segue.destination as! AnswerViewController
        
        destinationVC.task = task
        destinationVC.mainDictionary = mainDictionary
        }
        if(segue.identifier == "showSolutionVC"){
            let destinationVC = segue.destination as! SolutionViewController
            
            destinationVC.task = task
            destinationVC.mainDictionary = mainDictionary
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
