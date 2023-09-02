//
//  CollectionViewCell.swift
//  lesson 303
//
//  Created by Garib Agaev on 01.09.2023.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    let labelCounty = UILabel()
    let labelHour = UILabel()
    let labelStatus = UILabel()
    let tempLabel = UILabel()
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        setupCell()
//        Почему это не работает?
//    }
    
    func setupCell() {
        contentView.layer.cornerRadius = 10
        contentView.backgroundColor = .systemBlue
        addSublavel()
        setup(lable: labelCounty, .left, fontSize: 20)
        setup(lable: labelHour, .left, fontSize: 10)
        setup(lable: labelStatus, .left, fontSize: 15)
        setup(lable: tempLabel, .center, fontSize: 50)
        setupConstrants()
    }
    
    private func addSublavel() {
        [labelCounty, labelHour, labelStatus, tempLabel].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setup(lable: UILabel, _ alignment: NSTextAlignment, fontSize: CGFloat) {
        lable.textAlignment = alignment
        lable.font = .systemFont(ofSize: fontSize)
    }
    
    private func setupConstrants() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(
                item: labelCounty, attribute: .leading,
                relatedBy: .equal,
                toItem: contentView, attribute: .leading,
                multiplier: 1, constant: 16
            ),
            NSLayoutConstraint(
                item: labelCounty, attribute: .top,
                relatedBy: .equal,
                toItem: contentView, attribute: .top,
                multiplier: 1, constant: 16
            ),
            NSLayoutConstraint(
                item: labelHour, attribute: .leading,
                relatedBy: .equal,
                toItem: contentView, attribute: .leading,
                multiplier: 1, constant: 16
            ),
            NSLayoutConstraint(
                item: labelHour, attribute: .top,
                relatedBy: .equal,
                toItem: labelCounty, attribute: .bottom,
                multiplier: 1, constant: 0
            ),
            NSLayoutConstraint(
                item: labelStatus, attribute: .leading,
                relatedBy: .equal,
                toItem: contentView, attribute: .leading,
                multiplier: 1, constant: 16
            ),
            NSLayoutConstraint(
                item: labelStatus, attribute: .bottom,
                relatedBy: .equal,
                toItem: contentView, attribute: .bottom,
                multiplier: 1, constant: -16
            ),
            NSLayoutConstraint(
                item: tempLabel, attribute: .trailing,
                relatedBy: .equal,
                toItem: contentView, attribute: .trailing,
                multiplier: 1, constant: -16
            ),
            NSLayoutConstraint(
                item: tempLabel, attribute: .top,
                relatedBy: .equal,
                toItem: contentView, attribute: .top,
                multiplier: 1, constant: 16
            )
        ])
    }
}
