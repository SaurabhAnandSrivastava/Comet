//
//  SplashScreen.swift
//  CometAction
//
//  Created by Saurabh Srivastav on 22/01/22.
//

import UIKit

class SplashScreen: UIViewController {
    @IBOutlet weak var earthImageView: UIImageView!
    var images: [UIImage] = []
   
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let width = view.bounds.width
        let height = view.bounds.height
        CometAnimation.startAnimation(startPoint: CGPoint(x: 100, y: 0),
                                      endPoint: CGPoint(x: 0, y: 100),
                                      lineColor: UIColor.white.withAlphaComponent(0.2),
                                      cometColor: UIColor.white , parentLayer: view.layer)
        
        CometAnimation.startAnimation(startPoint: CGPoint(x: 0.4 * width, y: 0),
                                      endPoint: CGPoint(x: width, y: 0.8 * width),
                                      lineColor: UIColor.white.withAlphaComponent(0.2),
                                      cometColor: UIColor.white, parentLayer: view.layer)
        
        CometAnimation.startAnimation(startPoint: CGPoint(x: 0.8 * width, y: 0),
                                       endPoint: CGPoint(x: width, y: 0.2 * width),
                                       lineColor: UIColor.white.withAlphaComponent(0.2),
                                       cometColor: UIColor.white, parentLayer: view.layer)
        
        CometAnimation.startAnimation(startPoint: CGPoint(x: width, y: 0.2 * height),
                                      endPoint: CGPoint(x: 0, y: 0.25 * height),
                                      lineColor: UIColor.white.withAlphaComponent(0.2),
                                      cometColor: UIColor.white, parentLayer: view.layer)
        
        CometAnimation.startAnimation (startPoint: CGPoint(x: 0, y: height - 0.8 * width),
                                       endPoint: CGPoint(x: 0.6 * width, y: height),
                                       lineColor: UIColor.white.withAlphaComponent(0.2),
                                       cometColor: UIColor.white, parentLayer: view.layer)
        
        CometAnimation.startAnimation (startPoint: CGPoint(x: width - 100, y: height),
                                       endPoint: CGPoint(x: width, y: height - 100),
                                       lineColor: UIColor.white.withAlphaComponent(0.2),
                                       cometColor: UIColor.white, parentLayer: view.layer)
        
        CometAnimation.startAnimation (startPoint: CGPoint(x: 0, y: 0.8 * height),
                                       endPoint: CGPoint(x: width, y: 0.75 * height),
                                       lineColor: UIColor.white.withAlphaComponent(0.2),
                                       cometColor: UIColor.white, parentLayer: view.layer)
        
   
        for i in 0...23 {
            //let img = UIImage(named: "earth-\(i)")!
            images.append(UIImage(named: "earth-\(i)")!)
        }
    
        earthImageView.animate(images: images, index: 0, completionHandler: nil)
        
    }




}

extension UIImageView {

    func animate(images: [UIImage], index: Int = 0, completionHandler: (() -> Void)?) {

        UIView.transition(with: self, duration: 0.15, options: .transitionCrossDissolve, animations: {
            self.image = images[index]

        }, completion: { value in
            let idx = index == images.count-1 ? 0 : index+1

          
                self.animate(images: images, index: idx, completionHandler: completionHandler)
           

        })
    }

}
