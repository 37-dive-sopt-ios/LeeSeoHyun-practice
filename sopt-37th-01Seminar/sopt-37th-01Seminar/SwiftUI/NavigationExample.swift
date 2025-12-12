//
//  NavigationExample.swift
//  sopt-37th-01Seminar
//
//  Created by 이서현 on 11/29/25.
//

import SwiftUI

struct NavigationExample: View {
    var body: some View {
        NavigationStack {
            Section("섹션") {
                List {
                    NavigationLink {
                        DetailView()
                    } label: {
                        Label("Work Folder", systemImage: "folder")
                    }
                    NavigationLink("Teal") {
                        ColorDetail(color: .teal)
                    }
                }
            }
        }
    }
}

struct DetailView: View {
    var body: some View {
        Text("detailView")
    }
}

struct ColorDetail: View {
    var color: Color

    var body: some View {
        color.navigationTitle(color.description)
    }
}


#Preview {
    NavigationExample()
}
