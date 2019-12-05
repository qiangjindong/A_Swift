//
//  ViewController.swift
//  A_Swift
//
//  Created by QiangJindong on 2019/12/4.
//  Copyright © 2019 QiangJindong. All rights reserved.
//

import UIKit
import SwiftMessages

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
        let button = UIButton()
        button.setTitle("show", for: .normal)
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(self.buttonOnPressed(_:)), for: .touchUpInside)
        button.sizeToFit()
        button.center = .init(
            x: view.frame.width / 2,
            y: view.frame.height / 2
        )
            
        view.addSubview(button)
    }
    
    @objc func buttonOnPressed(_ button: UIButton) {
       
        // files in the main bundle first, so you can easily copy them into your project and make changes.
        let view = MessageView.viewFromNib(layout: .tabView)
        
        // Theme message elements with the warning style.
        view.configureTheme(.warning)
        
        // Add a drop shadow.
        view.configureDropShadow()
        
        // Set message title, body, and icon. Here, we're overriding the default warning
        // image with an emoji character.
        let iconText = ["🤔", "😳", "🙄", "😶"].randomElement()!
        view.configureContent(title: "Warning", body: "Consider yourself warned.", iconText: iconText)
        
        // Increase the external margin around the card. In general, the effect of this setting
        // depends on how the given layout is constrained to the layout margins.
        //        view.layoutMarginAdditions = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        view.layoutMarginAdditions = .zero
        
        // Reduce the corner radius (applicable to layouts featuring rounded corners).
        (view.backgroundView as? CornerRoundingView)?.cornerRadius = 10
        
        var config = SwiftMessages.Config()
        
        // Slide up from the bottom.
        config.presentationStyle = .top
        
        // Display in a window at the specified window level: UIWindow.Level.statusBar
        // displays over the status bar while UIWindow.Level.normal displays under.
        config.presentationContext = .window(windowLevel: .normal)
        
        // Disable the default auto-hiding behavior.
        config.duration = .automatic
        
        // Dim the background like a popover view. Hide when the background is tapped.
        config.dimMode = .gray(interactive: true)
        
        // Disable the interactive pan-to-hide gesture.
        config.interactiveHide = false
        
        // Specify a status bar style to if the message is displayed directly under the status bar.
        config.preferredStatusBarStyle = .lightContent
        
        // Specify one or more event listeners to respond to show and hide events.
        config.eventListeners.append() { event in
            if case .didHide = event { print("yep") }
        }
        
        SwiftMessages.show(config: config, view: view)
    }
}

