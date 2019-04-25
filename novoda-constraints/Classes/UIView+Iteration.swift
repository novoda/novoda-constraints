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

internal extension UIView {
    func nearestCommonSuperview(with view: UIView) -> UIView? {
        return Set(UIView.hierarchy(for: self)).intersection(UIView.hierarchy(for: view)).first
    }

    static private func hierarchy(for view: UIView?, accumulator: [UIView] = []) -> [UIView] {
        print("Checking hierarchy")
        guard let view = view else {
            return accumulator
        }
        return UIView.hierarchy(for: view.superview, accumulator: accumulator + [view])
    }
}
