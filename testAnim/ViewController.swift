import UIKit

class ViewController: UIViewController {

private var btn: UIButton = UIButton()

override func viewDidLoad() {
    super.viewDidLoad()

    //Use CATransaction
    CATransaction.begin()

    //Set Layer
    let layer = CAShapeLayer()
    layer.lineWidth = 3
    layer.strokeColor = UIColor.red.cgColor
    layer.fillColor = UIColor.black.cgColor

    //Set Bezier Path
    let bezierPath = UIBezierPath()
    bezierPath.move(to: CGPoint(x: 38.5, y: 88.5))
    bezierPath.addCurve(to: CGPoint(x: 86.5, y: 88.5), controlPoint1: CGPoint(x: 41.5, y: 88.5), controlPoint2: CGPoint(x: 86.5, y: 88.5))
    bezierPath.addLine(to: CGPoint(x: 86.5, y: 64.5))
    bezierPath.addLine(to: CGPoint(x: 145.5, y: 64.5))

    //Set Animation
     let animation = CABasicAnimation(keyPath: "strokeEnd")
    animation.fromValue = 0.0
    animation.toValue = 1
    animation.duration = 7.0 // seconds

  //Completion Block
    CATransaction.setCompletionBlock{
        print("Animation completed")
    }

    //Add path and animation
    layer.path = bezierPath.cgPath
    layer.add(animation, forKey: "Line")
    CATransaction.commit()

    self.view.layer.addSublayer(layer)
 }
}
