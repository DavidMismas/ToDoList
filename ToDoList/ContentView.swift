//
//  ContentView.swift
//  ToDoList
//
//  Created by David Mišmaš on 5. 10. 25.
//

import SwiftUI

struct ContentView: View {
    
   
    
    @State private var showAddTask: Bool = false
    @State private var tasks: [Task] = [
        
    ]
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Button {
                        showAddTask = true
                    } label: {
                        Text("+")
                            .font(.system(size: 30, weight: .bold))
                            .padding(.horizontal, 15)
                            .foregroundStyle(Color.black)
                    }
                }
                
                Text("Tasks To Do")
                    .font(Font.largeTitle.bold())
                    .padding()
                
                List {
                    ForEach(tasks) { task in
                        TaskView(tasks: task)
                    }
                    .onDelete(perform: delete)
                }
                
                Spacer()
            }
        }
        
       
        
        .sheet(isPresented: $showAddTask) {
            AddTaskView(showAddTaskView: $showAddTask, tasks: $tasks)
        }
        
       
    }
    private func delete(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
   
}

#Preview {
    ContentView()
}
