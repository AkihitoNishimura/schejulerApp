//
//  addViewController.swift
//  schejulerApp
//
//  Created by 西村映人 on 2020/09/18.
//  Copyright © 2020 西村映人. All rights reserved.
//

import UIKit

class addViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource{
    
    let intervalPicker=UIPickerView()
    let timePicker=UIDatePicker()
    
    let intervalDate : [Int] = Array(1...30)
    
    var taskArray=[String]()
    var timeArray=[String]()
    var intervalArray=[String]()
    
    var taskDic=["task":[String](),"time":[String](),"interval":[String]()]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        intervalPicker.delegate=self
        
        maketimePicker()
        editToolbar()
        
        //入力時のキーボード置き換え
        timeTextField.inputView=timePicker
        intervalTextField.inputView=intervalPicker
        
        //textfield初期値
        dateChange()
        intervalTextField.text=String(intervalDate[intervalPicker.selectedRow(inComponent: 0)])+"日"

        
        if UserDefaults.standard.object(forKey: "list") != nil{
            
            taskDic=UserDefaults.standard.object(forKey: "list") as! Dictionary
            
            taskArray=taskDic["task"]! as [String]
            timeArray=taskDic["time"]! as [String]
            intervalArray=taskDic["interval"]! as [String]
            
        }
        
    }
    
    @IBOutlet weak var addTextField: UITextField!
    
    @IBOutlet weak var timeTextField: UITextField!
    
    @IBOutlet weak var intervalTextField: UITextField!
    
    @IBAction func addButton(_ sender: Any) {
        
        taskArray.append(addTextField.text!)
        timeArray.append(timeTextField.text!)
        intervalArray.append(intervalTextField.text!)
        
        taskDic.updateValue(taskArray, forKey: "task")
        taskDic.updateValue(timeArray, forKey: "time")
        taskDic.updateValue(intervalArray, forKey: "interval")
        
        UserDefaults.standard.set(taskDic, forKey: "list")
                
        //戻る
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
     private func editToolbar(){
         // ツールバー生成 サイズはsizeToFitメソッドで自動で調整される。
         let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
         //サイズの自動調整。敢えて手動で実装したい場合はCGRectに記述してsizeToFitは呼び出さない。
         toolBar.sizeToFit()
         // 左側のBarButtonItemはflexibleSpace。これがないと右に寄らない。
         let spacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
         // Doneボタン
         let commitButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(commitButtonTapped))
         // BarButtonItemの配置
         toolBar.items = [spacer, commitButton]
         // textViewのキーボードにツールバーを設定
         timeTextField.inputAccessoryView = toolBar
         intervalTextField.inputAccessoryView = toolBar
     }
     
     private func maketimePicker(){
         //UIdatepickerのモードをtimeへ
         timePicker.datePickerMode=UIDatePicker.Mode.countDownTimer
         timePicker.timeZone=NSTimeZone.local
         //時間をJapanese(24時間表記)に変更
         timePicker.locale=Locale.init(identifier:"Japanese")
         //選択している値が変わるたびにdateChangeという関数を呼ぶ
         timePicker.addTarget(self, action: #selector(dateChange), for: .valueChanged)
         //最小単位（分）を設定
         timePicker.minuteInterval=10
     }
       
    @objc func commitButtonTapped() {
        self.view.endEditing(true)
    }
    
    @objc func dateChange(){
        let formatter = DateFormatter()
        formatter.dateFormat = "hh時:mm分"
        timeTextField.text = "\(formatter.string(from: timePicker.date))"
    }
    

    // UIPickerViewの列の数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // UIPickerViewの行数、要素の全数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return intervalDate.count
    }
    
    // UIPickerViewに表示する配列
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        
        return String(intervalDate[row])+"日"
    }
    
    // ドラムロールにて選択した値をtextViewに設定します
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        intervalTextField.text = String(intervalDate[row])+"日"
    
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
