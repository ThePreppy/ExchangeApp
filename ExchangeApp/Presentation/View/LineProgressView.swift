//
//  LineProgressView.swift
//  ExchangeApp
//
//  Created by Alexander on 29.12.2022.
//

import UIKit

@IBDesignable
final class LineProgressView: EAView {
    
    class Model {
        let animationDuration: TimeInterval
        
        init(animationDuration: TimeInterval) {
            self.animationDuration = animationDuration
        }
    }
    
    //MARK: - Properties
    private lazy var progressBackroundLayer = {
        let result = CAShapeLayer()
        result.fillColor = nil
        result.strokeColor = AppTheme.grey.cgColor
        result.lineCap = .round
        result.lineJoin = .round
        result.strokeStart = 0
        result.strokeEnd = Constants.strokeEnd
        
        return result
    }()
    
    private lazy var progressLayer = {
        let result = CAShapeLayer()
        result.fillColor = nil
        result.strokeColor = AppTheme.primary.cgColor
        result.lineCap = .round
        result.lineJoin = .round
        result.strokeStart = 0
        result.strokeEnd = Constants.strokeEnd
        
        return result
    }()
    
    var model: Model?
    
    private var path: UIBezierPath {
        let path = UIBezierPath()
        let firstPoint = CGPoint(x: bounds.minX + heightHalf, y: bounds.midY)
        let secondPoint = CGPoint(x: bounds.maxX - heightHalf, y: bounds.midY)
        path.move(to: firstPoint)
        path.addLine(to: secondPoint)
        path.close()
        
        return path
    }
    
    private var heightHalf: CGFloat {
        get { bounds.height / 2 }
    }
    
    //MARK: - Functions
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        progressBackroundLayer.lineWidth = bounds.height
        progressLayer.lineWidth = bounds.height

        progressBackroundLayer.path = path.cgPath
        progressLayer.path = path.cgPath
    }
    
    override func setupComponents() {
        super.setupComponents()
        
        layer.addSublayer(progressBackroundLayer)
        layer.addSublayer(progressLayer)
    }
    
    func startAnimation() {
        guard let duration = model?.animationDuration else {
            return
        }
        
        let animation = setupAnimation(with: duration)
        progressLayer.add(animation, forKey: Constants.progressAnimationKey)
    }
    
    //MARK: - Private Functions
    private func setupAnimation(with duration: TimeInterval) -> CABasicAnimation {
        let result = CABasicAnimation(keyPath: "strokeEnd")
        result.duration = duration
        result.fromValue = Constants.strokeEnd
        result.toValue = 0
        result.fillMode = .forwards
        result.isRemovedOnCompletion = false
        
        return result
    }
    
}

//MARK: - Extensions
extension LineProgressView {
    
    private enum Constants {
        
        static let progressAnimationKey = "line.progress.animation"
        static let strokeEnd: CGFloat = 0.5
        
    }
    
}
