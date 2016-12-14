//
//  SecondViewController.swift
//  ToDoList
//
//  Created by Tomas-William Haffenden on 14/12/16.
//  Copyright © 2016 PomHaffs. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var buttonStyle: UIButton!
    
    @IBOutlet weak var newItem: UITextField!
    
    @IBAction func addItemPressed(_ sender: Any) {
        
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        
        //set up empty array that can be changed
        var items:NSMutableArray
        
        if let tempItems = itemsObject as? NSMutableArray {
            
            items = tempItems
            
            items.adding(from: [newItem.text!])
            
        } else {
            
            items = [newItem.text!]
        
        }
        
        UserDefaults.standard.set(items, forKey: "items")
        
        newItem.text = ""
        
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

