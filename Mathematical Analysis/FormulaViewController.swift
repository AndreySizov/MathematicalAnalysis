//
//  FormulaViewController.swift
//  Mathematical Analysis
//
//  Created by Андрей on 11.06.17.
//  Copyright © 2017 HSE. All rights reserved.
//

import UIKit

class FormulaViewController: UIViewController {
    var mainDictionary: Dictionary = [String: NSArray]()
    var formula: FormulaModel = FormulaModel()
    var asd: String!

    @IBOutlet weak var formulaTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        formulaTextView.text = formula.value
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        asd = formula.name
        var w = asd.substring(to:asd.index(asd.startIndex, offsetBy: 6))
        w = w + "..."
        self.navigationItem.title = w
        self.navigationController?.navigationBar.tintColor = UIColor.white
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
