
import UIKit

@IBDesignable
class ExchangeResultView: EAView {
    
    class Model {
        let sourceCurrency: String
        let targetCurrency: String
        
        init(sourceCurrency: String, targetCurrency: String) {
            self.sourceCurrency = sourceCurrency
            self.targetCurrency = targetCurrency
        }
    }
    
    //MARK: - Outlets & Properties
    @IBOutlet private var contentView: UIView!
    @IBOutlet private weak var sourceCurrencyLabel: UILabel!
    @IBOutlet private weak var targetCurrencyLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    var model: Model? {
        didSet { updateComponents() }
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
    
    override func updateComponents() {
        super.updateComponents()
        
        sourceCurrencyLabel.text = model?.sourceCurrency
        targetCurrencyLabel.text = model?.targetCurrency
    }
    
    //MARK: - Private Functions
    private func setupUI() {
        descriptionLabel.textKey = .exchange_confirmation_precedes
    }
    
}
