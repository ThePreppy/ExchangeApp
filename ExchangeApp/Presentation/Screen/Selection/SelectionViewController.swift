//
//  SelectionViewController.swift
//  ExchangeApp
//
//  Created by Alexander on 29.12.2022.
//

import UIKit

class SelectionViewController<T: Selectable>: EAViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    private lazy var pickerView: UIPickerView = {
        let result = UIPickerView()
        result.delegate = self
        result.dataSource = self
        
        return result
    }()
    
    private lazy var selectButton: PrimaryButton = {
        let result = PrimaryButton()
        result.titleKey = .select_currency_select
        
        return result
    }()
    
    private lazy var stackView = UIStackView.vertical(
        spacing: 10,
        alignment: .center,
        arrangedSubviews: [pickerView, selectButton]
    )
    
    private var items: [T]
    private let didSelect: DataClosure<T>
    
    init(items: [T], didSelect: @escaping DataClosure<T>) {
        self.items = items
        self.didSelect = didSelect
        super.init(type: .code)
    }
    
    override func setupComponents() {
        super.setupComponents()
        
        stackView.addToSuperview(view) {[
            $0.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            $0.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            $0.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            $0.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ]}
        
        selectButton.setupConstraints {[
            $0.heightAnchor.constraint(equalToConstant: 50),
            $0.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6)
        ]}
        
        selectButton.didTap = { [weak self] in
            guard
                let selectedRow = self?.pickerView.selectedRow(inComponent: 0),
                let selectedItem = self?.items[safe: selectedRow]
            else {
                return
            }
            
            self?.didSelect(selectedItem)
            self?.dismiss(animated: true)
        }
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(
        _ pickerView: UIPickerView,
        numberOfRowsInComponent component: Int
    ) -> Int {
        
        items.count
    }
    
    func pickerView(
        _ pickerView: UIPickerView,
        titleForRow row: Int,
        forComponent component: Int
    ) -> String? {
        
        items[safe: row]?.title
    }
    
}
