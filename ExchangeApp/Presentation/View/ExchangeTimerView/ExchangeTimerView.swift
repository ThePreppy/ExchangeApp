
import UIKit

final class ExchangeTimerView: EAView {
    
    class Model {
        let animationDuration: TimeInterval
        let countdown: Observable<Int>
        
        init(animationDuration: TimeInterval) {
            self.animationDuration = animationDuration
            self.countdown = .init(Int(animationDuration))
        }
    }
    
    //MARK: - Outlets & Properties
    @IBOutlet private var contentView: UIView!
    @IBOutlet private weak var lineProgressView: LineProgressView!
    @IBOutlet private weak var countdownLabel: UILabel!
    
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
        
        guard let model else {
            return
        }
        
        lineProgressView.model = LineProgressView.Model(animationDuration: model.animationDuration)
        model.countdown.subscribe { [weak self] _ in
            self?.setupCountdownLabel()
        }
        setupCountdownLabel()
    }
    
    func startAnimation() {
        lineProgressView.startAnimation()
    }
    
    //MARK: - Private Functions
    private func setupCountdownLabel() {
        guard let model else { return }
        countdownLabel.text = "\(model.countdown.value) \(Localizable.exchange_confirmation_sec_left.localize())"
    }
    
}
