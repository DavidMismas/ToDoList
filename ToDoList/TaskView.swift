//
//  TaskView.swift
//  ToDoList
//
//  Created by David Mišmaš on 5. 10. 25.
//

import SwiftUI

struct TaskView: View {
    
    @State private var isOn = false
    
    struct ChecboxStyle: ToggleStyle {
        func makeBody(configuration: Configuration) -> some View {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                    .onTapGesture {
                        configuration.isOn.toggle()
                    }
                configuration.label
            }
        }
    }
    
    let tasks: Task
    
    var body: some View {
        HStack {
            Toggle(isOn: $isOn) {
                Text(tasks.title)
            }
            .toggleStyle(ChecboxStyle())
            
            Spacer()
            
            Text(tasks.priority.title)
                .padding(.vertical, 5)
                .padding(.horizontal, 8)
                .background(chooseColor(priority: tasks.priority))
                .clipShape(Capsule())
        }
        .frame(height: 50)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    TaskView(tasks: Task(title: "Go for a walk", priority: .urgent))
}
