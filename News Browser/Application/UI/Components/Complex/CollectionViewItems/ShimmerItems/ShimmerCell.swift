//
//  CollectionCell.swift
//  verstkaSimulation
//
//  Created by Николай Циминтия on 18.07.2023.
//

import UIKit

class ShimmerCell: UICollectionViewCell {
    
    static let reuseID = "SimmerCell"
    let shimmerLayer = ShimmerLayer()
    
    private var cornerRadius: CGFloat {
        return self.bounds.height / 50
    }
    
    //MARK: - init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.backgroundColor = .systemBlue
        contentView.layer.addSublayer(shimmerLayer)
    }
    
    //MARK: - layout subviews
    override func layoutSubviews() {
        super.layoutSubviews()
        shimmerLayer.frame = contentView.frame

        // Apply rounded corners
        contentView.layer.cornerRadius = cornerRadius
        contentView.layer.masksToBounds = true
                
        // Set masks to bounds to false to avoid the shadow
        // from being clipped to the corner radius
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
