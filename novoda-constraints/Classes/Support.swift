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
        view?.translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = NSLayoutConstraint(item: self,
                                            attribute: edge,
                                            relatedBy: relation,
                                            toItem: view,
                                            attribute: otherEdge,
                                            multiplier: multiplier,
                                            constant: constant)
        constraint.priority = priority
        
        if let view = view {
            view.addConstraint(constraint)
        } else {
            addConstraint(constraint)
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
                   constant: constant,
                   multiplier: multiplier,
                   priority: priority,
                   relatedBy: relation)
    }
}
