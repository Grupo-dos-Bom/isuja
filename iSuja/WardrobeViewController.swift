//
//  Wardrobe.swift
//  iSuja
//
//  Created by Susin Matheus on 4/14/15.
//  Copyright (c) 2015 Grupo dos Bom. All rights reserved.
//

import UIKit

class WardrobeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // Table view methods
    @IBOutlet weak var tableView: UITableView!
    var data: [String] = ["Camisa","Calça","Cueca"]
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:WardrobeCell = self.tableView.dequeueReusableCellWithIdentifier("wardrobe") as! WardrobeCell
        cell.imageCell.image = UIImage(named: "calca.png")      
        cell.nameLabel?.text = self.data[indexPath.row]
        cell.usedTimesLabel?.text = "1"
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("Clicou em: #\(self.data[indexPath.row])!")
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            self.data.removeAtIndex(indexPath.row)
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String! {
        return "Dirty"
    }
    //----------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.tableView.registerClass(WardrobeCell.self, forCellReuseIdentifier: "wardrobe")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

