//
//  addViewController.swift
//  schejulerApp
//
//  Created by 西村映人 on 2020/09/18.
//  Copyright © 2020 西村映人. All rights reserved.
//

import UIKit

class addViewController: UIViewController {
    
    var Array=[String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        if UserDefaults.standard.object(forKey: "add") != nil{
                    
        Array = UserDefaults.standard.object(forKey: "add") as! [String]
        }
        
    }
    
    
    @IBOutlet weak var addTextField: UITextField!
    
    @IBAction func addButton(_ sender: Any) {
        
        Array.append(addTextField.text!)
                
        //        データ保存
                UserDefaults.standard.set(Array, forKey:"add")
                
        //        戻る
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
