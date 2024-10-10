import UIKit
import SnapKit

// MARK: - CollectionViewCell
class DictionaryCollectionViewCell: UICollectionViewCell {
    
    var resultLabel = UILabel()
    var loadingIndicator = UIActivityIndicatorView()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Subviews
    private func setupSubViews() {
        // MARK: - Setup Cell
        backgroundColor = .black.withAlphaComponent(0.3)
        layer.borderWidth = 0.2
        layer.borderColor = UIColor.black.cgColor
        
        // MARK: - Setup loadingIndicator
        contentView.addSubview(loadingIndicator)
        loadingIndicator.style = .medium
        loadingIndicator.hidesWhenStopped = true
        
        loadingIndicator.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.width.equalTo(100)
        }
        // MARK: - Setup resultLabel
        contentView.addSubview(resultLabel)
        resultLabel.textColor = .systemBlue
        resultLabel.font = UIFont.systemFont(ofSize: 15)
        resultLabel.numberOfLines = 0
        resultLabel.textAlignment = .left
        
        resultLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(8)
            $0.verticalEdges.equalToSuperview()
        }
    }
    
    // MARK: - Configuration Cell Result
    func configureCellResult(with title: String) {
        resultLabel.text = title
        resultLabel.textColor = .black
        backgroundColor = .black.withAlphaComponent(0.1)
    }
    
    // MARK: - Loading State
    func startLoading() {
        loadingIndicator.startAnimating()
        resultLabel.isHidden = true
    }
    
    func stopLoading() {
        loadingIndicator.stopAnimating()
        resultLabel.isHidden = false
    }
    
    // MARK: -  Configuration Cell
    func configureCell(with title: String, indexPath: Int) {
        resultLabel.text = title
        resultLabel.textColor = .systemBlue
    }
}
