//
//  ViewController.swift
//  CometAction
//
//  Created by Saurabh Srivastav on 22/01/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        CometAnimation.startAnimation(startPoint: CGPoint(x: 0, y: 50), endPoint: CGPoint(x: 200, y: 200), lineColor: .black, cometColor: .black, parentLayer: self.view.layer)
    }


}

