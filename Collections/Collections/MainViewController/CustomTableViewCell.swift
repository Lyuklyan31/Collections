//
//  CustomTableViewCell.swift
//  Collections
//
//  Created by Mac on 11.10.2024.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    let label = UILabel()
    let image = UIImageView()
    
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
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        
        contentView.addSubview(label)
        
        label.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.lessThanOrEqualToSuperview()
            $0.verticalEdges.equalToSuperview().inset(8)
        }
        
        image.image = UIImage(systemName: "chevron.forward")
        image.contentMode = .scaleAspectFit
        image.tintColor = .systemGray
        contentView.addSubview(image)
        
        image.translatesAutoresizingMaskIntoConstraints = false
        
        image.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-16)
            $0.leading.greaterThanOrEqualToSuperview()
            $0.verticalEdges.equalToSuperview().inset(8)
        }
    }
    
    // MARK: - Configuration
    func configure(with title: String) {
        label.text = title
    }
}
