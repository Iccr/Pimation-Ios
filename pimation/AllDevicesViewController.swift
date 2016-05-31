//
//  AllDevicesViewController.swift
//  pimation
//
//  Created by shishir sapkota on 5/31/16.
//  Copyright © 2016 shishir sapkota. All rights reserved.
//

import UIKit

class AllDevicesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var devices = [("My room light", false), ("water pump", true)]
    @IBOutlet weak var tblView: UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return devices.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCellWithIdentifier("DeviceTableViewCell") as! DeviceTableViewCell
        cell.lblDeviceName.text = devices[indexPath.row].0
        cell.switchState.setOn(devices[indexPath.row].1, animated: false)
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
