//
//  RoundedImageView.swift
//  News Browser
//
//  Created by Николай Циминтия on 13.08.2023.
//

import UIKit

class RoundedImageView: UIImageView {

    init() {
        super.init(frame: .zero)
        backgroundColor = .systemBlue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.height / 50
    }
}
