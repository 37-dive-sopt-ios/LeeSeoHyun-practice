//
//  ChatRow.swift
//  SwiftUI_Tutorial
//
//  Created by 이서현 on 11/22/25.
//

import SwiftUI

struct ChatRow: View {
  
  let chatRoom: ChatRoomModel
  
  var body: some View {
    HStack {
      ZStack {
        Circle()
          .frame(width: 40, height: 40)
          .foregroundStyle(.red)
          .opacity(0.5)
        if let image = chatRoom.profileImage {
          image
            .resizable()
            .frame(width: 40, height: 40)
        }
      }
      
      VStack(alignment: .leading) {
        HStack {
          Text(chatRoom.name)
            .font(.headline)
          Text(chatRoom.location)
            .font(.subheadline)
            .foregroundStyle(.gray)
        }
        Text(chatRoom.lastMessage)
          .font(.subheadline)
      }
      
      Spacer()
      if let thumbnail = chatRoom.thumbnail {
        thumbnail
          .resizable()
          .frame(width: 40, height: 40)
      }
    }
    .padding(16)
  }
}

#Preview {
  ChatRow(chatRoom: ChatRoomModel.mockData[0])
}
