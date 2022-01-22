//
//  CometAnimation.swift
//  SlidingCardExample
//
//  Created by Saurabh Srivastav on 19/01/22.
//

import UIKit

class CometAnimation: NSObject {
    
    public static func startAnimation(startPoint:CGPoint ,endPoint: CGPoint,lineColor:UIColor ,cometColor:UIColor , parentLayer:CALayer){
        let firstLayer = drawLine(startPoint: startPoint, endPoint: endPoint, lineColor: lineColor)
        parentLayer.addSublayer(firstLayer)
        
       
        
      var contents: Any? {
            let cometLayer = CAGradientLayer()
            cometLayer.colors = [cometColor.withAlphaComponent(1.0).cgColor, lineColor.cgColor]
            cometLayer.cornerRadius = 0.25
            cometLayer.frame = CGRect(x: 0, y: 0, width: 80, height: 0.5)
            cometLayer.locations = [0.0, 1.0]
            cometLayer.startPoint = CGPoint(x: 0, y: 0.5)
            cometLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
            
            UIGraphicsBeginImageContextWithOptions(cometLayer.bounds.size, cometLayer.isOpaque, 0.0)
            defer { UIGraphicsEndImageContext() }
            guard let context = UIGraphicsGetCurrentContext() else { return nil }
            cometLayer.render(in: context)
            return UIGraphicsGetImageFromCurrentImageContext()?
                .rotate(radians: calculateAngle(startPoint: startPoint, endPoint: endPoint))?
                .cgImage
        }
        
        
        
        
        
        let emitter = CAEmitterLayer()
        emitter.emitterShape = .point
        emitter.emitterPosition = startPoint
        
        // create comet cell
        let cell = CAEmitterCell()
        cell.contents = contents
        cell.birthRate = 0.2 * Float(Int.random(in: 500 ... 2000 )) / 1000
        cell.lifetime = 2.0
        cell.velocity = 600
        cell.velocityRange = 400
        cell.emissionLongitude = calculateAngle(startPoint: startPoint, endPoint: endPoint)
        
        // add cell to the emitter
        emitter.emitterCells = [cell]
        
        parentLayer.addSublayer(emitter)
        
    }
    
    
    public static func calculateAngle(startPoint:CGPoint ,endPoint: CGPoint) -> CGFloat {
        let deltaX = endPoint.x - startPoint.x
        let deltaY = endPoint.y - startPoint.y
        return atan2(deltaY, deltaX)
    }
    
    
    
    public static func drawLine(startPoint:CGPoint ,endPoint: CGPoint,lineColor:UIColor ) -> CAShapeLayer {
        // create the line as a CAShapeLayer
        
        let path = UIBezierPath()
        path.move(to: startPoint)
        path.addLine(to: endPoint)
        
        
        let lineLayer = CAShapeLayer()
        lineLayer.path = path.cgPath
        lineLayer.lineWidth = 0.5
        lineLayer.strokeColor = lineColor.cgColor
        return lineLayer
    }
    
//    public func animate(startPoint:CGPoint,endPoint: CGPoint) -> CAEmitterLayer {
//        let emitter = CAEmitterLayer()
//        emitter.emitterShape = .point
//        emitter.emitterPosition = startPoint
//        
//        // create comet cell
//        let cell = CAEmitterCell()
//        cell.contents = contents
//        cell.birthRate = 0.2 * Float(Int.random(in: 500 ... 2000 )) / 1000
//        cell.lifetime = 10.0
//        cell.velocity = 600
//        cell.velocityRange = 400
//       // cell.emissionLongitude = calculateAngle()
//        
//        // add cell to the emitter
//        emitter.emitterCells = [cell]
//        return emitter
//    }
    
//    private var contents: Any? {
//        let cometLayer = CAGradientLayer()
//       // cometLayer.colors = [cometColor.withAlphaComponent(0.0).cgColor, cometColor.cgColor]
//        cometLayer.cornerRadius = 0.25
//        cometLayer.frame = CGRect(x: 0, y: 0, width: 80, height: 0.5)
//        cometLayer.locations = [0.0, 1.0]
//        cometLayer.startPoint = CGPoint(x: 0, y: 0.5)
//        cometLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
//
//        UIGraphicsBeginImageContextWithOptions(cometLayer.bounds.size, cometLayer.isOpaque, 0.0)
//        defer { UIGraphicsEndImageContext() }
//        guard let context = UIGraphicsGetCurrentContext() else { return nil }
//        cometLayer.render(in: context)
//        return UIGraphicsGetImageFromCurrentImageContext()?
//            .rotate(radians: calculateAngle())?
//            .cgImage
//    }
//
//    public func calculateAngle(startPoint:CGPoint , endPoint:CGPoint) -> CGFloat {
//        let deltaX = endPoint.x - startPoint.x
//        let deltaY = endPoint.y - startPoint.y
//        return atan2(deltaY, deltaX)
//    }
}

extension UIImage {
    func rotate(radians: CGFloat) -> UIImage? {
        var newSize = CGRect(origin: .zero, size: size)
            .applying(CGAffineTransform(rotationAngle: CGFloat(radians)))
            .size
        // Trim off the extremely small float value to prevent core graphics from rounding it up
        newSize.width = floor(newSize.width)
        newSize.height = floor(newSize.height)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, scale)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        
        // Move origin to middle
        context.translateBy(x: newSize.width/2, y: newSize.height/2)
        // Rotate around middle
        context.rotate(by: CGFloat(radians))
        draw(in: CGRect(x: -size.width/2, y: -size.height/2, width: size.width, height: size.height))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}
