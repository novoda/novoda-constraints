import UIKit

public extension UIView {
    
    internal func prepareForConstraints() {
        guard let _ = self.superview else {
            fatalError("view doesn't have a superview")
        }
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    @discardableResult internal func pin(_ edge: NSLayoutConstraint.Attribute,
                                         to otherEdge: NSLayoutConstraint.Attribute = .notAnAttribute,
                                         of view: UIView? = nil,
                                         constant: CGFloat = 0,
                                         multiplier: CGFloat = 1,
                                         priority: UILayoutPriority = .required,
                                         relatedBy relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
        
        prepareForConstraints()
        
        let constraint = NSLayoutConstraint(item: self,
                                            attribute: edge,
                                            relatedBy: relation,
                                            toItem: view,
                                            attribute: otherEdge,
                                            multiplier: multiplier,
                                            constant: constant)
        
        constraint.priority = priority
        
        guard let view = view, self != view.superview else { // If other view doesn't exist or self is not the parent, self owns constraint
            addConstraint(constraint)
            return constraint
        }
        
        if view != superview {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        if view.superview == superview { // If common superview, parent should own the constraint
            superview?.addConstraint(constraint)
        } else {
            view.addConstraint(constraint) // In all other cases, other view owns constraint
        }
        
        return constraint
    }
    
    @discardableResult public func pin(_ edge: Edge,
                                       to otherEdge: Edge,
                                       of view: UIView,
                                       constant: CGFloat = 0,
                                       multiplier: CGFloat = 1,
                                       priority: UILayoutPriority = .required,
                                       relatedBy relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
        
        return pin(edge.layoutAttribute,
                   to: otherEdge.layoutAttribute,
                   of: view,
                   constant: edge.offset(equivalentToInset: constant),
                   multiplier: multiplier,
                   priority: priority,
                   relatedBy: relation)
    }
}
