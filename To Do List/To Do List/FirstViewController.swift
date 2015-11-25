//
//  FirstViewController.swift
//  To Do List
//
//  Created by SIVAGURUNATHAN.V on 18/09/15.
//  Copyright (c) 2015 countFingers. All rights reserved.
//

import UIKit

var todoListArray = [String]()

class FirstViewController: UIViewController,UITableViewDelegate{

    @IBOutlet var tableForToDoList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if NSUserDefaults.standardUserDefaults().objectForKey("todoListArray") != nil {
        
            todoListArray = NSUserDefaults.standardUserDefaults().objectForKey("todoListArray") as! [String]
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return todoListArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
    
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        cell.textLabel?.text = todoListArray[indexPath.row]
        return cell
    }
    
    override func viewDidAppear(animated: Bool) {
        tableForToDoList.reloadData()
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if editingStyle == UITableViewCellEditingStyle.Delete{
                todoListArray.removeAtIndex(indexPath.row)
                NSUserDefaults.standardUserDefaults().setObject(todoListArray, forKey: "todoListArray")
                tableForToDoList.reloadData()
        }
    }


}

