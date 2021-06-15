//
//  ProductsView.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 9/06/21.
//

import UIKit

enum ProductsViewStatus {
    case showLoadingSearch
    case showProducts
    case showNotResults
    case showError
}

final class ProductsView: UIView, ProductsViewType {
    private struct Constants {
        static let notResultsTitleLabelSize: CGFloat = 22
        static let notResultsMessageLabelSize: CGFloat = 16
        static let notResultsIconSize = CGSize(width: 100, height: 100)
    }
    
    lazy var searchBar: UISearchBar = {
        var searchBar = UISearchBar(frame: .zero)
        searchBar.placeholder = "Buscar en Mercado Libre"
        searchBar.barTintColor = .mercadoMainColor
        searchBar.searchTextField.backgroundColor = .white
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        return searchBar
    }()
    
    lazy var productsTableView: UITableView = {
        var table = UITableView(frame: .zero)
        table.separatorStyle = .none
        table.backgroundColor = .mercadoBackgroundColor
        table.rowHeight = UITableView.automaticDimension
        table.translatesAutoresizingMaskIntoConstraints = false
        table.showsVerticalScrollIndicator = false
        
        return table
    }()
    
    private lazy var informationStack: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.alignment = .fill
        view.axis = .vertical
        view.spacing = 5
        view.distribution = .fill
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    
    private lazy var informationIconContainer: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    
    private lazy var informationIcon: UIImageView = {
        let icon = UIImageView(frame: .zero)
        icon.contentMode = .scaleAspectFit
        icon.image = Icons.System.searchIcon
        icon.tintColor = .mercadoLightGrayColor
        icon.translatesAutoresizingMaskIntoConstraints = false

        return icon
    }()
    
    private lazy var informationTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.8
        label.font = .mercadoLight(withSize: Constants.notResultsTitleLabelSize)
        label.textColor = .black
        label.textAlignment = .center

        return label
    }()
    
    private lazy var informationMessageLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        label.sizeToFit()
        label.font = .mercadoFont(withSize: Constants.notResultsMessageLabelSize)
        label.textColor = .mercadoGrayColor
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(frame: .zero)
        spinner.style = .large
        spinner.color = .mercadoBlueColor
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        
        return spinner
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func initialSetup() {
        backgroundColor = .mercadoBackgroundColor
        addSubview(productsTableView)
        addSubview(searchBar)
        addSubview(spinner)

        NSLayoutConstraint.activate([
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            
            productsTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            productsTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            productsTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            productsTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
        
        setupNotResultsStack()
    }
    
    private func setupNotResultsStack() {
        addSubview(informationStack)
        informationStack.addArrangedSubview(informationIconContainer)
        informationStack.setCustomSpacing(20, after: informationIconContainer)
        informationStack.addArrangedSubview(informationTitleLabel)
        informationStack.addArrangedSubview(informationMessageLabel)
        informationIconContainer.addSubview(informationIcon)
        
        NSLayoutConstraint.activate([
            informationStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            informationStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            informationStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            informationIcon.topAnchor.constraint(equalTo: informationIconContainer.topAnchor),
            informationIcon.centerXAnchor.constraint(equalTo: informationIconContainer.centerXAnchor),
            informationIcon.bottomAnchor.constraint(equalTo: informationIconContainer.bottomAnchor),
            informationIcon.heightAnchor.constraint(equalToConstant: Constants.notResultsIconSize.height),
            informationIcon.widthAnchor.constraint(equalToConstant: Constants.notResultsIconSize.width),
        ])
    }
    
    /**
     * The view is configured depending if the products are loaded, there are no results or there are errors.
     */
    func setupView(for status: ProductsViewStatus) {
        switch status {
        case .showLoadingSearch:
            productsTableView.isHidden = true
            informationStack.isHidden = true
            
            spinner.startAnimating()
            
        case .showProducts:
            productsTableView.isHidden = false
            informationStack.isHidden = true
            
            spinner.stopAnimating()
            
        case .showNotResults:
            productsTableView.isHidden = true
            informationStack.isHidden = false
            setupInformation(for: .showNotResults)
            spinner.stopAnimating()
            
        case .showError:
            productsTableView.isHidden = true
            informationStack.isHidden = false
            setupInformation(for: .showError)
        
            spinner.stopAnimating()
        }
    }
    
    private func setupInformation(for status: ProductsViewStatus) {
        if status == .showNotResults {
            informationTitleLabel.text = "No encontramos publicaciones"
            informationMessageLabel.text = "Revisa que la palabra esté bien escrita. También puedes probar con menos términos o más generales."
            informationIcon.image = Icons.System.searchIcon
        } else if status == .showError {
            informationTitleLabel.text = "¡Error buscando productos!"
            informationMessageLabel.text = "Hubo un error mientras buscamos tus productos, por favor intenta nuevamente."
            informationIcon.image = Icons.System.errorIcon
        }
    }
}
