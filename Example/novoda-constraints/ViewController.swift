import UIKit
import novoda_constraints

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let piBox = UIView()
        view.addSubview(piBox)
        
        piBox.pin(toSuperview: Edge.all)
        
        piBox.backgroundColor = .red
        
        let poBox = UIView()
        piBox.addSubview(poBox)
        poBox.backgroundColor = .blue
        
        // Example usages:
        
        poBox.align(.top, to: piBox)
        poBox.align(.top, to: .bottom, of: piBox)

        poBox.pin(toSuperview: .top, .bottom, insetBy: 8)
        poBox.pin(toSuperview: .top)
        poBox.pin(toSuperview: Edge.all)

        poBox.pin(toSuperviewSafeArea: Anchor.all)
        poBox.pin(toSuperviewSafeArea: .top, .bottom, insetBy: 8)
        poBox.pin(toSuperviewSafeArea: .top)
        
        poBox.pin(centerXTo: piBox)
        poBox.pin(centerYTo: piBox)
        poBox.pin(centerTo: piBox)

        poBox.set(height: 50)
        poBox.set(width: 50)

        poBox.set(widthEqualTo: piBox)
        poBox.set(sizeEqualTo: piBox)
    }
}
