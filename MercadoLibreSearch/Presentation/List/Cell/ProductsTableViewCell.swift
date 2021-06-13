//
//  ProductsTableViewCell.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 9/06/21.
//

import UIKit

final class ProductsTableViewCell: UITableViewCell, ConfigurableProductsCell {    
    private struct Constants {
//        TO-DO: Add constants.
//        static let iconSize = CGSize(width: 120, height: 120)
    }
    
    private lazy var image: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false

        return image
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .mercadoLight(withSize: 16)
        label.textColor = .black

        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.sizeToFit()
        label.font = .mercadoFont(withSize: 20)
        label.textColor = .black

        return label
    }()

    private lazy var installmentsLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.sizeToFit()
        label.font = .mercadoFont(withSize: 14)
        label.textColor = .black

        return label
    }()
    
    private lazy var installmentsPriceLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.sizeToFit()
        label.font = .mercadoFont(withSize: 14)
        label.textColor = .mercadoGreenColor

        return label
    }()
    
    private lazy var favoriteIcon: UIImageView = {
        let icon = UIImageView(frame: .zero)
        icon.contentMode = .scaleAspectFit
        icon.image = Icons.System.heart
        icon.tintColor = .mercadoBlueColor
        icon.translatesAutoresizingMaskIntoConstraints = false

        return icon
    }()

    private lazy var separator: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor.lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none

        backgroundColor = .white
        contentView.addSubview(image)
        contentView.addSubview(titleLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(installmentsLabel)
        contentView.addSubview(installmentsPriceLabel)
        contentView.addSubview(favoriteIcon)
        contentView.addSubview(separator)

        NSLayoutConstraint.activate([
            separator.topAnchor.constraint(equalTo: contentView.topAnchor),
            separator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            separator.heightAnchor.constraint(equalToConstant: 1),
            
            image.topAnchor.constraint(equalTo: separator.topAnchor, constant: 20),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            image.widthAnchor.constraint(equalToConstant: 120),
            image.heightAnchor.constraint(equalToConstant: 120),
            
            titleLabel.topAnchor.constraint(equalTo: image.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: favoriteIcon.leadingAnchor, constant: -16),
            
            favoriteIcon.topAnchor.constraint(equalTo: image.topAnchor),
            favoriteIcon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            favoriteIcon.heightAnchor.constraint(equalToConstant: 20),
            favoriteIcon.widthAnchor.constraint(equalToConstant: 20),
            
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
            priceLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            installmentsLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 0),
            installmentsLabel.leadingAnchor.constraint(equalTo: priceLabel.leadingAnchor),
            
            installmentsPriceLabel.topAnchor.constraint(equalTo: installmentsLabel.topAnchor),
            installmentsPriceLabel.leadingAnchor.constraint(equalTo: installmentsLabel.trailingAnchor, constant: 2),
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with data: ProductsTableViewCellModel) {
        titleLabel.text = data.name
        setupPrices(for: data)
        image.setImageFromURL(URL(string: data.imageLink))
    }
    
    private func setupPrices(for data: ProductsTableViewCellModel) {
        guard let currency = data.currency else { return }
        
        let numberFormatter = NumberFormatter()
        let locale = Locale(identifier: currency.id.rawValue)
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = locale
        
        priceLabel.text = numberFormatter.string(for: data.price)
        
        guard let installments = data.installments, let amountString = numberFormatter.string(for: installments.amount) else { return }
        
        installmentsLabel.text = "en"
        installmentsPriceLabel.text = "\(installments.quantity)x \(amountString)"
    }
}
