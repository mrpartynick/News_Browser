//
//  ShimmerLayer.swift
//  News Browser
//
//  Created by Николай Циминтия on 14.08.2023.
//

import UIKit

class ShimmerLayer: CAGradientLayer {
    
    //MARK: - init
    override init() {
        super.init()
        configureProperties()
        configureAnimation()
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - conf prop
    private func configureProperties() {
        let firstColor = UIColor(white: 0.85, alpha: 1).cgColor
        let secondColor = UIColor(white: 0.95, alpha: 1).cgColor
        colors = [firstColor, secondColor]
        startPoint = CGPoint(x: 0, y: 0.5)
        endPoint = CGPoint(x: 1, y: 0.5)
        locations = [0, 0.5, 1]
        transform = CATransform3DMakeRotation(180, 0, 0, 0)
    }
    
    //MARK: - conf anim
    private func configureAnimation() {
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [-1, 0.5, 0]
        animation.toValue = [1, 1.5, 2]
        animation.repeatCount = .infinity
        animation.duration = 2
        add(animation, forKey: animation.keyPath)
    }
    
}
