import UIKit

// MARK: - CustomTableViewCell
class CustomTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    let cellLabel = UILabel()
    let chevronImage = UIImageView()
    
    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup
    private func setupSubViews() {
        cellLabel.font = UIFont.systemFont(ofSize: 16)
        cellLabel.textColor = .black
        
        contentView.addSubview(cellLabel)
        
        cellLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.lessThanOrEqualToSuperview()
            $0.verticalEdges.equalToSuperview().inset(8)
        }
        
        chevronImage.image = UIImage(systemName: "chevron.forward")
        chevronImage.contentMode = .scaleAspectFit
        chevronImage .tintColor = .systemGray
        contentView.addSubview(chevronImage)
        
        chevronImage.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-16)
            $0.leading.greaterThanOrEqualToSuperview()
            $0.verticalEdges.equalToSuperview().inset(8)
        }
    }
    
    // MARK: - Configuration
    func configure(with title: String) {
        cellLabel.text = title
    }
}
