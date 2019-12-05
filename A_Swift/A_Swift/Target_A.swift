//
//  Target_A.swift
//  A_Swift
//
//  Created by QiangJindong on 2019/12/4.
//  Copyright © 2019 QiangJindong. All rights reserved.
//

import UIKit

class Target_A: NSObject {
    let name = "Target_A"
    @objc func Action_viewController(_ params:[AnyHashable: Any]?) -> UIViewController {
        if let params = params {
            let block = params["handler"]
            // 转换一下
            typealias CallbackType = @convention(block) () -> Void
            let blockPtr = UnsafeRawPointer(Unmanaged<AnyObject>.passUnretained(block as AnyObject).toOpaque())
            let callback = unsafeBitCast(blockPtr, to: CallbackType.self)
            callback()
        }
        let vc = ViewController()
        return vc;
    }
}
