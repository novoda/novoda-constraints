//
//  UIView+Stack.swift
//  novoda-constraints
//
//  Created by Simon Rowlands on 08/03/2019.
//

import Foundation

public extension Array where Element == UIView {
    
    func stack(direction: NSLayoutConstraint.Axis,
               spacing: CGFloat...,
               priority: UILayoutPriority = .required,
               relatedBy relation: NSLayoutConstraint.Relation = .equal) {
        
        stack(direction: direction,
              spacing: spacing,
              priority: priority,
              relatedBy: relation)
    }
    
    func stack(direction: NSLayoutConstraint.Axis,
               spacing: [CGFloat] = [],
               priority: UILayoutPriority = .required,
               relatedBy relation: NSLayoutConstraint.Relation = .equal) {
        
        iterate { view, lastView, index in
            
            let constant = (index < spacing.count)
                ? spacing[index]
                : spacing.last ?? 0
            
            view.pin(direction.from,
                     to: direction.to,
                     of: lastView,
                     constant: constant,
                     priority: priority,
                     relatedBy: relation)
        }
    }
}
