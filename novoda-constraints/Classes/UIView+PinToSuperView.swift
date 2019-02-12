import Foundation
import UIKit

public extension UIView {
    func pinToSuperviewEdges(constant: CGFloat = 0) {
        pinToSuperview(edges: Edge.all, constant: constant)
    }
    
    func pinToSuperview(edges: [Edge], constant: CGFloat = 0, priority: UILayoutPriority = .required) {
        for edge in edges {
            pinToSuperview(edge, constant: constant, priority: priority)
        }
    }
    
    @discardableResult func pinToSuperviewTop(
        constant: CGFloat = 0,
        priority: UILayoutPriority = .required,
        relatedBy relation: NSLayoutRelation = .equal) -> NSLayoutConstraint {
        
        guard let superview = self.superview else {
            preconditionFailure("view has no superview")
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = NSLayoutConstraint(item: self,
                                            attribute: .top,
                                            relatedBy: relation,
                                            toItem: superview,
                                            attribute: .top,
                                            multiplier: 1,
                                            constant: constant)
        constraint.priority = priority
        superview.addConstraint(constraint)
        return constraint
    }

    @discardableResult func pinToSuperview(_ edge: Edge,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .required,
        relatedBy relation: NSLayoutRelation = .equal) -> NSLayoutConstraint {

        guard let superview = self.superview else {
            preconditionFailure("view has no superview")
        }

        translatesAutoresizingMaskIntoConstraints = false

        let constraint = NSLayoutConstraint(item: self,
                                            attribute: edge.layoutAttribute,
                                            relatedBy: relation,
                                            toItem: superview,
                                            attribute: edge.layoutAttribute,
                                            multiplier: 1,
                                            constant: constant)
        constraint.priority = priority
        superview.addConstraint(constraint)
        return constraint
    }
    
    @discardableResult func pinToSuperviewBottom(
        constant: CGFloat = 0,
        priority: UILayoutPriority = .required,
        relatedBy relation: NSLayoutRelation = .equal) -> NSLayoutConstraint {
        
        guard let superview = self.superview else {
            preconditionFailure("view has no superview")
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = NSLayoutConstraint(item: superview,
                                            attribute: .bottom,
                                            relatedBy: relation,
                                            toItem: self,
                                            attribute: .bottom,
                                            multiplier: 1,
                                            constant: constant)
        constraint.priority = priority
        superview.addConstraint(constraint)
        return constraint
    }
    
    @discardableResult func pinToSuperviewLeading(
        constant: CGFloat = 0,
        priority: UILayoutPriority = .required,
        relatedBy relation: NSLayoutRelation = .equal) -> NSLayoutConstraint {
        
        guard let superview = self.superview else {
            preconditionFailure("view has no superview")
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = NSLayoutConstraint(item: self,
                                            attribute: .leading,
                                            relatedBy: relation,
                                            toItem: superview,
                                            attribute: .leading,
                                            multiplier: 1,
                                            constant: constant)
        constraint.priority = priority
        superview.addConstraint(constraint)
        return constraint
    }
    
    @discardableResult func pinToSuperviewTrailing(
        constant: CGFloat = 0,
        priority: UILayoutPriority = .required,
        relatedBy relation: NSLayoutRelation = .equal) -> NSLayoutConstraint {
        
        guard let superview = self.superview else {
            preconditionFailure("view has no superview")
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = NSLayoutConstraint(item: superview,
                                            attribute: .trailing,
                                            relatedBy: relation,
                                            toItem: self,
                                            attribute: .trailing,
                                            multiplier: 1,
                                            constant: constant)
        constraint.priority = priority
        superview.addConstraint(constraint)
        return constraint
    }
}

