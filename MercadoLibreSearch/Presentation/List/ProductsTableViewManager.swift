//
//  ProductsTableViewManager.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 9/06/21.
//


import UIKit

public protocol TableViewManagerType: UITableViewDelegate, UITableViewDataSource {
    var tableView: UITableView { get }
    var sections: [ProductsTableViewSectionModel] { get }
}

final class ProductsTableViewManager: NSObject, TableViewManagerType {
    var tableView: UITableView
    
    public var sections: [ProductsTableViewSectionModel] = [] {
        didSet {
            updateDataSource()
        }
    }
    
    public init(tableView: UITableView, sections: [ProductsTableViewSectionModel]) {
        self.tableView = tableView
        self.sections = sections
        super.init()
        
        initialSetup()
    }
    
    private func initialSetup() {
        tableView.register(ProductsTableViewCell.self, forCellReuseIdentifier: ProductsTableViewCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        updateDataSource()
    }
    
    private func updateDataSource() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if sections.count == 0 {
            return 0
        }
        
        return sections[section].data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ProductsTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: ProductsTableViewCell.reuseIdentifier, for: indexPath) as? ProductsTableViewCell else {
            fatalError("Unable to Dequeue Reusable Collection View Cell")
        }
        
        cell.configure(with: sections[indexPath.section].data[indexPath.row])
        return cell as UITableViewCell
    }
}
