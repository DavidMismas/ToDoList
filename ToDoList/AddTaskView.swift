//
//  AddTaskView.swift
//  ToDoList
//
//  Created by David Mišmaš on 6. 10. 25.
//

import SwiftUI

struct AddTaskView: View {
    
    @State private var title: String = ""
    @State private var selectedPriority: TaskPriority = .normal
    
    @Binding var showAddTaskView: Bool
    @Environment(\.dismiss) var dismiss
    @Binding var tasks: [Task]
    
    var body: some View {
        VStack {
            Text("Add Task")
                .font(.title2.bold())
                .padding(.vertical, 20)
            
            TextField("Add Task", text: $title)
                .padding(10)
                .border(Color.gray)
                .padding(.horizontal)
                .padding(.vertical, 10)
            
            Picker("Priority", selection: $selectedPriority) {
                ForEach(TaskPriority.allCases) { taskPriority in
                    Text(taskPriority.title)
                        .tag(taskPriority)
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            .padding(.vertical, 15)
            
            Button {
                let trimmed = title.trimmingCharacters(in: .whitespacesAndNewlines)
                guard !trimmed.isEmpty else { return }
                tasks.append(Task(title: trimmed, priority: selectedPriority))
                title = ""
                dismiss()
            } label: {
                Text("Add Task")
                    .padding()
                    .padding(.horizontal, 50)
                    .background(Color.blue)
                    .clipShape(Capsule())
                    .foregroundColor(.white)
                    .padding(.vertical, 30)
            }

            Spacer()
            
            Button {
                dismiss()
            } label: {
                Text("Cancel")
            }
        }
    }
}

#Preview {
    AddTaskView(showAddTaskView: .constant(true), tasks: .constant([]))
}
