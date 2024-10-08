import UIKit
import SnapKit

// MARK: - CollectionViewCell
class DictionaryCollectionViewCell: UICollectionViewCell {
    
    let button = UIButton(type: .system)
    var buttonAction: (() -> Void)?
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Button
    private func setupButton() {
        contentView.addSubview(button)
        
        button.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(8)
            $0.verticalEdges.equalToSuperview()
        }
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    // MARK: - Button Action
    @objc private func buttonTapped() {
        buttonAction?()
    }
}
