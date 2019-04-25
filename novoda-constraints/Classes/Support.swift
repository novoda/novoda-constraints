import UIKit

public extension UIView {
    
    internal func prepareForConstraints() {
        guard let superview = self.superview else {
            return
        }
        guard !(superview is UITableViewCell), !(superview is UICollectionViewCell) else {
            return
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
        
        let constraint = NSLayoutConstraint(item: self,
                                            attribute: edge,
                                            relatedBy: relation,
                                            toItem: view,
                                            attribute: otherEdge,
                                            multiplier: multiplier,
                                            constant: constant)
        
        constraint.priority = priority

        prepareForConstraints()

        guard let view = view else {
            addConstraint(constraint) // If no other view, add constraint to self
            return constraint
        }

        view.prepareForConstraints()

        if view.superview == superview { // If we are the same level, add constraint to parent
            superview!.addConstraint(constraint)
            return constraint
        }

        if view == superview {
            view.addConstraint(constraint)
            return constraint
        }

        if view.superview == self {
            addConstraint(constraint)
            return constraint
        }

        guard let commonSuperview = nearestCommonSuperview(with: view) else {
            fatalError("Unable to install constraint on view. Does the constraint reference something from outside the subtree of the view? That's illegal.")
        }

        commonSuperview.addConstraint(constraint)
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
