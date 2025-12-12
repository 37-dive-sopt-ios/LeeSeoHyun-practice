//
//  GridExample.swift
//  Sopt_practice_SwiftUI
//
//  Created by 이서현 on 11/29/25.
//

import SwiftUI

struct GridExample: View {
    var body: some View {
//        VStack {
//            HStack {
//                Text("A")
//                Text("B")
//            }
//            HStack {
//                Text("C")
//                Text("D")
//            }
//        }
        
        Grid(horizontalSpacing: 1, verticalSpacing: 1) {
            GridRow {
                Text("Row 1")
                    .frame(width: 100) // 이렇게 간격을 조절할 수 있다..!!ㄷㄷ
                ForEach(0..<2) { _ in
                    Color.red
                        .frame(width: 40, height: 40)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                }
            }
            GridRow {
                Text("Row 2")
                ForEach(0..<5) { _ in
                    Color.green
                        .frame(width: 40, height: 40)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                }
            }
            GridRow {
                Text("Row 3")
                ForEach(0..<4) { _ in
                    Color.blue
                        .frame(width: 40, height: 40)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                }
            }
        }
    }
}

#Preview {
    GridExample()
}
