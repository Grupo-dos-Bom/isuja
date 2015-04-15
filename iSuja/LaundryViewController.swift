//
//  SecondViewController.swift
//  iSuja
//
//  Created by Susin Matheus on 4/14/15.
//  Copyright (c) 2015 Grupo dos Bom. All rights reserved.
//

import UIKit

class LaundryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var cestoTable: UITableView!
    
    var dataManager = DataManager.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataManager = DataManager.sharedInstance
    }

    @IBAction func lavarButton(sender: AnyObject) {
        let dirtyElements = dataManager.dirtyClothes.count
        for i in 0..<dirtyElements {
            var path = NSIndexPath.init(forRow: i, inSection: 0)
            var cell = cestoTable.cellForRowAtIndexPath(path)
            var nome:UILabel = cell!.viewWithTag(201) as! UILabel
            println(nome.text)
        }
        cestoTable.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        cestoTable.reloadData()
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
