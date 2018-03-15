//
//  EnterViewController.swift
//  Mathematical Analysis
//
//  Created by Андрей on 11.06.17.
//  Copyright © 2017 HSE. All rights reserved.
//

import UIKit

class EnterViewController: UIViewController,RegisterHomeModelProtocal {
    var feedItems: NSArray = NSArray()
    var mainDictionary: Dictionary = [String: NSArray]()
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var newUserButton: UIButton!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoImageView.image = UIImage(named: "logo")
        self.view.backgroundColor = UIColor(red: 8.0/255.0, green: 142.0/255.0, blue: 166.0/255.0, alpha: 1.0)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        loginTextField.layer.borderWidth = 0.8
        loginTextField.layer.borderColor = UIColor.white.cgColor
        loginTextField.layer.cornerRadius = 8
        passwordTextField.layer.borderWidth = 0.8
        passwordTextField.layer.borderColor = UIColor.white.cgColor
        passwordTextField.layer.cornerRadius = 8
        print(self.view.frame.size.width)
        if(self.view.frame.size.width < 375){
            newUserButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 13)
        }
        
        
        var tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        self.view.addGestureRecognizer(tap)
        let defaults = UserDefaults.standard
        if((defaults.object(forKey: "login")) != nil){
            loginTextField.text = defaults.object(forKey: "login") as! String
        }
        let registerHomeModel = RegisterHomeModel()
        registerHomeModel.delegate = self
        registerHomeModel.downloadItems()
    }
    func itemsDownloaded(items: NSArray) {
        
        feedItems = items
        mainDictionary["users"] = items
    }
    
    @IBAction func logOn(_ sender: Any) {
        var i = 0
        while (i < feedItems.count){
            
            var t = feedItems[i] as! RegisterModel
            if((t.login == loginTextField.text)&&(t.password == passwordTextField.text)){
                
                let defaults = UserDefaults.standard
                defaults.set(t.login, forKey: "login")
                print(defaults.object(forKey: "login"))
                performSegue(withIdentifier: "showVC", sender: sender)
            }
            i+=1
        }
        let alert = UIAlertController(title: "Ошибка!", message: "Неправильная пара логин-пароль", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)


    }
    
    @IBAction func register(_ sender: Any) {
        if((!(loginTextField.text?.isEmpty)!)&&(!(passwordTextField.text?.isEmpty)!)){
            
          var bool = true
            var i = 0
            while (i < feedItems.count){
                
                var t = feedItems[i] as! RegisterModel
                if(t.login == loginTextField.text){
                    let alert = UIAlertController(title: "Ошибка!", message: "Такой логин занят.", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    bool = false
                    break
                }
                i+=1
            }
            
    if(bool){
        let myUrl = URL(string: "http://matan.s32.wh1.su/adduser.php");
        
        var request = URLRequest(url:myUrl!)
        
        request.httpMethod = "POST"// Compose a query string
        
        let postString = "Login="+loginTextField.text!+"&Password="+passwordTextField.text!;
        print(postString)
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
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
                    let loginValue = parseJSON["login"] as? String
                    print("loginValue: \(loginValue)")
                }
            } catch {
                print(error)
            }
        }
        task.resume()
        let defaults = UserDefaults.standard
        defaults.set(loginTextField.text, forKey: "login")
        print(defaults.object(forKey: "login"))
        performSegue(withIdentifier: "showVC", sender: sender)
            }
        }else{
            let alert = UIAlertController(title: "Ошибка!", message: "Поля для заполнения пусты.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }

        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func hideKeyboard(){
        
        self.view.endEditing(true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationNavigationController = segue.destination as! UINavigationController
        let targetController = destinationNavigationController.topViewController as! ViewController
        targetController.mainDictionary = mainDictionary
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
