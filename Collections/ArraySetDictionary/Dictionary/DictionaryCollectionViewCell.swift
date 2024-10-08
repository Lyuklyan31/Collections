import UIKit
import SnapKit

// MARK: - CollectionViewCell
class DictionaryCollectionViewCell: UICollectionViewCell {
    
    let button = UIButton()
    var buttonAction: (() -> Void)?
    var loading = UIActivityIndicatorView()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Button
    private func setupSubViews() {
        contentView.addSubview(loading)
        loading.style = .medium
        loading.hidesWhenStopped = true
        
        loading.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.width.equalTo(100)
        }
        
        contentView.addSubview(button)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        
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
