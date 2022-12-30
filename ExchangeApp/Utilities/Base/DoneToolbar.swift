//
//  DoneToolbar.swift
//  ExchangeApp
//
//  Created by Alexander on 29.12.2022.
//

import UIKit

class DoneToolbar: UIToolbar {
    
    var doneDidTap: Closure?
    
    init(doneDidTap: Closure?) {
        self.doneDidTap = doneDidTap
        super.init(frame: .zero)
        
        setupComponents()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupComponents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupComponents()
    }
    
    func setupComponents() {
        let doneButton = UIBarButtonItem(
            title: Localizable.common_done.localize(),
            style: .done,
            target: self,
            action: #selector(doneButtonDidTap)
        )
        
        setItems([
            UIBarButtonItem.flexibleSpace(),
            doneButton
        ], animated: false)
        
        sizeToFit()
    }
    
    @objc
    private func doneButtonDidTap() {
        doneDidTap?()
    }
    
}
