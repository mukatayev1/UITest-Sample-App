//
//  MainViewController.swift
//  UITest-Sample-App
//
//  Created by Aidos Mukatayev on 2022/04/27.
//

import UIKit

class MainViewController: UIViewController {
    
    private let nextPageButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
        setButton()
    }
    
    private func setNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "UITest Practice"
        view.backgroundColor = .secondarySystemBackground
    }
    
    private func setButton() {
        nextPageButton.setTitle("Next Page", for: .normal)
        nextPageButton.setTitleColor(.white, for: .normal)
        nextPageButton.backgroundColor = .systemPurple
        nextPageButton.layer.cornerRadius = 15
        nextPageButton.addTarget(self, action: #selector(didTapNextPage(_:)), for: .touchUpInside)
        
        view.addSubview(nextPageButton)
        let constraints = [nextPageButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                           nextPageButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                           nextPageButton.heightAnchor.constraint(equalToConstant: 50),
                           nextPageButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30)]
        nextPageButton.activateConstraints(constraints)
    }
    
    @objc private func didTapNextPage(_ sender: UIButton) {
        let viewController = SecondViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }

}

