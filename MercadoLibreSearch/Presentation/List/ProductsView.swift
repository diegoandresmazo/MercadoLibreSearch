//
//  ProductsView.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 9/06/21.
//

import UIKit

final class ProductsView: UIView, ProductsViewType {
    lazy var searchBar: UISearchBar = {
        var searchBar = UISearchBar(frame: .zero)
        searchBar.placeholder = "Search in Mercado Libre"
        searchBar.barTintColor = .mercadoMainColor
        searchBar.searchTextField.backgroundColor = .white
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        return searchBar
    }()
    
    lazy var productsTableView: UITableView = {
        var table = UITableView(frame: .zero)
        table.separatorStyle = .none
        table.rowHeight = UITableView.automaticDimension
        table.translatesAutoresizingMaskIntoConstraints = false
        table.showsVerticalScrollIndicator = false
        
        return table
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func initialSetup() {
        addSubview(productsTableView)
        addSubview(searchBar)

        NSLayoutConstraint.activate([
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            
            productsTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 0),
            productsTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            productsTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            productsTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
