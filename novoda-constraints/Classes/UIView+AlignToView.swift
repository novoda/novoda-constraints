import UIKit

public extension UIView {
    @discardableResult func align(_ edge: Edge,
                                  to view: UIView,
                                  constant: CGFloat = 0,
                                  priority: UILayoutPriority = .required,
                                  relatedBy relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
        return pin(edge,
                   to: edge,
                   of: view,
                   constant: constant,
                   priority: priority,
                   relatedBy: relation)
    }
    
    @discardableResult func align(_ edge: Edge,
                                  to otherEdge: Edge,
                                  of view: UIView,
                                  constant: CGFloat = 0,
                                  priority: UILayoutPriority = .required,
                                  relatedBy relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
        return pin(edge,
                   to: otherEdge,
                   of: view,
                   constant: constant,
                   priority: priority,
                   relatedBy: relation)
    }
}
