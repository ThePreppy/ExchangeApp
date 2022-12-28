//
//  XIBViewController.swift
//  ExchangeApp
//
//  Created by Alexander on 28.12.2022.
//

import UIKit

class XIBViewController: UIViewController {
    
    init() {
        super.init(
            nibName: String(describing: Self.self),
            bundle: Bundle(for: Self.self)
        )
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
