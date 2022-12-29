
import UIKit

@IBDesignable
class CurrencySelectionView: EAControl {
    
    class Model {
        let title: Observable<String>
        
        init(title: Observable<String>) {
            self.title = title
        }
    }
    
    //MARK: - Outlets & Properties
    @IBOutlet private var contentView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    
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
    }
    
    override func updateComponents() {
        super.updateComponents()
        
        titleLabel.text = model?.title.value
        
        model?.title.subscribe { [weak self] in
            self?.titleLabel.text = $0
        }
    }
    
}
