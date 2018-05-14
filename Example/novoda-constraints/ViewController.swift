import UIKit
import novoda_constraints

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let piBox = UIView()
        view.addSubview(piBox)
        
        piBox.backgroundColor = .red
        piBox.setWidthConstraint(constant: 100)
        piBox.setHeightConstraint(equalTo: piBox,
                                  attribute: .width,
                                  multiplier: CGFloat.pi)
        piBox.pinCenter(to: view)
    }
}

