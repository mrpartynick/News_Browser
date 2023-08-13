//
//  CollectionCell.swift
//  verstkaSimulation
//
//  Created by Николай Циминтия on 18.07.2023.
//

import UIKit

class NewsCell: UICollectionViewCell {
    
    static let reuseID = "CollectionCell"
    
    public let textLabel: UILabel = {
        let l = UILabel()
        l.textColor = .white
        l.font = UIFont.systemFont(ofSize: 15)
        l.numberOfLines = 0
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    public let imageView: UIImageView = {
        let imv = UIImageView()
        imv.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(systemName: R.ImageNames.articlePlaceholderImage)
        imv.image = image?.withTintColor(.white)
        imv.tintColor = .white
        imv.contentMode = .scaleToFill
        return imv
    }()
    
    private let topView: UIView = {
        let v = UIView()
        v.backgroundColor = .black
        v.layer.opacity = 0.5
        return v
    }()
    
    private var cornerRadius: CGFloat {
        return self.bounds.height / 50
    }
    
    //MARK: - init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.backgroundColor = .systemBlue
        contentView.addSubview(imageView)
        contentView.addSubview(topView)
        contentView.addSubview(textLabel)
        
        setConstraints()
    }
    
    //MARK: - layout subviews
    override func layoutSubviews() {
        super.layoutSubviews()
        
        topView.frame = contentView.bounds

        // Apply rounded corners
        contentView.layer.cornerRadius = cornerRadius
        contentView.layer.masksToBounds = true
                
        // Set masks to bounds to false to avoid the shadow
        // from being clipped to the corner radius
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = false
                
        textLabel.heightAnchor.constraint(lessThanOrEqualToConstant: contentView.bounds.height).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - set constraints
    private func setConstraints() {
        textLabel.leadingAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        textLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        textLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true 
    }
    
    private func configureGradient() {
        
    }
    
}
