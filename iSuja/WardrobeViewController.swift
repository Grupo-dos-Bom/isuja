//
//  Wardrobe.swift
//  iSuja
//
//  Created by Susin Matheus on 4/14/15.
//  Copyright (c) 2015 Grupo dos Bom. All rights reserved.
//

import UIKit

class WardrobeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //============================================Table view methods
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataManager.cleanClothes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:WardrobeCell = self.tableView.dequeueReusableCellWithIdentifier("wardrobe") as! WardrobeCell
        
        var currentCloth: Cloth = dataManager.getCleanCloth(indexPath.row)
        cell.setCloth(currentCloth)
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //println("Clicou em: #\(self.data[indexPath.row])!")
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            dataManager.putInLaundry(indexPath.row)
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String! {
        return "Laundry"
    }
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.Delete
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
         tableView.reloadData()
        
    }
    
    @IBAction func editTable(sender: UIButton) {
        if(sender.titleLabel!.text == "Remove") {
            sender.setTitle("Done", forState: UIControlState.Normal)
            tableView.setEditing(true, animated: true)
        }
        else {
            sender.setTitle("Remove", forState: UIControlState.Normal)
            tableView.setEditing(false, animated: true)
        }
        tableView.reloadData()
    }
    
    //============================================
    
   
 
    
    
    
    let dataManager = DataManager.sharedInstance
    override func viewDidLoad() {
        super.viewDidLoad()
        dataManager.addCloth("camisa roxa", image: "camisa.png", type: Cloth.clothType.shirt, color: UIColor.purpleColor())
        dataManager.addCloth("meia verde", image: "meia.png", type: Cloth.clothType.shirt, color: UIColor.greenColor())
        dataManager.addCloth("calca azul", image: "calca.png", type: Cloth.clothType.shirt, color: UIColor.blueColor())
        let newCloth = Cloth (name: "suja",image: "calca.png",type: Cloth.clothType.shirt, color: UIColor.blackColor())
        dataManager.dirtyClothes.append(newCloth)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

