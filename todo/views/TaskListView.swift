//
//  TaskListView.swift
//  todo
//
//  Created by USER on 2024/12/14.
//

import SwiftUI

// タスクモデル
struct Task: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted: Bool
}

// タスク一覧画面
struct TaskListView: View {
    @State private var tasks: [Task] = [
        Task(title: "買い物リストを作成", isCompleted: false),
        Task(title: "レポートを提出", isCompleted: true),
        Task(title: "運動する", isCompleted: false)
    ]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($tasks) { $task in
                    HStack {
                        // タスクの完了状態をトグル
                        Button(action: {
                            task.isCompleted.toggle()
                        }) {
                            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(task.isCompleted ? .green : .gray)
                        }
                        .buttonStyle(BorderlessButtonStyle())
                        
                        // タスクタイトル
                        Text(task.title)
                            .strikethrough(task.isCompleted, color: .gray)
                            .foregroundColor(task.isCompleted ? .gray : .primary)
                    }
                }
                .onDelete(perform: deleteTask)
            }
            .navigationTitle("タスク一覧")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: addTask) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
    
    // タスク削除
    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
    
    // 新しいタスクを追加
    func addTask() {
        tasks.append(Task(title: "新しいタスク", isCompleted: false))
    }
}

#Preview {
    TaskListView()
}
