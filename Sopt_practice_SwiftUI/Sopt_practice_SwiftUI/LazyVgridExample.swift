//
//  LazyVgridExample.swift
//  Sopt_practice_SwiftUI
//
//  Created by 이서현 on 11/29/25.
//

import SwiftUI

struct LazyVgridExample: View {
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(0x1f600...0x1f679, id: \.self) { value in
                    Text(String(format: "%x", value))
                                        //Text(emoji(value))
                                            .font(.largeTitle)
                    
                }
            }
        }
    }
}

#Preview {
    LazyVgridExample()
}
