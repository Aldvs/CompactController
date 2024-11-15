//
//  ViewController.swift
//  CompactController
//
//  Created by admin on 13.11.2024.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: -  Views
    private lazy var buttonLabel: UIButton = {
        let button = UIButton(
            configuration: .plain(),
            primaryAction: UIAction(handler: { [weak self] _ in self?.openPopoverController() })
        )
        
        button.configuration?.title = "Present"
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupViews()
    }
    
    // MARK: - Setup Views
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(buttonLabel)
        
        buttonLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        buttonLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    // MARK: - Actions
    private func openPopoverController() {
        let controller = CompactPopoverController()
        
        controller.modalPresentationStyle = .popover
        
        controller.popoverPresentationController?.sourceView = buttonLabel
        controller.popoverPresentationController?.permittedArrowDirections = .up
        controller.popoverPresentationController?.delegate = self
        
        present(controller, animated: true)
    }
}

extension ViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(
        for controller: UIPresentationController,
        traitCollection: UITraitCollection
    ) -> UIModalPresentationStyle { .none }
}

