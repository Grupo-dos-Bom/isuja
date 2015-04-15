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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = cestoTable.dequeueReusableCellWithIdentifier("clothCesto", forIndexPath: indexPath) as! UITableViewCell
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.dirtyClothes.count
    }

}

