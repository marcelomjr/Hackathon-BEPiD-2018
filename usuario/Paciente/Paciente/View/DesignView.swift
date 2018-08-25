//
//  DesignCell.swift
//  Paciente
//
//  Created by Seong Eun Kim on 25/08/18.
//  Copyright © 2018 Marcelo Martimiano Junior. All rights reserved.
//

import Foundation
import UIKit

class DesignView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 0
    @IBInspectable var shadowColor: UIColor? = UIColor.black
    
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 0
    
    @IBInspectable var shadowOpacity: Float = 0.2
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        layer.shadowPath = shadowPath.cgPath
        layer.shadowRadius = 5
        layer.shadowOpacity = shadowOpacity
    }
}
