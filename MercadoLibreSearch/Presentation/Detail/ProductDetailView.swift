//
//  ProductDetailView.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 13/06/21.
//

import UIKit

final class ProductDetailView: UIView, ProductDetailViewType {
    private struct Constants {
        static let containerStackSpacing: CGFloat = 20
        static let containerStackBorderInsets = UIEdgeInsets(top: 16, left: 16, bottom: -16, right: -16)
        static let conditionLabelSize: CGFloat = 14
        static let soldProductsLabelSize: CGFloat = 14
        static let separatorHeight: CGFloat = 10
        static let titleLabelSize: CGFloat = 18
        static let priceLabelSize: CGFloat = 40
        static let installmentsLabelSize: CGFloat = 18
        static let imageHeight: CGFloat = 320
    }
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    private lazy var containerStackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.axis = .vertical
        view.alignment = .fill
        view.spacing = Constants.containerStackSpacing
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var conditionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 1
        label.font = .mercadoFont(withSize: Constants.conditionLabelSize)
        label.textColor = .mercadoMediumGrayColor
        label.textAlignment = .left
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var conditionSeparatorView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .mercadoMediumGrayColor
        view.isHidden = true
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var soldProductsLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 1
        label.font = .mercadoFont(withSize: Constants.soldProductsLabelSize)
        label.textColor = .mercadoMediumGrayColor
        label.textAlignment = .left
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 3
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.8
        label.font = .mercadoFont(withSize: Constants.titleLabelSize)
        label.textColor = .mercadoGrayColor
        label.textAlignment = .left
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var image: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.contentMode = .scaleAspectFit
        
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.8
        label.font = .mercadoLight(withSize: Constants.priceLabelSize)
        label.textColor = .mercadoGrayColor
        label.textAlignment = .left
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var installmentsLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 1
        label.font = .mercadoLight(withSize: Constants.installmentsLabelSize)
        label.textColor = .mercadoGrayColor
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var installmentsPriceLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 1
        label.font = .mercadoLight(withSize: Constants.installmentsLabelSize)
        label.textColor = .mercadoGreenColor
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stockLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 1
        label.font = .mercadoHeavy(withSize: Constants.installmentsLabelSize)
        label.text = "Stock disponible"
        label.textColor = .mercadoGrayColor
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var availableQuantityContainer: UIView = {
        let view = UIView(frame: .zero)
        view.layer.cornerRadius = 4.0
        view.layer.masksToBounds = false
        view.backgroundColor = .mercadoDetailContainerColor
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var availableQuantityLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 1
        label.textAlignment = .left
        label.backgroundColor = .mercadoDetailContainerColor
        label.font = .mercadoFont(withSize: Constants.installmentsLabelSize)
        label.textColor = .mercadoGrayColor
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var sellerView = SellerView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func initialSetup() {
        backgroundColor = .white
        addSubview(scrollView)
        scrollView.addSubview(containerStackView)
        
        let conditionInformationView = setupConditionInformation()
        let mainInformationView = setupMainInformation()
        let priceInformationView = setupPriceInformation()
        let stockInformationView = setupStockInformation()
        
        containerStackView.addArrangedSubview(conditionInformationView)
        containerStackView.setCustomSpacing(8, after: conditionInformationView)
        containerStackView.addArrangedSubview(mainInformationView)
        containerStackView.addArrangedSubview(priceInformationView)
        containerStackView.addArrangedSubview(stockInformationView)
        containerStackView.addArrangedSubview(sellerView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            containerStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: Constants.containerStackBorderInsets.top),
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.containerStackBorderInsets.left),
            containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.containerStackBorderInsets.right),
            containerStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: Constants.containerStackBorderInsets.bottom),
        ])
    }
    
    private func setupConditionInformation() -> UIView {
        let conditionContainer = UIView()
        conditionContainer.translatesAutoresizingMaskIntoConstraints = false
        
        conditionContainer.addSubview(conditionLabel)
        conditionContainer.addSubview(conditionSeparatorView)
        conditionContainer.addSubview(soldProductsLabel)
        
        NSLayoutConstraint.activate([
            conditionLabel.topAnchor.constraint(equalTo: conditionContainer.topAnchor),
            conditionLabel.leadingAnchor.constraint(equalTo: conditionContainer.leadingAnchor),
            conditionLabel.bottomAnchor.constraint(equalTo: conditionContainer.bottomAnchor),
            
            conditionSeparatorView.leadingAnchor.constraint(equalTo: conditionLabel.trailingAnchor, constant: 6),
            conditionSeparatorView.centerYAnchor.constraint(equalTo: conditionLabel.centerYAnchor),
            conditionSeparatorView.widthAnchor.constraint(equalToConstant: 1),
            conditionSeparatorView.heightAnchor.constraint(equalToConstant: Constants.separatorHeight),
            
            soldProductsLabel.topAnchor.constraint(equalTo: conditionLabel.topAnchor),
            soldProductsLabel.leadingAnchor.constraint(equalTo: conditionSeparatorView.trailingAnchor, constant: 6),
            soldProductsLabel.bottomAnchor.constraint(equalTo: conditionLabel.bottomAnchor),
        ])
        
        return conditionContainer
    }
    
    private func setupMainInformation() -> UIView {
        let mainInformationContainer = UIView()
        mainInformationContainer.translatesAutoresizingMaskIntoConstraints = false
        
        mainInformationContainer.addSubview(titleLabel)
        mainInformationContainer.addSubview(image)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: mainInformationContainer.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: mainInformationContainer.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: mainInformationContainer.trailingAnchor),
            
            image.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            image.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            image.heightAnchor.constraint(equalToConstant: Constants.imageHeight),
            image.bottomAnchor.constraint(equalTo: mainInformationContainer.bottomAnchor),
        ])
        
        return mainInformationContainer
    }
    
    private func setupPriceInformation() -> UIView {
        let priceInformationContainer = UIView()
        priceInformationContainer.translatesAutoresizingMaskIntoConstraints = false
        
        priceInformationContainer.addSubview(priceLabel)
        priceInformationContainer.addSubview(installmentsLabel)
        priceInformationContainer.addSubview(installmentsPriceLabel)
        
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: priceInformationContainer.topAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: priceInformationContainer.leadingAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: priceInformationContainer.trailingAnchor),
            
            installmentsLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor),
            installmentsLabel.leadingAnchor.constraint(equalTo: priceInformationContainer.leadingAnchor),
            installmentsLabel.bottomAnchor.constraint(equalTo: priceInformationContainer.bottomAnchor),
            
            installmentsPriceLabel.topAnchor.constraint(equalTo: installmentsLabel.topAnchor),
            installmentsPriceLabel.leadingAnchor.constraint(equalTo: installmentsLabel.trailingAnchor, constant: 4),
            installmentsPriceLabel.bottomAnchor.constraint(equalTo: installmentsLabel.bottomAnchor),
        ])
        
        return priceInformationContainer
    }
    
    private func setupStockInformation() -> UIView {
        let stockInformationContainer = UIView()
        stockInformationContainer.translatesAutoresizingMaskIntoConstraints = false
        
        stockInformationContainer.addSubview(stockLabel)
        stockInformationContainer.addSubview(availableQuantityContainer)
        availableQuantityContainer.addSubview(availableQuantityLabel)
        
        NSLayoutConstraint.activate([
            stockLabel.topAnchor.constraint(equalTo: stockInformationContainer.topAnchor),
            stockLabel.leadingAnchor.constraint(equalTo: stockInformationContainer.leadingAnchor),
            stockLabel.trailingAnchor.constraint(equalTo: stockInformationContainer.trailingAnchor),
            
            availableQuantityContainer.topAnchor.constraint(equalTo: stockLabel.bottomAnchor, constant: 12),
            availableQuantityContainer.leadingAnchor.constraint(equalTo: stockInformationContainer.leadingAnchor),
            availableQuantityContainer.trailingAnchor.constraint(equalTo: stockInformationContainer.trailingAnchor),
            availableQuantityContainer.heightAnchor.constraint(equalToConstant: 50),
            availableQuantityContainer.bottomAnchor.constraint(equalTo: stockInformationContainer.bottomAnchor),

            availableQuantityLabel.leadingAnchor.constraint(equalTo: availableQuantityContainer.leadingAnchor, constant: 12),
            availableQuantityLabel.centerYAnchor.constraint(equalTo: availableQuantityContainer.centerYAnchor),
        ])
        
        return stockInformationContainer
    }
    
    func showErrorRetrievingDetailInfo(for product: ProductEntity) {
        image.setImageFromURL(URL(string: product.thumbnailLink))
        sellerView.showErrorRetrievingDetailInfo()
    }
    
    func configureView(with product: ProductEntity) {
        guard let currency = product.currency else { return }
        let numberFormatter: NumberFormatter = .numberFormatterWithLocale(for: currency.id.rawValue)
        
        sellerView.showLoadingSeller()
        
        titleLabel.text = product.title
        priceLabel.text = numberFormatter.string(for: product.price)
        conditionLabel.text = product.condition.rawValue
        setupSoldQuantityLabel(for: product.soldQuantity)
        setupAvailableQuantityLabel(for: product.availableQuantity)
        
        guard let productInfo = product.detailInfo, let seller = productInfo.seller else { return }
        image.setImageFromURL(URL(string: productInfo.imageLink))
        sellerView.stopLoadingSeller()
        setupSellerInfo(for: seller)
        
        guard let installments = product.installments, let amountString = numberFormatter.string(for: installments.amount) else { return }
        installmentsLabel.text = "en"
        installmentsPriceLabel.text = "\(installments.quantity)x \(amountString)"
    }
    
    private func setupSoldQuantityLabel(for quantity: Int) {
        if quantity != 0 {
            conditionSeparatorView.isHidden = false
            let quantityString = String (quantity)
            let soldedString = quantity > 1 ? "vendidos" : "vendido"
            soldProductsLabel.text = "\(quantityString) \(soldedString)"
        }
    }
    
    private func setupAvailableQuantityLabel(for quantity: Int) {
        if quantity != 0 {
            let quantityString = String (quantity)
            let availableString = quantity > 1 ? "disponibles" : "disponible"
            availableQuantityLabel.text = "\(quantityString) \(availableString)"
        }
    }
    
    private func setupSellerInfo(for seller: SellerEntity) {
        sellerView.setupSellerInfo(for: seller)
    }
}
