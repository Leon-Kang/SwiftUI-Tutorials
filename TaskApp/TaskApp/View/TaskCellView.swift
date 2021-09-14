//
//  TaskCellView.swift
//  TaskApp
//
//  Created by leon on 2021/9/13.
//

import SwiftUI
import CoreData

struct TaskCellView: View {
    
    @ObservedObject var homeData: HomeViewModel
    @ObservedObject var task: Task
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8, content: {
            Text(task.content ?? "")
                .font(.title3)
                .fontWeight(.bold)
            
            Text(task.date ?? Date(), style: .date)
                .fontWeight(.semibold)
        })
        .foregroundColor(.black)
        .contextMenu(ContextMenu(menuItems: {
            TaskCellMenu(homeData: homeData, task: task)
        }))
        Divider()
    }
}

