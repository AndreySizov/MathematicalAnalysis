//
//  AnswerViewController.swift
//  Mathematical Analysis
//
//  Created by Андрей on 02.05.17.
//  Copyright © 2017 HSE. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    
    var mainDictionary: Dictionary = [String: NSArray]()
    var task: TaskModel = TaskModel()

    @IBOutlet weak var logButton: UIButton!
    @IBOutlet weak var expButton: UIButton!
    @IBOutlet weak var involutionButton: UIButton!
    @IBOutlet weak var plusZeroLimButton: UIButton!
    @IBOutlet weak var minusZeroLimButton: UIButton!
    @IBOutlet weak var minusInfinityLimButton: UIButton!
    @IBOutlet weak var plusInfinityLimButton: UIButton!
    @IBOutlet weak var emptyLimButton: UIButton!
    @IBOutlet weak var plusMinusInfinityIntegralButton: UIButton!
    @IBOutlet weak var minusInfinityIntegralButton: UIButton!
    @IBOutlet weak var emptyIntegralButton: UIButton!
    @IBOutlet weak var plusInfinityIntegralButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var plusMinusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var minusPlusButton: UIButton!
    @IBOutlet weak var starButton: UIButton!
    @IBOutlet weak var slashButton: UIButton!
    @IBOutlet weak var apostropheButton: UIButton!
    @IBOutlet weak var commaButton: UIButton!
    @IBOutlet weak var leftBracketButton: UIButton!
    @IBOutlet weak var rightBracketButton: UIButton!
    @IBOutlet weak var integralButton: UIButton!
    @IBOutlet weak var plusInfinityButton: UIButton!
    @IBOutlet weak var minusInfinityButton: UIButton!
    @IBOutlet weak var xButton: UIButton!
    @IBOutlet weak var yButton: UIButton!
    @IBOutlet weak var zButton: UIButton!
    @IBOutlet weak var aButton: UIButton!
    @IBOutlet weak var bButton: UIButton!
    @IBOutlet weak var arrowButton: UIButton!
    @IBOutlet weak var emptySetButton: UIButton!
    @IBOutlet weak var sinButton: UIButton!
    @IBOutlet weak var cosButton: UIButton!
    @IBOutlet weak var tgButton: UIButton!
    @IBOutlet weak var ctgButton: UIButton!
    @IBOutlet weak var lnButton: UIButton!
    @IBOutlet weak var lgButton: UIButton!
    @IBOutlet weak var keyboardButton: UIButton!
    @IBOutlet weak var spaceButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "fon")!)
        
//        let font:UIFont? = UIFont(name: "Helvetica", size:18)
//        let fontSmall:UIFont? = UIFont(name: "Arial", size:9)
        let font:UIFont? = UIFont.systemFont(ofSize: 16)
        let fontSmall:UIFont? = UIFont.systemFont(ofSize: 8)
        
        let attString:NSMutableAttributedString = NSMutableAttributedString(string:(expButton.titleLabel?.text)!, attributes: [NSFontAttributeName:font!])
        attString.setAttributes([NSFontAttributeName:fontSmall!,NSBaselineOffsetAttributeName:10], range: NSRange(location:1,length:2))
        
        expButton.setAttributedTitle(attString, for: UIControlState())
        expButton.layer.borderWidth = 0.3
        expButton.layer.borderColor = UIColor.white.cgColor
        
        
        let attString2:NSMutableAttributedString = NSMutableAttributedString(string:(emptyLimButton.titleLabel?.text)!, attributes: [NSFontAttributeName:font!])
        attString2.addAttributes([NSFontAttributeName:fontSmall!], range: NSMakeRange(3, 5))
        
        emptyLimButton.setAttributedTitle(attString2, for: UIControlState())
        emptyLimButton.layer.borderWidth = 0.3
        emptyLimButton.layer.borderColor = UIColor.white.cgColor
        
        let attString3:NSMutableAttributedString = NSMutableAttributedString(string:(emptyIntegralButton.titleLabel?.text)!, attributes: [NSFontAttributeName:font!])
        attString3.addAttributes([NSFontAttributeName:fontSmall!], range: NSMakeRange(0, 4))
        attString3.setAttributes([NSFontAttributeName:fontSmall!,NSBaselineOffsetAttributeName:10], range: NSRange(location:2,length:2))
        
        emptyIntegralButton.setAttributedTitle(attString3, for: UIControlState())
        emptyIntegralButton.layer.borderWidth = 0.3
        emptyIntegralButton.layer.borderColor = UIColor.white.cgColor
        
        let attString4:NSMutableAttributedString = NSMutableAttributedString(string:(plusInfinityIntegralButton.titleLabel?.text)!, attributes: [NSFontAttributeName:font!])
        attString4.addAttributes([NSFontAttributeName:fontSmall!], range: NSMakeRange(0, 4))
        attString4.setAttributes([NSFontAttributeName:fontSmall!,NSBaselineOffsetAttributeName:10], range: NSRange(location:2,length:2))
        plusInfinityIntegralButton.setAttributedTitle(attString4, for: UIControlState())
        plusInfinityIntegralButton.layer.borderWidth = 0.3
        plusInfinityIntegralButton.layer.borderColor = UIColor.white.cgColor
        
        let attString5:NSMutableAttributedString = NSMutableAttributedString(string:(minusInfinityIntegralButton.titleLabel?.text)!, attributes: [NSFontAttributeName:font!])
        attString5.addAttributes([NSFontAttributeName:fontSmall!], range: NSMakeRange(0, 4))
        attString5.setAttributes([NSFontAttributeName:fontSmall!,NSBaselineOffsetAttributeName:10], range: NSRange(location:2,length:2))
        minusInfinityIntegralButton.setAttributedTitle(attString5, for: UIControlState())
        minusInfinityIntegralButton.layer.borderWidth = 0.3
        minusInfinityIntegralButton.layer.borderColor = UIColor.white.cgColor
        
        let attString6:NSMutableAttributedString = NSMutableAttributedString(string:(plusMinusInfinityIntegralButton.titleLabel?.text)!, attributes: [NSFontAttributeName:font!])
        attString6.addAttributes([NSFontAttributeName:fontSmall!], range: NSMakeRange(0, 4))
        attString6.setAttributes([NSFontAttributeName:fontSmall!,NSBaselineOffsetAttributeName:10], range: NSRange(location:2,length:2))
        plusMinusInfinityIntegralButton.setAttributedTitle(attString6, for: UIControlState())
        plusMinusInfinityIntegralButton.layer.borderWidth = 0.3
        plusMinusInfinityIntegralButton.layer.borderColor = UIColor.white.cgColor
        
        let attString7:NSMutableAttributedString = NSMutableAttributedString(string:(plusInfinityLimButton.titleLabel?.text)!, attributes: [NSFontAttributeName:font!])
        attString7.addAttributes([NSFontAttributeName:fontSmall!], range: NSMakeRange(3, 5))
        
        plusInfinityLimButton.setAttributedTitle(attString7, for: UIControlState())
        plusInfinityLimButton.layer.borderWidth = 0.3
        plusInfinityLimButton.layer.borderColor = UIColor.white.cgColor
        
        let attString8:NSMutableAttributedString = NSMutableAttributedString(string:(minusInfinityLimButton.titleLabel?.text)!, attributes: [NSFontAttributeName:font!])
        attString8.addAttributes([NSFontAttributeName:fontSmall!], range: NSMakeRange(3, 5))
        
        minusInfinityLimButton.setAttributedTitle(attString8, for: UIControlState())
        minusInfinityLimButton.layer.borderWidth = 0.3
        minusInfinityLimButton.layer.borderColor = UIColor.white.cgColor
        
        let attString9:NSMutableAttributedString = NSMutableAttributedString(string:(plusZeroLimButton.titleLabel?.text)!, attributes: [NSFontAttributeName:font!])
        attString9.addAttributes([NSFontAttributeName:fontSmall!], range: NSMakeRange(3, 7))
        
        plusZeroLimButton.setAttributedTitle(attString9, for: UIControlState())
        plusZeroLimButton.layer.borderWidth = 0.3
        plusZeroLimButton.layer.borderColor = UIColor.white.cgColor
        
        let attString10:NSMutableAttributedString = NSMutableAttributedString(string:(minusZeroLimButton.titleLabel?.text)!, attributes: [NSFontAttributeName:font!])
        attString10.addAttributes([NSFontAttributeName:fontSmall!], range: NSMakeRange(3, 7))
        
        minusZeroLimButton.setAttributedTitle(attString10, for: UIControlState())
        minusZeroLimButton.layer.borderWidth = 0.3
        minusZeroLimButton.layer.borderColor = UIColor.white.cgColor
        
        let attString11:NSMutableAttributedString = NSMutableAttributedString(string:(involutionButton.titleLabel?.text)!, attributes: [NSFontAttributeName:font!])
        attString11.addAttributes([NSFontAttributeName:fontSmall!], range: NSMakeRange(2, 2))
        attString11.setAttributes([NSFontAttributeName:fontSmall!,NSBaselineOffsetAttributeName:10], range: NSRange(location:2,length:2))
        involutionButton.setAttributedTitle(attString11, for: UIControlState())
        involutionButton.layer.borderWidth = 0.3
        involutionButton.layer.borderColor = UIColor.white.cgColor
        
        let attString12:NSMutableAttributedString = NSMutableAttributedString(string:(logButton.titleLabel?.text)!, attributes: [NSFontAttributeName:font!])
        attString12.addAttributes([NSFontAttributeName:fontSmall!], range: NSMakeRange(3, 2))
        logButton.setAttributedTitle(attString12, for: UIControlState())
        logButton.layer.borderWidth = 0.3
        logButton.layer.borderColor = UIColor.white.cgColor
        
        
        zeroButton.layer.borderWidth = 0.3
        zeroButton.layer.borderColor = UIColor.white.cgColor
        oneButton.layer.borderWidth = 0.3
        oneButton.layer.borderColor = UIColor.white.cgColor
        twoButton.layer.borderWidth = 0.3
        twoButton.layer.borderColor = UIColor.white.cgColor
        threeButton.layer.borderWidth = 0.3
        threeButton.layer.borderColor = UIColor.white.cgColor
        fourButton.layer.borderWidth = 0.3
        fourButton.layer.borderColor = UIColor.white.cgColor
        fiveButton.layer.borderWidth = 0.3
        fiveButton.layer.borderColor = UIColor.white.cgColor
        sixButton.layer.borderWidth = 0.3
        sixButton.layer.borderColor = UIColor.white.cgColor
        sevenButton.layer.borderWidth = 0.3
        sevenButton.layer.borderColor = UIColor.white.cgColor
        eightButton.layer.borderWidth = 0.3
        eightButton.layer.borderColor = UIColor.white.cgColor
        nineButton.layer.borderWidth = 0.3
        nineButton.layer.borderColor = UIColor.white.cgColor
        plusButton.layer.borderWidth = 0.3
        plusButton.layer.borderColor = UIColor.white.cgColor
        plusMinusButton.layer.borderWidth = 0.3
        plusMinusButton.layer.borderColor = UIColor.white.cgColor
        minusButton.layer.borderWidth = 0.3
        minusButton.layer.borderColor = UIColor.white.cgColor
        minusPlusButton.layer.borderWidth = 0.3
        minusPlusButton.layer.borderColor = UIColor.white.cgColor
        starButton.layer.borderWidth = 0.3
        starButton.layer.borderColor = UIColor.white.cgColor
        slashButton.layer.borderWidth = 0.3
        slashButton.layer.borderColor = UIColor.white.cgColor
        apostropheButton.layer.borderWidth = 0.3
        apostropheButton.layer.borderColor = UIColor.white.cgColor
        leftBracketButton.layer.borderWidth = 0.3
        leftBracketButton.layer.borderColor = UIColor.white.cgColor
        rightBracketButton.layer.borderWidth = 0.3
        rightBracketButton.layer.borderColor = UIColor.white.cgColor
        commaButton.layer.borderWidth = 0.3
        commaButton.layer.borderColor = UIColor.white.cgColor
        integralButton.layer.borderWidth = 0.3
        integralButton.layer.borderColor = UIColor.white.cgColor
        plusInfinityButton.layer.borderWidth = 0.3
        plusInfinityButton.layer.borderColor = UIColor.white.cgColor
        minusInfinityButton.layer.borderWidth = 0.3
        minusInfinityButton.layer.borderColor = UIColor.white.cgColor
        xButton.layer.borderWidth = 0.3
        xButton.layer.borderColor = UIColor.white.cgColor
        yButton.layer.borderWidth = 0.3
        yButton.layer.borderColor = UIColor.white.cgColor
        zButton.layer.borderWidth = 0.3
        zButton.layer.borderColor = UIColor.white.cgColor
        aButton.layer.borderWidth = 0.3
        aButton.layer.borderColor = UIColor.white.cgColor
        bButton.layer.borderWidth = 0.3
        bButton.layer.borderColor = UIColor.white.cgColor
        arrowButton.layer.borderWidth = 0.3
        arrowButton.layer.borderColor = UIColor.white.cgColor
        emptySetButton.layer.borderWidth = 0.3
        emptySetButton.layer.borderColor = UIColor.white.cgColor
        sinButton.layer.borderWidth = 0.3
        sinButton.layer.borderColor = UIColor.white.cgColor
        cosButton.layer.borderWidth = 0.3
        cosButton.layer.borderColor = UIColor.white.cgColor
        tgButton.layer.borderWidth = 0.3
        tgButton.layer.borderColor = UIColor.white.cgColor
        ctgButton.layer.borderWidth = 0.3
        ctgButton.layer.borderColor = UIColor.white.cgColor
        lnButton.layer.borderWidth = 0.3
        lnButton.layer.borderColor = UIColor.white.cgColor
        lgButton.layer.borderWidth = 0.3
        lgButton.layer.borderColor = UIColor.white.cgColor
        keyboardButton.layer.borderWidth = 0.3
        keyboardButton.layer.borderColor = UIColor.white.cgColor
        spaceButton.layer.borderWidth = 0.3
        spaceButton.layer.borderColor = UIColor.white.cgColor
        deleteButton.layer.borderWidth = 0.3
        deleteButton.layer.borderColor = UIColor.white.cgColor
        sendButton.layer.borderWidth = 0.3
        sendButton.layer.borderColor = UIColor.white.cgColor
        

        var tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        self.view.addGestureRecognizer(tap)
    }
    
    func hideKeyboard(){
        
        self.view.endEditing(true)
    }
    @IBAction func openKeyboard(_ sender: UIButton) {
        self.textView.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func deleteSymbol(_ sender: Any) {
        var cursorPosition = 0
        if let selectedRange = textView.selectedTextRange {
            
            cursorPosition = textView.offset(from: textView.beginningOfDocument, to: selectedRange.start)
            
        }
        if(!textView.text.isEmpty){
            var numAr = Array(textView.text.characters)
            var num = numAr.count
            print(num)
            var erf1 = textView.attributedText.attributedSubstring(from: NSMakeRange(0, cursorPosition-1))
            print(erf1.string)
            var erf2 = textView.attributedText.attributedSubstring(from: NSMakeRange(cursorPosition, num - cursorPosition))
            print(erf2.string)
            var tggg = NSMutableAttributedString()
            tggg.append(erf1)
            tggg.append(erf2)
            textView.attributedText = tggg
            textView.textColor = UIColor.white
        }
    }
    
    @IBAction func addSymbol(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, animations:
            {self.hideKeyboard()})
        var cursorPosition = 0
        if let selectedRange = textView.selectedTextRange {
            
            cursorPosition = textView.offset(from: textView.beginningOfDocument, to: selectedRange.start)
            
            print("\(cursorPosition)")
        }
        if(!textView.text.isEmpty){
        var numAr = Array(textView.text.characters)
        var num = numAr.count
            print(num)
        var erf1 = textView.attributedText.attributedSubstring(from: NSMakeRange(0, cursorPosition))
            print(erf1.string)
        var erf2 = textView.attributedText.attributedSubstring(from: NSMakeRange(cursorPosition, num - cursorPosition))
            print(erf2.string)
        var tggg = NSMutableAttributedString()
        tggg.append(erf1)
            if(sender.titleLabel?.text != "Пробел"){
        var numAr2 = Array((sender.titleLabel?.text!.characters)!)
        var num2 = numAr2.count
        tggg.append((sender.titleLabel?.attributedText?.attributedSubstring(from: NSMakeRange(0, num2)))!)
            }else{
                let erry = NSAttributedString(string: " ")
                tggg.append(erry)
            }
        tggg.append(erf2)
            
        
        textView.attributedText = tggg
        }else{
        textView.attributedText = sender.titleLabel?.attributedText
        }
        textView.textColor = UIColor.white
    }
    @IBAction func checkAnswer(_ sender: UIButton) {
        var i=0
        while (i<mainDictionary["answers"]!.count){
            
            let d = mainDictionary["answers"]![i] as! AnswerModel
            
            if(d.taskId! as String == task.id){
                if(textView.text == d.value! as String){
                    let alert = UIAlertController(title: "Результат:", message: "Ответ верный!", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    
                    
                    
                    
                    
                    let myUrl = URL(string: "http://matan.s32.wh1.su/useractivity.php");
                    
                    var request = URLRequest(url:myUrl!)
                    
                    request.httpMethod = "POST"// Compose a query string
                    
                    let defaults = UserDefaults.standard
                    let loginString = defaults.object(forKey: "login") as! String
                    var idString = ""
                    
                    var j=0
                    while (j<mainDictionary["users"]!.count){
                        
                        let s = mainDictionary["users"]![j] as! RegisterModel
                        if(loginString == s.login){
                            idString = s.id!
                        }
                        j+=1
                    }
                    let taskIdString = task.id
                    
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                    let dateString = dateFormatter.string(from: Date.init())
                    print(dateString)
                    
                    var postString = "User_Id="+idString
                    postString = postString+"&Task_Id="+taskIdString!+"&Result=1"
                    postString = postString+"&DateTime="+dateString
                    
                    print(postString)
                    request.httpBody = postString.data(using: String.Encoding.utf8)
                    
                    let tasking = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
                        
                        if error != nil
                        {
                            print("error=\(error)")
                            return
                        }
                        
                        // You can print out response object
                        print("response = \(response)")
                        
                        //Let's convert response sent from a server side script to a NSDictionary object:
                        do {
                            let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                            
                            if let parseJSON = json {
                                
                                // Now we can access value of First Name by its key
                                let loginValue = parseJSON["dateTime"] as? String
                                print("DateTime: \(loginValue)")
                            }
                        } catch {
                            print(error)
                        }
                    }
                    tasking.resume()
                    
                    
                    
                }else{
                    let alert = UIAlertController(title: "Результат:", message: "Ответ неверный!", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    
                    
                    
                    
                    
                    let myUrl = URL(string: "http://matan.s32.wh1.su/useractivity.php");
                    
                    var request = URLRequest(url:myUrl!)
                    
                    request.httpMethod = "POST"// Compose a query string
                    
                    let defaults = UserDefaults.standard
                    let loginString = defaults.object(forKey: "login") as! String
                    var idString = ""
                    
                    var j=0
                    while (j<mainDictionary["users"]!.count){
                        
                        let s = mainDictionary["users"]![j] as! RegisterModel
                        if(loginString == s.login){
                            idString = s.id!
                        }
                        j+=1
                    }
                    let taskIdString = task.id
                    
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                    let dateString = dateFormatter.string(from: Date.init())
                    print(dateString)
                    
                    var postString = "User_Id="+idString
                    postString = postString+"&Task_Id="+taskIdString!+"&Result=0"
                    postString = postString+"&DateTime="+dateString
                    
                    
                    print(postString)
                    request.httpBody = postString.data(using: String.Encoding.utf8);
                    
                    let tasking = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
                        
                        if error != nil
                        {
                            print("error=\(error)")
                            return
                        }
                        
                        // You can print out response object
                        print("response = \(response)")
                        
                        //Let's convert response sent from a server side script to a NSDictionary object:
                        do {
                            let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                            
                            if let parseJSON = json {
                                
                                // Now we can access value of First Name by its key
                                let loginValue = parseJSON["dateTime"] as? String
                                print("DateTime: \(loginValue)")
                            }
                        } catch {
                            print(error)
                        }
                    }
                    tasking.resume()
                }
            }
            i+=1
            
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        let colorTop = UIColor(red: 8.0/255.0, green: 142.0/255.0, blue: 166.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 160.0/255.0, alpha: 1.0).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [ colorTop, colorBottom]
        gradientLayer.locations = [ 0.0, 1.7]
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
