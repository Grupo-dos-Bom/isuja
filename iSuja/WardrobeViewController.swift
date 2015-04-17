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
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject]? {
        
        let laundryAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Cesto", handler: { (action:UITableViewRowAction!,indexPath:NSIndexPath!) -> Void in
        self.dataManager.putInLaundry(indexPath.row)
        self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        })
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Excluir", handler: { (action:UITableViewRowAction!,indexPath:NSIndexPath!) -> Void in
            self.dataManager.removeCleanCloth(indexPath.row)
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        })
        laundryAction.backgroundColor = UIColor.blueColor()
        deleteAction.backgroundColor = UIColor.redColor()

        return [laundryAction,deleteAction]
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        //nothing
    }
    func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String! {
        return "Lavar"
    }
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.Delete
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
         tableView.reloadData()
        
    }
    
    
    
    //============================================
    
   
 
    
    
    
    let dataManager = DataManager.sharedInstance
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        /*dataManager.addCloth("meia verde", image: "meia.png", type: Cloth.clothType.shirt, color: UIColor.greenColor())
        dataManager.addCloth("calca azul", image: "calca.png", type: Cloth.clothType.shirt, color: UIColor.blueColor())
        let newCloth = Cloth (name: "suja",image: "calca.png",type: Cloth.clothType.shirt, color: UIColor.blackColor()) */
        //dataManager.dirtyClothes.append(newCloth)
        tableView.reloadData();

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

