import UIKit

// MARK: - ButtonView
class ButtonView: UIView {
    
    // MARK: - UI Elements
    let resultButton = UIButton(type: .system)
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
        setupSubViews()
    }
    
    // MARK: - Setup Button
    private func setupSubViews() {
        resultButton.setTitle(title, for: .normal)
        resultButton.titleLabel?.numberOfLines = 0
        resultButton.titleLabel?.textAlignment = .center
        
        addSubview(resultButton)
        resultButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
        }
        
        resultButton.accessibilityIdentifier = title
        
        resultButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        resultLabel.text = ""
        resultLabel.textAlignment = .center
        resultLabel.isHidden = true
        resultLabel.numberOfLines = 0
        
        addSubview(resultLabel)
        resultLabel.snp.makeConstraints {
            $0.top.equalTo(resultButton.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.lessThanOrEqualToSuperview()
        }
    }
    
    // MARK: - Button Tapped Action
    @objc private func buttonTapped() {
        buttonAction?()
    }
    
    func configure(with text: String) {
        resultLabel.text = text.isEmpty ? "" : text
        resultLabel.isHidden = false
        
        if title == "All matching letters" {
            resultLabel.accessibilityIdentifier = "ResultLabelMatching"
        } else if title == "All characters that do not match" {
            resultLabel.accessibilityIdentifier = "ResultLabelNonMatching"
        } else if title == "All unique characters from the first text field that do not match in text fields" {
            resultLabel.accessibilityIdentifier = "ResultLabelUnique"
        }
    }
}
