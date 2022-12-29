
import UIKit

@IBDesignable
class ExchangeSuccessView: EAView {
    
    class Model {
        let title: String
        let subtitle: String
        
        init(title: String, subtitle: String) {
            self.title = title
            self.subtitle = subtitle
        }
    }
    
    //MARK: - Outlets & Properties
    @IBOutlet private var contentView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    
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
        
        titleLabel.text = model?.title
        subtitleLabel.text = model?.subtitle
    }
    
}
