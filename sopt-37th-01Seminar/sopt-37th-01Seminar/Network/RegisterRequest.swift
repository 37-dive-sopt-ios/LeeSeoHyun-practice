//
//  RegisterRequest.swift
//  sopt-37th-01Seminar
//
//  Created by 이서현 on 11/8/25.
//


/// 유저 등록 API
struct RegisterRequest: Encodable { ///request ; 요청하는 애니까 인코딩하는 애다! 그래서 codable 안 하고 그냥 Encodable
    let username: String
		let password: String
		let name: String
		let email: String
		let age: Int
}
