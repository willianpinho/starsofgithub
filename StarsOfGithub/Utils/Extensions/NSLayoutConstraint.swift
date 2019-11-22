//
//  NSLayoutConstraint.swift
//  StarsOfGithub
//
//  Created by Willian Pinho on 21/11/19.
//  Copyright © 2019 Willian Pinho. All rights reserved.
//

import UIKit

extension NSLayoutConstraint {
    
    /// An aux method for creating equally related attribute constraints.
    ///
    /// - parameters:
    ///   - attribute: The attribute to be equal between views.
    ///   - firstView: The first view to constraint.
    ///   - secondView: The second view to constraint.
    public static func equal(_ attribute: NSLayoutConstraint.Attribute,
                             from firstView: UIView,
                             to secondView: UIView) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: firstView,
                                            attribute: attribute,
                                            relatedBy: .equal,
                                            toItem: secondView,
                                            attribute: attribute,
                                            multiplier: 1.0,
                                            constant: 0.0)
        constraint.priority = .defaultHigh
        return constraint
    }
    
}
