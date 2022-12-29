
import UIKit

final class AmountInputView: EAView {
    
    //MARK: - Outlets & Properties
    @IBOutlet private var contentView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var textField: EATextField!
    
    var text: String? {
        get { textField.text }
        set { textField.text = newValue }
    }
    
    //MARK: - Functions
    override func setupComponents() {
        super.setupComponents()
        
        contentView = loadNib()
        backgroundColor = .clear
        addSubview(contentView)
        setupNibConstraints(contentView)
        setupUI()
    }
    
    //MARK: - Private Functions
    private func setupUI() {
        titleLabel.textKey = .exchange_amount
        
        textField.inputAccessoryView = DoneToolbar { [weak self] in
            self?.textField.resignFirstResponder()
        }
    }
    
}
