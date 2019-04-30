import UIKit
import novoda_constraints

class HomeViewController: UIViewController {
    
    let headerView = UIView()
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let usernameUnderlineView = UIView()
    let passwordUnderlineView = UIView()
    let loginButton = UIButton()

    let containerView = UIView()
    let subContainerA = UIView()
    let subContainerB = UIView()

    let subLabelA = UILabel()
    let subLabelB = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        setupViews()
        addConstraints()

        loginButton.addTarget(nil, action: #selector(nextScreen), for: .touchUpInside)
    }

    @objc func nextScreen() {
        navigationController?.pushViewController(TableViewController(), animated: true)
    }
    
    func addViews() {
        view.addSubview(headerView)
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(usernameUnderlineView)
        view.addSubview(passwordUnderlineView)
        view.addSubview(loginButton)

        view.addSubview(containerView)
        containerView.addSubview(subContainerA)
        containerView.addSubview(subContainerB)
        subContainerA.addSubview(subLabelA)
        subContainerB.addSubview(subLabelB)
    }
    
    func setupViews() {

        view.backgroundColor = .white

        headerView.backgroundColor = .gray
        
        usernameTextField.borderStyle = .none
        usernameTextField.placeholder = "Username"
        
        usernameUnderlineView.backgroundColor = .lightGray
        
        passwordTextField.borderStyle = .none
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        
        passwordUnderlineView.backgroundColor = .lightGray
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = .gray
        loginButton.tintColor = .white
        loginButton.layer.cornerRadius = 12

        subLabelA.text = "A"
        subLabelB.text = "B"
    }
    
    func addConstraints() {

        containerView.pin(toSuperviewSafeArea: Anchor.all)
        subContainerA.pin(toSuperview: .top, .leading, .bottom)
        subContainerB.pin(toSuperview: .top, .trailing, .bottom)
        subContainerB.pin(.leading, to: .trailing, of: subContainerA)

        subContainerA.set(heightEqualTo: subContainerB)

        subLabelA.pin(toSuperview: .top, .leading, .bottom)
        subLabelB.pin(toSuperview: .trailing, .bottom)

        subLabelB.pin(.top, to: .top, of: subLabelA)

        headerView.pin(toSuperviewSafeArea: .top, insetBy: 50)
        headerView.pin(centerXTo: view)
        headerView.set(height: 200)
        
        usernameTextField.pin(toSuperview: .trailing, .leading, insetBy: 40)
        usernameTextField.set(height: 30)
        usernameUnderlineView.set(height: 1)

        passwordTextField.set(heightEqualTo: usernameTextField)
        passwordUnderlineView.set(height: 1)
        
        loginButton.set(height: 50)
        
        let views = [headerView, usernameTextField, usernameUnderlineView, passwordTextField, passwordUnderlineView, loginButton]
        
        views.align(edges: .leading, .trailing)
        views.stack(direction: .vertical,
                    spacing: 30, 0, 12, 0, 20)
    }
}
