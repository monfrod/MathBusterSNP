//
//  tableViewCell.swift
//  MathBusterSNP
//
//  Created by yunus on 11.11.2024.
//
import UIKit

class Cell: UITableViewCell{
    
    let topLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 40, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(topLabel)
        
        NSLayoutConstraint.activate([
            topLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            topLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
