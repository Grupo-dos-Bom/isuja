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
        return "Dirty"
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
         tableView.reloadData()
        
    }
    //============================================
    
    
    let dataManager = DataManager.sharedInstance
    override func viewDidLoad() {
        super.viewDidLoad()
        dataManager.addCloth("camisa restart", "calca.png", Cloth.clothType.shirt)
        dataManager.addCloth("cueca rosa", "calca.png", Cloth.clothType.shirt)
        dataManager.addCloth("calca azul", "calca.png", Cloth.clothType.shirt)
        let newCloth = Cloth (name: "suja",image: "calca.png",type: Cloth.clothType.shirt)
        dataManager.dirtyClothes.append(newCloth)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

