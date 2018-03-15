//
//  ResultTableViewController.swift
//  Mathematical Analysis
//
//  Created by Андрей on 11.06.17.
//  Copyright © 2017 HSE. All rights reserved.
//

import UIKit

class ResultTableViewController: UITableViewController {
        var mainDictionary: Dictionary = [String: NSArray]()
        var activities: NSMutableArray = NSMutableArray()
        

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return activities.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "result", for: indexPath) as! ResultTableViewCell

        let item: UserActivityModel = activities[indexPath.row] as! UserActivityModel
        cell.dateTimeLabel.text = item.dateTimeInfo
        if(item.result == "1"){
            cell.resultImageView.image = UIImage(named: "checked")
            
        }else{
            cell.resultImageView.image = UIImage(named: "unchecked")
        }
        var i=0
        var m = TaskModel()
        var n = PointModel()
        while (i<mainDictionary["tasks"]!.count){
            
            let d = mainDictionary["tasks"]![i] as! TaskModel
            m = d
            if(d.id! as String == item.taskId){
                
                var j=0
                while (j<mainDictionary["points"]!.count){
                    
                    let q = mainDictionary["points"]![j] as! PointModel
                    n = q
                    if(q.id! as String == d.pointId! as String){
                        
                        cell.topicLabel.text = q.name
                        break
                    }
                    j+=1
                    
                }
                break
            }
            i+=1
            
        }
        var df = 0
        i=0
        while (i<mainDictionary["points"]!.count){
            
            let z = mainDictionary["points"]![i] as! PointModel
            
            if(z.id! as String == n.id){
                
                var j=0
                while (j<mainDictionary["tasks"]!.count){
                    
                    let r = mainDictionary["tasks"]![j] as! TaskModel
                    
                    if(r.pointId! as String == z.id! as String){
                        df = df + 1
                        if(r.id == m.id){
                            break
                        }
                       
                    }
                    j+=1
                    
                }
                break
            }
            i+=1
            
        }
        cell.taskLabel.text = "Задание №\(df)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var value = tableView.rowHeight
        

        return 100
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationItem.title = "Результаты"
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        self.view.backgroundColor = UIColor(red: 8.0/255.0, green: 142.0/255.0, blue: 166.0/255.0, alpha: 1.0)
        //        self.view.insertSubview(backView, belowSubview: self.tableView)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named:"square2"), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
