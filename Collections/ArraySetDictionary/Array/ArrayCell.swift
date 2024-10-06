import UIKit
import SnapKit

class ArrayCollectionViewCell: UICollectionViewCell {
    
    let button = UIButton(type: .system)
    var buttonAction: (() -> Void)?
    var loading = UIActivityIndicatorView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubViews() {
        contentView.addSubview(loading)
        loading.style = .medium
        loading.hidesWhenStopped = true
        
        loading.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.width.equalTo(100)
        }
        
        contentView.addSubview(button)
        
        button.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(8)
            $0.verticalEdges.equalToSuperview()
            $0.height.equalToSuperview()
        }
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.isHidden = !loading.isHidden
    }

    
    @objc private func buttonTapped() {
        button.isEnabled = false
        button.setTitleColor(.black, for: .disabled)
        buttonAction?()
    }
}
