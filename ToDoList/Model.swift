//
//  Model.swift
//  ToDoList
//
//  Created by David Mišmaš on 5. 10. 25.
//

import Foundation
import SwiftUI


enum TaskPriority: String, Identifiable, CaseIterable {
    case low, normal, urgent
    
    var id: Self { self }
 
    var title: String {
        switch self {
        case .low: return "Low"
        case .normal: return "Normal"
        case .urgent: return "Urgent"
        }
    }
    
    
}

func chooseColor(priority: TaskPriority) -> Color {
    switch priority {
    case .low: return .green
    case .normal: return .yellow
    case .urgent: return .red
    }
}

struct Task: Identifiable, Hashable {
    
    let id = UUID()
    var title: String
    var priority: TaskPriority
    
}

