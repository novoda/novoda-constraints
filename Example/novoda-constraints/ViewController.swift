import UIKit
import novoda_constraints

class ViewController: UIViewController {
    
    let headerView = UIView()
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let usernameUnderlineView = UIView()
    let passwordUnderlineView = UIView()
    let loginButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        setupViews()
        addConstraints()
    }
    
    func addViews() {
        view.addSubview(headerView)
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(usernameUnderlineView)
        view.addSubview(passwordUnderlineView)
        view.addSubview(loginButton)
    }
    
    func setupViews() {
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
    }
    
    func addConstraints() {
        headerView.pin(toSuperview: .top, insetBy: 50)
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
