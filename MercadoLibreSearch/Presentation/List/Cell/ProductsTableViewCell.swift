//
//  ProductsTableViewCell.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 9/06/21.
//

import UIKit

final class ProductsTableViewCell: UITableViewCell, ConfigurableProductsCell {    
    private struct Constants {
        static let titleLabelSize: CGFloat = 16
        static let priceLabelSize: CGFloat = 20
        static let installmentsLabelSize: CGFloat = 14
        static let separatorHeight: CGFloat = 1
        static let imageSize = CGSize(width: 120, height: 120)
        static let favoriteIconSize = CGSize(width: 20, height: 20)
        static let contentBorderInsets = UIEdgeInsets(top: 20, left: 12, bottom: -20, right: -12)
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
        label.numberOfLines = 3
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.8
        label.font = .mercadoLight(withSize: Constants.titleLabelSize)
        label.textColor = .black

        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = .mercadoFont(withSize: Constants.priceLabelSize)
        label.textColor = .black

        return label
    }()

    private lazy var installmentsLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = .mercadoFont(withSize: Constants.installmentsLabelSize)
        label.textColor = .black

        return label
    }()
    
    private lazy var installmentsPriceLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = .mercadoFont(withSize: Constants.installmentsLabelSize)
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
        view.backgroundColor = .mercadoLightGrayColor
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
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
            separator.heightAnchor.constraint(equalToConstant: Constants.separatorHeight),
            
            image.topAnchor.constraint(equalTo: separator.topAnchor, constant: Constants.contentBorderInsets.top),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.contentBorderInsets.left),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: Constants.contentBorderInsets.bottom),
            image.heightAnchor.constraint(equalToConstant: Constants.imageSize.height),
            image.widthAnchor.constraint(equalToConstant: Constants.imageSize.width),
            
            titleLabel.topAnchor.constraint(equalTo: image.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: favoriteIcon.leadingAnchor, constant: -16),
            
            favoriteIcon.topAnchor.constraint(equalTo: image.topAnchor),
            favoriteIcon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.contentBorderInsets.right),
            favoriteIcon.heightAnchor.constraint(equalToConstant: Constants.favoriteIconSize.height),
            favoriteIcon.widthAnchor.constraint(equalToConstant: Constants.favoriteIconSize.width),
            
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
            priceLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            installmentsLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor),
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
        image.setImageFromURL(URL(string: data.thumbnailLink))
        setupPriceLabels(for: data)
    }
    
    private func setupPriceLabels(for data: ProductsTableViewCellModel) {
        guard let currency = data.currency else { return }
        let numberFormatter: NumberFormatter = .numberFormatterWithLocale(for: currency.id.rawValue)
        
        priceLabel.text = numberFormatter.string(for: data.price)
        
        guard let installments = data.installments, let amountString = numberFormatter.string(for: installments.amount) else {
            installmentsLabel.text = ""
            installmentsPriceLabel.text = ""
            return
        }
        
        installmentsLabel.text = "en"
        installmentsPriceLabel.text = "\(installments.quantity)x \(amountString)"
    }
}
