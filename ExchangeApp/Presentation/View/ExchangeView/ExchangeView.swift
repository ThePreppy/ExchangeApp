
import UIKit

final class ExchangeView: EAView {
    
    class Model {
        let sourceCurrency: Observable<String>
        let targetCurrency: Observable<String>
        
        let shouldSelectSource: Closure?
        let shouldSelectTarget: Closure?
        
        init(
            sourceCurrency: String,
            targetCurrency: String,
            shouldSelectSource: Closure?,
            shouldSelectTarget: Closure?
        ) {
            self.sourceCurrency = .init(sourceCurrency)
            self.targetCurrency = .init(targetCurrency)
            self.shouldSelectSource = shouldSelectSource
            self.shouldSelectTarget = shouldSelectTarget
        }
    }
    
    //MARK: - Outlets & Properties
    @IBOutlet private var contentView: UIView!
    @IBOutlet private weak var sourceCurrencyView: CurrencySelectionView!
    @IBOutlet private weak var targetCurrencyView: CurrencySelectionView!
    
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
        setupActions()
    }
    
    override func updateComponents() {
        super.updateComponents()
        
        guard let model else {
            return
        }
        
        sourceCurrencyView.model = .init(title: model.sourceCurrency)
        targetCurrencyView.model = .init(title: model.targetCurrency)
    }
    
    //MARK: - Private Functions
    private func setupActions() {
        sourceCurrencyView.didTap = { [weak self] in
            self?.model?.shouldSelectSource?()
        }
        
        targetCurrencyView.didTap = { [weak self] in
            self?.model?.shouldSelectTarget?()
        }
    }
    
}
