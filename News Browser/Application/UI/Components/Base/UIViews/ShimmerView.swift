//
//  ShimmerView.swift
//  News Browser
//
//  Created by Николай Циминтия on 14.08.2023.
//

import UIKit

class ShimmerView: UIView {

    private let gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        let firstColor = UIColor(white: 0.85, alpha: 1).cgColor
        let secondColor = UIColor(white: 0.95, alpha: 1).cgColor
        layer.colors = [firstColor, secondColor]
        layer.startPoint = CGPoint(x: 0, y: 0.5)
        layer.endPoint = CGPoint(x: 1, y: 0.5)
        layer.locations = [0, 0.5, 1]
        layer.transform = CATransform3DMakeRotation(180, 0, 0, 0)
        return layer
    }()
    
    init() {
        super.init(frame: .zero)
        layer.addSublayer(gradientLayer)
        
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [-1, 0.5, 0]
        animation.toValue = [1, 1.5, 2]
        animation.repeatCount = .infinity
        animation.duration = 2
        gradientLayer.add(animation, forKey: animation.keyPath)
//        layer.mask = gradientLayer
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = self.bounds
    }

}
