//
//  SecondViewController.swift
//  UITest-Sample-App
//
//  Created by Aidos Mukatayev on 2022/04/27.
//

import UIKit

class SecondViewController: UIViewController {
    
    private let welcomeLabel = UILabel()
    private let updateLabelButton = UIButton(type: .system)
    private var alertController: UIAlertController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.accessibilityIdentifier = "SecondPageIdentifier"
        view.backgroundColor = .secondarySystemBackground
        title = "Second page"
        setLabel()
        setUpdateLabelButton()
        setAlertController()
    }
    
    private func setLabel() {
        welcomeLabel.textAlignment = .center
        welcomeLabel.font = .systemFont(ofSize: 25, weight: .bold)
        welcomeLabel.text = "Welcome"
        
        view.addSubview(welcomeLabel)
        let constraints = [welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                           welcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)]
        welcomeLabel.activateConstraints(constraints)
    }
    
    private func setUpdateLabelButton() {
        updateLabelButton.setTitle("Update Label Text", for: .normal)
        updateLabelButton.setTitleColor(.white, for: .normal)
        updateLabelButton.backgroundColor = .systemRed
        updateLabelButton.layer.cornerRadius = 15
        updateLabelButton.addTarget(self, action: #selector(didTapUpdateLabel(_:)), for: .touchUpInside)
        
        view.addSubview(updateLabelButton)
        let constraints = [updateLabelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                           updateLabelButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                           updateLabelButton.heightAnchor.constraint(equalToConstant: 50),
                           updateLabelButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30)]
        updateLabelButton.activateConstraints(constraints)
    }
    
    private func setAlertController() {
        alertController = UIAlertController(title: "Enter new label text", message: nil, preferredStyle: .alert)
        guard let alertController = alertController else { return }
        alertController.addTextField()
        
        let addAction = UIAlertAction(title: "Update", style: .default) { [unowned self] _ in
            
            guard let textField = alertController.textFields?[0],
                  let text = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !text.isEmpty else { return }
            
            self.welcomeLabel.text = text
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
    }
    
    @objc private func didTapUpdateLabel(_ sender: UIButton) {
        showAlertWithTextField()
    }
    
    private func showAlertWithTextField() {
        guard let alertController = alertController else { return }
        present(alertController, animated: true)
    }
    
}
