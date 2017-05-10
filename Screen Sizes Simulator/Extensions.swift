//
//  Extensions.swift
//  Spider Experiments
//
//  Created by Felipe Augusto Sviaghin Ferri on 29/4/17.
//  Copyright © 2017 Felipe Augusto Sviaghin Ferri. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
extension UIView {
    func addSubviewWithConstraints(_ subView: UIView) {
        subView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subView)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|[subView]|", options: [], metrics: nil, views: ["subView":subView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[subView]|", options: [], metrics: nil, views: ["subView":subView]))
        layoutIfNeeded()
        subView.frame = bounds
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        
        set {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        
        set {
            layer.borderWidth = borderWidth
        }
    }
}
