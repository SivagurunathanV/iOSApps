//
//  TableViewController.swift
//  ParseStarterProject-Swift
//
//  Created by SIVAGURUNATHAN.V on 13/11/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit
import Parse

class TableViewController: UITableViewController {
    
    var userName = [""]
    var userIds = [""]
    var isFollowing = ["":false]
    
    var refresher:UIRefreshControl!
    
    
    func refresh(){
        
        var query = PFUser.query()
        query?.findObjectsInBackgroundWithBlock({ (objects, error) -> Void in
            
            if let users = objects {
                
                self.userName.removeAll(keepCapacity: true)
                self.userIds.removeAll(keepCapacity: true)
                self.isFollowing.removeAll(keepCapacity: true)
                
                for object in users{
                    
                    if let user = object as? PFUser{
                        
                        if user.objectId! != PFUser.currentUser()?.objectId{
                            self.userName.append(user.username!)
                            self.userIds.append(user.objectId!)
                            
                            var query = PFQuery(className: "Followers")
                            
                            println(PFUser.currentUser()?.objectId)
                            
                            query.whereKey("follower", equalTo: PFUser.currentUser()!.objectId!)
                            query.whereKey("following", equalTo: user.objectId!)
                            
                            query.findObjectsInBackgroundWithBlock({ (objects, error) -> Void in
                                
                                if let objects = objects {
                                    
                                    if objects.count > 0 {
                                        
                                        self.isFollowing[user.objectId!] = true
                                        
                                    } else {
                                        
                                        self.isFollowing[user.objectId!] = false
                                        
                                    }
                                }
                                
                                if self.isFollowing.count == self.userName.count {
                                    
                                    self.tableView.reloadData()
                                    self.refresher.endRefreshing()
                                    
                                }
                                
                                
                            })
                            
                            
                        }
                    }
                }
                
            }
        })

      
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        refresher = UIRefreshControl()
        refresher.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refresher.addTarget(self, action: "refresh", forControlEvents: UIControlEvents.ValueChanged)
        tableView.addSubview(refresher)
        refresh()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return userName.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell

       cell.textLabel?.text = userName[indexPath.row]
        
        let followedObjectId = userIds[indexPath.row]
        
        if isFollowing[followedObjectId] == true {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        }

        return cell
    }


    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var cell:UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        
        let followedObjectId = userIds[indexPath.row]
        
        if isFollowing[followedObjectId] == false {
        
            isFollowing[followedObjectId] = true
            
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        
            var followerObject  = PFObject(className: "Followers")
        
            followerObject.setValue(userIds[indexPath.row], forKey: "following")
        
            followerObject.setValue(PFUser.currentUser()?.objectId, forKey: "follower")
        
            followerObject.saveInBackgroundWithBlock({ (flag, error) -> Void in
                
                println(PFUser.currentUser()?.objectId)
                println(self.userIds[indexPath.row])
                println(self.userIds)
            })
        
        }
        else{
            
            
            isFollowing[followedObjectId] = false
            
            cell.accessoryType = UITableViewCellAccessoryType.None
            
            var query = PFQuery(className: "Followers")
            
            query.whereKey("follower", equalTo: PFUser.currentUser()!.objectId!)
            
            query.whereKey("following", equalTo: userIds[indexPath.row])
            
            
            query.findObjectsInBackgroundWithBlock({ (objects, error) -> Void in
                
                if let objects = objects {
                    
                    for object in objects {
                        
                        object.deleteInBackground()
                        
                    }
                }
                
                
            })

            
            
        }
        
        
    }
}
