//
//  HomeViewModel.swift
//  TaskApp
//
//  Created by leon on 2021/9/13.
//

import Foundation
import CoreData

class HomeViewModel: ObservableObject {
    @Published var content = ""
    @Published var date = Date()
    
    @Published var isNewData = false
    
    @Published var updateItem: Task!
    
    let calendar = Calendar.current
    
    func checkDate() -> String {
        if calendar.isDateInToday(date) {
            return "Today"
        } else if calendar.isDateInTomorrow(date) {
            return "TMR"
        } else {
            return "Other Day"
        }
    }
    
    func updateDate(value: String) {
        if value == "Today" {
            date = Date()
        } else if value == "TMR" {
            date = calendar.date(byAdding: .day, value: 1, to: Date())!
        }
    }
    
    func writeDate(context: NSManagedObjectContext) {
        if updateItem != nil {
            updateItem.date = date
            updateItem.content = content
            
            try! context.save()
            
            updateItem = nil
            isNewData.toggle()
            content = ""
            date = Date()
            
            return
        }
        
        let newTask = Task(context: context)
        
        newTask.date = date
        newTask.content = content
        
        do {
            try context.save()
            isNewData.toggle()
            content = ""
            date = Date()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func editItem(item: Task) {
        updateItem = item
        date = item.date!
        content = item.content!
        
        isNewData.toggle()
    }
}
