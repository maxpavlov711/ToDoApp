//
//  NewTaskViewControllerTests.swift
//  ToDoAppTests
//
//  Created by Max Pavlov on 16.03.22.
//

import XCTest
@testable import ToDoApp

class NewTaskViewControllerTests: XCTestCase {
    
    var sut: NewTaskViewController!

    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: String(describing: NewTaskViewController.self)) as? NewTaskViewController
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testHasTitleTestField() {
        XCTAssertTrue(sut.titleTextField.isDescendant(of: sut.view))
    }
    
    //locationTextFeild
    //dateTextField
    //adressTextFeild
    //descrtiptionTextField
    // save / cancel

}
