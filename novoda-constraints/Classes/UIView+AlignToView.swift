import UIKit

public extension UIView {
    @discardableResult func align(_ edge: Edge,
                                  with view: UIView,
                                  constant: CGFloat = 0,
                                  priority: UILayoutPriority = .required,
                                  relatedBy relation: NSLayoutRelation = .equal) -> NSLayoutConstraint {
        return pin(edge,
                   to: edge,
                   of: view,
                   constant: constant,
                   priority: priority,
                   relatedBy: relation)
    }
}
