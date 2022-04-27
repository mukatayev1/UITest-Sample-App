//
//  SecondViewController.swift
//  UITest-Sample-App
//
//  Created by Aidos Mukatayev on 2022/04/27.
//

import UIKit

class SecondViewController: UIViewController {
    
    private let welcomeLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        title = "Second page"
        setLabel()
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
}
