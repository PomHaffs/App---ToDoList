//
//  SecondViewController.swift
//  ToDoList
//
//  Created by Tomas-William Haffenden on 14/12/16.
//  Copyright © 2016 PomHaffs. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var buttonStyle: UIButton!
    
    @IBOutlet weak var newItem: UITextField!
    
    @IBAction func addItemPressed(_ sender: Any) {
        
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        
        var items: [String]
        
        //set up empty array that can be changed
        
        if let tempItems = itemsObject as? [String] {
         
            items = tempItems
            
            items.append(newItem.text!)
            
        } else {
            
            items = [newItem.text!]
        }
        
        UserDefaults.standard.set(items, forKey: "items")
        
        newItem.text = ""
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    self.view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonStyle.layer.cornerRadius = 10
        buttonStyle.layer.borderWidth = 1
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

