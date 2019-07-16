//
//  SwiftModel.swift
//  OCToSwiftDemo
//
//  Created by eastzhou on 2019/7/16.
//

import Foundation
@objcMembers class SwiftModel: NSObject {
    var name = ""
    var title = "title"
    
}


@objcMembers open class SecondViewController: UIViewController {
    lazy var model = SwiftModel()
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        let vc = FirstViewController()
    }
}
