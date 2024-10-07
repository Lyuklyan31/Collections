import UIKit

class SetButtonView: UIView {
    
    // MARK: - UI Elements
    let button = UIButton(type: .system)
    let resultLabel = UILabel()
    private let title: String
    
    // MARK: - Button Action
    var buttonAction: (() -> Void)?
    
    // MARK: - Initializers
    init(_ title: String) {
        self.title = title
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        setupButton()
        setupResultLabel()
    }
    
    // MARK: - Setup Button
    private func setupButton() {
        button.setTitle(title, for: .normal)
        
        addSubview(button)
        button.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
        }
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    // MARK: - Setup Result Label
    private func setupResultLabel() {
        resultLabel.text = ""
        resultLabel.textAlignment = .center
        resultLabel.isHidden = true
        
        addSubview(resultLabel)
        resultLabel.snp.makeConstraints {
            $0.top.equalTo(button.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.lessThanOrEqualToSuperview()
        }
    }
    
    // MARK: - Button Tapped Action
    @objc private func buttonTapped() {
        buttonAction?()
    }
}
