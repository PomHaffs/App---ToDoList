//
//  FirstViewController.swift
//  ToDoList
//
//  Created by Tomas-William Haffenden on 14/12/16.
//  Copyright © 2016 PomHaffs. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    var items:[String] = []

    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return items.count
        
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    //called everytime to return to a view
    override func viewDidAppear(_ animated: Bool) {
        
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        
        if let tempItems = itemsObject as? [String] {
            
            items = tempItems
            
        }
        
        table.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            
            items.remove(at: (indexPath.row))
            
            table.reloadData()
            
            UserDefaults.standard.set(items, forKey: "items")
        }
        
    }

    
//    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        if editingStyle == UITableViewCellEditingStyle.Delete {
//            numbers.removeAtIndex(indexPath.row)
//            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
//        }
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

