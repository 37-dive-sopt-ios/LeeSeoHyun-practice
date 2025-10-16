//
//  Fonts+.swift
//  sopt-37th-01Seminar
//
//  Created by 이서현 on 10/16/25.
//

import Foundation
import UIKit

extension UIFont {
    
    /// 함수로 만들어서 사용하려 했는데 사이즈가 고정되어 있으니까 굳이 싶어서 수정..
    /*
     class func head1(ofSize size: CGFloat) -> UIFont {
     return UIFont(name: "Pretendard-ExtraBold", size: size)!
     }
     */
    class var head1: UIFont {
        return UIFont(name: "Pretendard-ExtraBold", size: 25)!
    }
    
    class var subhead1: UIFont {
        return UIFont(name: "Pretendard-Bold", size: 18)!
    }
    
    class var subhead2: UIFont {
        return UIFont(name: "Pretendard-Regular", size: 16)!
    }
    
    class var subhead3: UIFont {
        return UIFont(name: "Pretendard-Bold", size: 15)!
    }
    
    class var subhead4: UIFont {
        return UIFont(name: "Pretendard-SemiBold", size: 14)!
    }
    
    class var subhead5: UIFont {
        return UIFont(name: "Pretendard-Regular", size: 14)!
    }
    
    class var info12: UIFont {
        return UIFont(name: "Pretendard-Regular", size: 12)!
    }
    
}
