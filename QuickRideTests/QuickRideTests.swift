//
//  QuickRideTests.swift
//  QuickRideTests
//
//  Created by Alex Lao on 3/5/17.
//  Copyright © 2017 Alex Lao. All rights reserved.
//

import XCTest
@testable import QuickRide

class QuickRideTests: XCTestCase {
    var vc: ViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name:"Main", bundle: NSBundle.mainBundle())
        vc = storyboard.instantiateInitialViewController() as! ViewController
        //Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        //Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //This is a test to verify the updateLabels method is working correctly
    func testTyped(){
        let _ = vc.view
        vc.updateLabels("Joe", cell:"1235557888", address: "12 Bean Drive")
        XCTAssert(vc.userCell.text=="1235557888")
        XCTAssert(vc.userName.text=="Joe")
        XCTAssert(vc.userAddress.text=="12 Bean Drive")
    }
    
    //These are unit tests to verify that the getRide/Drive is working correctly
    func testDriveFirst(){
        let _ = vc.view
        vc.updateLabels("Joe the First", cell:"1235557888", address: "12 Bean Drive")
        vc.getRide(self)
        vc.drive(self)
        XCTAssert(vc.userName.text=="Joe the First")
        
    }

    
    //These are Unit tests to verify that the Queue size is working correctly.
    func testInitial(){
        //Tests what the queue's size upon initialization
        let _ = vc.view
        XCTAssert(vc.line.text=="There are 0 rides needed")
    }
    func testAddOne(){
        //Tests that the queue has successfully added an item
        let _ = vc.view
        vc.updateLabels("Bob", cell: "1234567890", address: "65 Stenner")
        vc.getRide(self)
        XCTAssert(vc.line.text=="There are 1 rides needed")
    }
    
    func testLineHeavyAdd(){
        //Tests that the queue is correctly working while there is a lot of traffic on the app
        let _ = vc.view
        for index in 1...1000{
            vc.updateLabels("Bob" + String(index), cell: String(index), address: String(index) + " Street")
            vc.getRide(self)
        }
        XCTAssert(vc.line.text=="There are 1000 rides needed")
    }
    func testLineDrive(){
        //Tests that the queue is functioning correctly with many adds and removes.
        let _ = vc.view
        for index in 1...1000{
            vc.updateLabels("Bob" + String(index), cell: String(index), address: String(index) + " Street")
            vc.getRide(self)
        }
        for rides in 1...220{
            vc.drive(self)
        }
        XCTAssert(vc.line.text=="There are 780 rides needed")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
