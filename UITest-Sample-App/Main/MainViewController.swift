//
//  MainViewController.swift
//  UITest-Sample-App
//
//  Created by Aidos Mukatayev on 2022/04/27.
//

import UIKit

class MainViewController: UIViewController {
    
    private let loginButton = UIButton(type: .system)
    private let loginTextField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
        setButton()
        setLoginTextField()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        loginTextField.resignFirstResponder()
    }
    
    // MARK: - Set
    private func setNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "UITest Practice"
        view.backgroundColor = .secondarySystemBackground
    }
    
    private func setButton() {
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.backgroundColor = .systemPurple
        loginButton.layer.cornerRadius = 15
        loginButton.addTarget(self, action: #selector(didTapLoginButton(_:)), for: .touchUpInside)
        loginButton.isEnabled = false
        loginButton.setTitleColor(.gray, for: .disabled)
        view.addSubview(loginButton)
        let constraints = [loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                           loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                           loginButton.heightAnchor.constraint(equalToConstant: 50),
                           loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30)]
        loginButton.activateConstraints(constraints)
    }
    
    private func setLoginTextField() {
        loginTextField.isAccessibilityElement = true
        loginTextField.accessibilityIdentifier = "loginTextField"
        loginTextField.layer.cornerRadius = 15
        loginTextField.addTarget(self, action: #selector(textChanged(_:)), for: .editingChanged)
        loginTextField.placeholder = "username"
        loginTextField.layer.borderWidth = 1
        loginTextField.layer.borderColor = UIColor.black.cgColor
        view.addSubview(loginTextField)
        let constraints = [loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                           loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                           loginTextField.heightAnchor.constraint(equalToConstant: 50),
                           loginTextField.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)]
        loginTextField.activateConstraints(constraints)
        
    }
    
    // MARK: - #selectors
    @objc private func didTapLoginButton(_ sender: UIButton) {
        let viewController = SecondViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc private func textChanged(_ sender: UITextField) {
        guard let text = sender.text else { return }
        loginButton.isEnabled = !text.isEmpty
    }
}

