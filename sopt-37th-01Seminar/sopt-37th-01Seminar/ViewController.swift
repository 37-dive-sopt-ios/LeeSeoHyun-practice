//
//  ViewController.swift
//  sopt-37th-01Seminar
//
//  Created by 이서현 on 10/11/25.
//


import UIKit
 
class ViewController: UIViewController {
    private var redView: UIView = {
        var view = UIView(frame: CGRect(origin: CGPoint(x: 100, y: 200),
                                        size: CGSize(width: 100, height: 100)))
        ///frame 은 CGPoint(좌표), CGSize(크기)
        ///x,y, 너비, 높이가 있어야 뷰를 띄울 수 있음

        
        view.backgroundColor = .red
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(redView)
        print("frame: \(self.redView.frame)\nbounds: \(self.redView.bounds)")
    }
}



