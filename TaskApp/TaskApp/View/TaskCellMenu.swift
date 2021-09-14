//
//  TaskCellMenu.swift
//  TaskApp
//
//  Created by leon on 2021/9/14.
//

import SwiftUI

struct TaskCellMenu: View {
    
    @ObservedObject var homeData: HomeViewModel
    @ObservedObject var task: Task
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        Button(action: {
            homeData.editItem(item: task)
        }, label: {
            Text("Edit")
        })
        Button(action: {
            context.delete(task)
            try! context.save()
        }, label: {
            Text("Delete")
        })
    }
}
