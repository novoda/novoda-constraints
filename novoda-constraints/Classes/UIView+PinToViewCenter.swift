import UIKit

public extension UIView {
    @discardableResult func pinCenterX(to view: UIView,
                                       constant: CGFloat = 0,
                                       priority: UILayoutPriority = .required,
                                       relatedBy relation: NSLayoutRelation = .equal) -> NSLayoutConstraint {
        return pin(.centerX,
                   to: .centerX,
                   of: view,
                   constant: constant,
                   priority: priority,
                   relatedBy: relation)
    }
    
    @discardableResult func pinCenterY(to view: UIView,
                                       constant: CGFloat = 0,
                                       priority: UILayoutPriority = .required,
                                       multiplier: CGFloat = 1,
                                       relatedBy relation: NSLayoutRelation = .equal) -> NSLayoutConstraint {
        return pin(.centerY,
                   to: .centerY,
                   of: view,
                   constant: constant,
                   priority: priority,
                   relatedBy: relation)
    }
    
    func pinCenter(to view: UIView,
                   constant: CGFloat = 0,
                   priority: UILayoutPriority = .required,
                   relatedBy relation: NSLayoutRelation = .equal) {
        
        pinCenterY(to: view,
                   constant: constant,
                   priority: priority,
                   relatedBy: relation)
        
        pinCenterX(to: view,
                   constant: constant,
                   priority: priority,
                   relatedBy: relation)
    }
}
