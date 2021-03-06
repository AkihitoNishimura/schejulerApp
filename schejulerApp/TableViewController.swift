//
//  TableViewController.swift
//  schejulerApp
//
//  Created by 西村映人 on 2020/09/18.
//  Copyright © 2020 西村映人. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var taskArray=[String]()
    var timeArray=[String]()
    var intervalArray=[String]()
    
    var taskDic=["task":[String](),"time":[String](),"interval":[String]()]
    
    override func viewWillAppear(_ animated: Bool) {
        
        //UserDefaultsがnilでなければ
        if UserDefaults.standard.object(forKey: "list") != nil{

            //現在UserDefaultsに保存された辞書の値をtaskDicに入れる
            taskDic=UserDefaults.standard.object(forKey: "list") as! Dictionary
            
            taskArray=taskDic["task"]! as [String]
            timeArray=taskDic["time"]! as [String]
            intervalArray=taskDic["interval"]! as [String]
            
        }
                tableView.reloadData()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 一時的に保存したデータを消す(テスト時のみ)
        UserDefaults.standard.removeObject(forKey: "list")
        
        //戻るボタンを隠す
        self.navigationItem.hidesBackButton = true
        
    }
    
    
    @IBAction func day_finishButton(_ sender: Any) {
        
        //指定した場所へ画面遷移
        //現画面から相対的な位置をnavigationController!.viewControllers[n]のnへ入力
        navigationController?.popToViewController(navigationController!.viewControllers[0], animated: true)
        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return taskArray.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)

        cell.textLabel?.text=taskArray[indexPath.row]
        
        cell.detailTextLabel?.text=timeArray[indexPath.row] +  intervalArray[indexPath.row]
        
        

        return cell
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
