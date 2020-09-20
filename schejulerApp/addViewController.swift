//
//  addViewController.swift
//  schejulerApp
//
//  Created by 西村映人 on 2020/09/18.
//  Copyright © 2020 西村映人. All rights reserved.
//

import UIKit

class addViewController: UIViewController {
    
    var taskArray=[String]()
    var timeArray=[String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //入力時のキーボード置き換え
        timeTextField.inputView=timePicker
        

        if UserDefaults.standard.object(forKey: "add") != nil && UserDefaults.standard.object(forKey: "time") != nil{
                    
            taskArray = UserDefaults.standard.object(forKey: "add") as! [String]
            timeArray = UserDefaults.standard.object(forKey: "time") as! [String]
            
        }
        
    }
    
    //UIDatePickerをインスタンス化
       let timePicker: UIDatePicker = {
           let dp = UIDatePicker()
           //UIdatepickerのモードをtimeへ
           dp.datePickerMode = UIDatePicker.Mode.time
           dp.timeZone = NSTimeZone.local
           //時間をJapanese(24時間表記)に変更
           dp.locale = Locale.init(identifier: "Japanese")
          //選択している値が変わるたびにdateChangeという関数を呼ぶ
           dp.addTarget(self, action: #selector(dateChange), for: .valueChanged)
           //最小単位（分）を設定
           dp.minuteInterval = 10
           return dp
       }()
       
       @objc func dateChange(){
           let formatter = DateFormatter()
           formatter.dateFormat = "hh時:mm分"
           timeTextField.text = "\(formatter.string(from: timePicker.date))"
       }
    
    
    @IBOutlet weak var addTextField: UITextField!
    
    @IBOutlet weak var timeTextField: UITextField!
    
    @IBAction func addButton(_ sender: Any) {
        
        taskArray.append(addTextField.text!)
        timeArray.append(timeTextField.text!)
                
        //データ保存
        UserDefaults.standard.set(taskArray, forKey:"add")
        UserDefaults.standard.set(timeArray, forKey:"time")
                
        //戻る
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
