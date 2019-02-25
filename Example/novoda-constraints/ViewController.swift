import UIKit
import novoda_constraints

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let piBox = UIView()
        view.addSubview(piBox)
        
        let poBox = UIView()
        view.addSubview(poBox)
        
        // Example usage:
        
        poBox.align(.top, to: piBox)
        poBox.align(.top, to: .bottom, of: piBox)
        poBox.pin(toSuperview: .top, .bottom, insetBy: 8)
        poBox.pin(toSuperview: .top)
        poBox.pin(toSuperview: Edge.all)
        poBox.pin(toSuperviewSafeArea: Edge.all)
        poBox.pin(toSuperviewSafeArea: .top, .bottom, insetBy: 8)
        poBox.pin(toSuperviewSafeArea: .top)
        poBox.set(height: 50)
        poBox.set(width: 50)
        poBox.set(widthEqualTo: piBox)
        poBox.set(sizeEqualTo: piBox)
    }
}
