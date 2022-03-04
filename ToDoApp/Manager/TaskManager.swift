//
//  TaskManager.swift
//  ToDoApp
//
//  Created by Max Pavlov on 4.03.22.
//

import Foundation

class TaskManager {
    var tasksCount = 0
    let doneTasksCount = 0
    
    func add(task: Task) {
        tasksCount += 1
    }
    
    func task(at index: Int) -> Task {
        return Task(title: "")
    }
}
