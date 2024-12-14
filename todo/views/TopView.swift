//
//  TopView.swift
//  todo
//
//  Created by USER on 2024/12/14.
//

import SwiftUI

struct TopView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("トップページ")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("ここからアプリの各機能にアクセスできます")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding()

                // タスクリストボタン
                NavigationLink(destination: TaskListView()) {
                    Text("タスク一覧")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal, 30)

                Spacer()
            }
            .padding()
        }
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
    }
}
