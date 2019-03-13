import UIKit

internal extension Array where Element == UIView {
    func iterate(apply: (_ view: UIView, _ lastView: UIView, _ index: Int) -> Void) {
        
        var lastView: UIView? = nil
        
        for (index, view) in enumerated() {
            if let lastView = lastView {
                apply(view, lastView, index)
            }
            lastView = view
        }
    }
}
