//
//  SectionTitle.swift
//  verstkaSimulation
//
//  Created by Николай Циминтия on 20.07.2023.
//

import UIKit

class ShimmerTitle: UICollectionReusableView {
    
    public static let id = "ShimmerTitle"
    private let shimmerLayer = ShimmerLayer()
    
    public var title: String {
        get {
            return titleLabel.text ?? ""
        }
        set {
            titleLabel.text = newValue
        }
    }
    
    private var titleLabel: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 20)
        l.numberOfLines = 1
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
//        layer.addSublayer(shimmerLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        shimmerLayer.frame = frame
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
