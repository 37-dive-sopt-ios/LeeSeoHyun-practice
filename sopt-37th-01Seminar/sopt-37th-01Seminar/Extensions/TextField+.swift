//
//  TextField+.swift
//  sopt-37th-01Seminar
//
//  Created by 이서현 on 10/16/25.
//


import UIKit

extension UITextField {
    func addLeftPadding(_ width: CGFloat = 10) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
    
    func addRightPadding(_ width: CGFloat = 10) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: self.frame.height))
        self.rightView = paddingView
        self.rightViewMode = ViewMode.unlessEditing // 텍스트 입력하는 동안 clearButton 보이게 하기 위해
    }
}
