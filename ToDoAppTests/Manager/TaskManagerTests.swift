//
//  TaskManagerTests.swift
//  ToDoAppTests
//
//  Created by Max Pavlov on 4.03.22.
//

import XCTest
@testable import ToDoApp

class TaskManagerTests: XCTestCase {

    var sut: TaskManager!
    
    override func setUpWithError() throws {
        sut = TaskManager()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func tastInitTaskManagerWithZeroTasks() {
        
        XCTAssertEqual(sut.tasksCount, 0)
    }
    
    func tastInitTaskManagerWithZeroDoneTasks() {
        XCTAssertEqual(sut.doneTasksCount, 0)
    }
    
    func testAddTaskIncrementTasksCount() {
        let task = Task(title: "Foo")
        sut.add(task: task)
        
        XCTAssertEqual(sut.tasksCount, 1)
    }
    
    func testTaskAtIndexIsAddedTask() {
        let task = Task(title: "Foo")
        sut.add(task: task)
        
        let returnedTask = sut.task(at: 0)
        
        XCTAssertEqual(task.title, returnedTask.title)
    }

}
