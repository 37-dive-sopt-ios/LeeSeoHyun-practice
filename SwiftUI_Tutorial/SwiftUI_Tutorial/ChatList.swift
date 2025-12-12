//
//  ChatList.swift
//  SwiftUI_Tutorial
//
//  Created by 이서현 on 11/22/25.
//


import SwiftUI

struct ChatList: View {
  let chatRooms: [ChatRoomModel]
  
  var body: some View {
    List(chatRooms) { chatroom in
      ChatRow(chatRoom: chatroom)
        .listRowInsets(EdgeInsets())
        .listRowSeparator(.visible)
    }
    .listStyle(.plain)
  }
}

#Preview {
  ChatList(chatRooms: ChatRoomModel.mockData)
}
