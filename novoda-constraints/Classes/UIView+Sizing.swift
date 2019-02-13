import UIKit

public extension UIView {
    @discardableResult func setWidthConstraint(equalTo view: UIView? = nil,
                                               constant: CGFloat = 0,
                                               multiplier: CGFloat = 1,
                                               priority: UILayoutPriority = .required,
                                               relatedBy relation: NSLayoutRelation = .equal) -> NSLayoutConstraint {
        
        return pin(.width, to: .width, of: view ?? self, constant: constant, multiplier: multiplier, priority: priority, relatedBy: relation)
    }
    
    @discardableResult func setHeightConstraint(equalTo view: UIView? = nil,
                                                attribute: NSLayoutAttribute = .height,
                                                constant: CGFloat = 0,
                                                multiplier: CGFloat = 1,
                                                priority: UILayoutPriority = .required,
                                                relatedBy relation: NSLayoutRelation = .equal) -> NSLayoutConstraint {
        
        return pin(.height, to: .height, of: view ?? self, constant: constant, multiplier: multiplier, priority: priority, relatedBy: relation)
    }
    
    func setSizeConstraint(size: CGSize,
                           equalTo view: UIView? = nil,
                           constant: CGFloat = 0,
                           multiplier: CGFloat = 1,
                           priority: UILayoutPriority = .required,
                           relatedBy relation: NSLayoutRelation = .equal) {
        setWidthConstraint(equalTo: view, constant: size.width, multiplier: multiplier, priority: priority, relatedBy: relation)
        setHeightConstraint(equalTo: view, constant: size.height, multiplier: multiplier, priority: priority, relatedBy: relation)
    }
}
