//
//  RoundedButton.swift
//  News Browser
//
//  Created by Николай Циминтия on 13.08.2023.
//

import UIKit

class RoundedButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.height / 4
    }

}
