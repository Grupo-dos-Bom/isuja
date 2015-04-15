//
//  SecondViewController.swift
//  iSuja
//
//  Created by Susin Matheus on 4/14/15.
//  Copyright (c) 2015 Grupo dos Bom. All rights reserved.
//

import UIKit

class LaundryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var allSwitcher: UIButton!
    @IBOutlet var cestoTable: UITableView!
    var dataManager = DataManager.sharedInstance
    var allOn:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var dataManager = DataManager.sharedInstance
        allOn = false
    }

    @IBAction func markAll(sender: AnyObject) {
        let dirtyElements = dataManager.dirtyClothes.count
        if (allOn == false) {
            for i in 0..<dirtyElements {
                var path = NSIndexPath.init(forRow: i, inSection: 0)
                var cell = cestoTable.cellForRowAtIndexPath(path)
                var willLavar:UISwitch = cell!.viewWithTag(202) as! UISwitch
                willLavar.setOn(true, animated:true)
            }
            allOn = true
            allSwitcher.setTitle("Desmarcar todos", forState: UIControlState.Normal)
        } else {
            for i in 0..<dirtyElements {
                var path = NSIndexPath.init(forRow: i, inSection: 0)
                var cell = cestoTable.cellForRowAtIndexPath(path)
                var willLavar:UISwitch = cell!.viewWithTag(202) as! UISwitch
                willLavar.setOn(false, animated:true)
            }
            allOn = false
            allSwitcher.setTitle("Marcar todos", forState: UIControlState.Normal)
        }
    }
    
    @IBAction func switchChanged(sender: AnyObject) {
        let s:UISwitch = sender as! UISwitch
        if (s.on == false) {
            allOn = false
            allSwitcher.setTitle("Marcar todos", forState: UIControlState.Normal)
        }
        let dirtyElements = dataManager.dirtyClothes.count
        var flagAllOn = true
        for i in 0..<dirtyElements {
            var path = NSIndexPath.init(forRow: i, inSection: 0)
            var cell = cestoTable.cellForRowAtIndexPath(path)
            var willLavar:UISwitch = cell!.viewWithTag(202) as! UISwitch
            if (willLavar.on == false) {
                flagAllOn = false
            }
        }
        if (flagAllOn) {
            allOn = true
            allSwitcher.setTitle("Desmarcar todos", forState: UIControlState.Normal)
        }
    }
    
    @IBAction func lavarButton(sender: AnyObject) {
        let dirtyElements = dataManager.dirtyClothes.count
        for i in 0..<dirtyElements {
            var path = NSIndexPath.init(forRow: i, inSection: 0)
            var cell = cestoTable.cellForRowAtIndexPath(path)
            var nome:UILabel = cell!.viewWithTag(201) as! UILabel
            var willLavar:UISwitch = cell!.viewWithTag(202) as! UISwitch
            if (willLavar.on) {
                dataManager.cleanClothes.append(nome.text!)
                dataManager.dirtyClothes.removeAtIndex(i)
                willLavar.setOn(false, animated:false)
            }
        }
        cestoTable.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        cestoTable.reloadData()
        let dirtyElements = dataManager.dirtyClothes.count
        var flagAllOn = true
        for i in 0..<dirtyElements {
            var path = NSIndexPath.init(forRow: i, inSection: 0)
            var cell = cestoTable.cellForRowAtIndexPath(path)
            var willLavar:UISwitch = cell!.viewWithTag(202) as! UISwitch
            if (willLavar.on == false) {
                flagAllOn = false
            }
        }
        if (flagAllOn) {
            allOn = true
            allSwitcher.setTitle("Desmarcar todos", forState: UIControlState.Normal)
        } else {
            allOn = false
            allSwitcher.setTitle("Marcar todos", forState: UIControlState.Normal)
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = cestoTable.dequeueReusableCellWithIdentifier("cestoCloth", forIndexPath: indexPath) as! UITableViewCell
        let row = indexPath.row
        var nome:UILabel = cell.viewWithTag(201) as! UILabel
        nome.text = dataManager.dirtyClothes[row]
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.dirtyClothes.count
    }

}