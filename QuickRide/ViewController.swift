//
//  ViewController.swift
//  QuickRide
//
//  Created by Alex Lao on 3/5/17.
//  Copyright © 2017 Alex Lao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        updateSize()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var userName: UITextField!
    @IBOutlet var userCell: UITextField!
    @IBOutlet var userAddress: UITextField!
    @IBOutlet var line: UILabel!
    let q = Queue()
    
    func updateLabels(name: String, cell: String, address: String){
        userName.text = name
        userCell.text = cell
        userAddress.text = address
    }
    
    func updateSize(){
        line.text = "There are " + String(q.length()) + " rides needed"
    }
    func clearLabels(){
        userName.text = nil
        userAddress.text = nil
        userCell.text = nil
    }
    
    @IBAction func drive(sender: AnyObject) {
        var drive = q.remove()
        userName.text = drive.Name
        userCell.text = drive.cellNumber
        userAddress.text = drive.location
        updateSize()
    }
    
    @IBAction func getRide(sender: AnyObject) {
        var reqRide = Person(name: userName.text!, cellNumber: userCell.text!, location: userAddress.text!)
        q.add(reqRide)
        updateSize()
        clearLabels()
        //updateLabels("Bob", cell: "123123123", address: "65 stenner")
    }
    
}
