import UIKit

class SetButtonView: UIView {

    let button = UIButton(type: .system)
    let resultLabel = UILabel()
    private let title: String
    
    var buttonAction: (() -> Void)?
    
    init(_ title: String) {
        self.title = title
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        setupButton()
        setupResultLabel()
    }
    
    func setupButton() {
        button.setTitle(title, for: .normal)
        
        addSubview(button)
        button.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
        }
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
        
    func setupResultLabel() {
        resultLabel.text = ""
        resultLabel.textAlignment = .center
        resultLabel.isHidden = true
        
        addSubview(resultLabel)
        resultLabel.snp.makeConstraints {
            $0.top.equalTo(button.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.greaterThanOrEqualToSuperview()
        }
    }
    
    @objc private func buttonTapped() {
        buttonAction?()
    }
}
