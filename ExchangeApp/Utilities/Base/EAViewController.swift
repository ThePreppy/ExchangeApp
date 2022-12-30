//
//  EAViewController.swift
//  ExchangeApp
//
//  Created by Alexander on 28.12.2022.
//

import UIKit

class EAViewController: UIViewController {
    
    enum InstantiateType {
        case xib
        case code
    }
    
    private let loaderView = LoaderView()
    
    init(type: InstantiateType = .xib) {
        if type == .xib {
            super.init(
                nibName: String(describing: Self.self),
                bundle: Bundle(for: Self.self)
            )
        } else {
            super.init(nibName: nil, bundle: Bundle(for: Self.self))
        }
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupComponents()
    }
    
    func setupComponents() {
        view.backgroundColor = AppTheme.systemWhite
    }
    
}

extension EAViewController: ErrorRepresentable {
    
    func handle(error: Error?) {
        guard let error = error else {
            return
        }
        
        let alertViewController = AlertBuilder()
            .message(error.localizedDescription)
            .addAction(.ok())
            .build()
        
        present(alertViewController, animated: true)
    }
    
}

extension EAViewController: LoaderRepresentable {
    
    func startLoading() {
        loaderView.addToSuperview(view) {[
            $0.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            $0.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            $0.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            $0.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ]}
    }
    
    func stopLoading() {
        loaderView.removeFromSuperview()
    }
    
}
