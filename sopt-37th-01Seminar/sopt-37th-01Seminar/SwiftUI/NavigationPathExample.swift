//
//  NavigationPathExample.swift
//  sopt-37th-01Seminar
//
//  Created by 이서현 on 11/29/25.
//

import SwiftUI

struct NavigationPathExample: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack(spacing: 5) {
                Text("home")
                    .font(.largeTitle)
                Button("뷰 이동") {
                    path.append(1)
                }
            }
            .navigationDestination(for: Int.self) { step in
                StepView(step: step, path: $path)
                ///for에 데이터 전달 받아서 ㄱㄱ(identities 가 1인..)
                
            }
        }
        
    }
}

struct StepView: View {
    let step: Int
    @Binding var path: NavigationPath

    var body: some View {
        VStack(spacing: 20) {
            Text("\(step)단계")
                .font(.largeTitle)

            Button("다음으로") {
                path.append(step + 1)
            }

            Button("처음으로") {
                path = NavigationPath()
            }
        }
    }
}

#Preview {
    NavigationPathExample()
}
