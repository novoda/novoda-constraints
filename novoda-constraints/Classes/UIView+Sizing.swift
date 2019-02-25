import UIKit

public extension UIView {
    
    @discardableResult func set(height constant: CGFloat) -> NSLayoutConstraint {
        return pin(.height, constant: constant)
    }
    
    @discardableResult func set(width constant: CGFloat) -> NSLayoutConstraint {
        return pin(.width, constant: constant)
    }
    
    @discardableResult func set(widthEqualTo view: UIView,
                                constant: CGFloat = 0,
                                multiplier: CGFloat = 1,
                                priority: UILayoutPriority = .required,
                                relatedBy relation: NSLayoutRelation = .equal) -> NSLayoutConstraint {
        
        return pin(.width,
                   to: .width,
                   of: view,
                   constant: constant,
                   multiplier: multiplier,
                   priority: priority,
                   relatedBy: relation)
    }
    
    @discardableResult func set(heightEqualTo view: UIView,
                                attribute: NSLayoutAttribute = .height,
                                constant: CGFloat = 0,
                                multiplier: CGFloat = 1,
                                priority: UILayoutPriority = .required,
                                relatedBy relation: NSLayoutRelation = .equal) -> NSLayoutConstraint {
        return pin(.height,
                   to: .height,
                   of: view,
                   constant: constant,
                   multiplier: multiplier,
                   priority: priority,
                   relatedBy: relation)
    }
    
    func set(size: CGSize) {
        pin(.height, constant: size.height)
        pin(.width, constant: size.width)
    }
    
    func set(sizeEqualTo view: UIView,
             multiplier: CGFloat = 1,
             priority: UILayoutPriority = .required,
             relatedBy relation: NSLayoutRelation = .equal) {
        
        set(widthEqualTo: view,
            multiplier: multiplier,
            priority: priority,
            relatedBy: relation)
        
        set(heightEqualTo: view,
            multiplier: multiplier,
            priority: priority,
            relatedBy: relation)
    }
}
