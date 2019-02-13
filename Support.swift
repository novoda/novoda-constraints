//
//  Support.swift
//  novoda-constraints
//
//  Created by Simon Rowlands on 13/02/2019.
//

import UIKit

public extension UIView {
    internal func prepareForConstraints() {
        guard let _ = self.superview else {
            fatalError("view doesn't have a superview")
        }
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    @discardableResult internal func pin(_ edge: NSLayoutAttribute,
                                         to otherEdge: NSLayoutAttribute,
                                         of view: UIView,
                                         constant: CGFloat = 0,
                                         multiplier: CGFloat = 1,
                                         priority: UILayoutPriority = .required,
                                         relatedBy relation: NSLayoutRelation = .equal) -> NSLayoutConstraint {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = NSLayoutConstraint(item: self,
                                            attribute: edge,
                                            relatedBy: relation,
                                            toItem: view,
                                            attribute: otherEdge,
                                            multiplier: multiplier,
                                            constant: constant)
        constraint.priority = priority
        view.addConstraint(constraint)
        return constraint
    }
    
    @discardableResult public func pin(_ edge: Edge,
                                       to otherEdge: Edge,
                                       of view: UIView,
                                       constant: CGFloat = 0,
                                       multiplier: CGFloat = 1,
                                       priority: UILayoutPriority = .required,
                                       relatedBy relation: NSLayoutRelation = .equal) -> NSLayoutConstraint {
        
        return pin(edge.layoutAttribute, to: otherEdge.layoutAttribute, of: view, constant: constant, multiplier: multiplier, priority: priority, relatedBy: relation)
    }
}

internal extension Array where Element == Edge {
    mutating func remove(_ edge: Edge) {
        if let foundIndex = index(of: edge) {
            remove(at: foundIndex)
        }
    }
}
