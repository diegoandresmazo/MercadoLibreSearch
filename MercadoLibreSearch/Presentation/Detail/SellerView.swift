//
//  SellerView.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 14/06/21.
//

import Foundation
import UIKit

final class SellerView: UIView {
    private struct Constants {
        static let labelsSize: CGFloat = 18
    }
    
    private lazy var sellerLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        label.font = .mercadoHeavy(withSize: Constants.labelsSize)
        label.text = "Información sobre el vendedor"
        label.textColor = .mercadoGrayColor
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var sellerContainer: UIView = {
        let view = UIView(frame: .zero)
        view.layer.cornerRadius = 4.0
        view.layer.masksToBounds = false
        view.isHidden = true
        view.backgroundColor = .mercadoDetailContainerColor
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var sellerSpinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(frame: .zero)
        spinner.style = .large
        spinner.color = .mercadoBlueColor
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        
        return spinner
    }()
    
    private lazy var sellerErrorContainer: UIView = {
        let view = UIView(frame: .zero)
        view.layer.cornerRadius = 4.0
        view.layer.masksToBounds = false
        view.isHidden = true
        view.backgroundColor = .mercadoDetailContainerColor
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var sellerErrorLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.8
        label.font = .mercadoFont(withSize: Constants.labelsSize)
        label.textColor = .mercadoGrayColor
        label.textAlignment = .center
        label.text = "¡Hubo un error cargando la información del Vendedor! Por favor intente nuevamente"
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var sellerNickname: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.8
        label.font = .mercadoFont(withSize: Constants.labelsSize)
        label.textColor = .mercadoGrayColor
        label.textAlignment = .left
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var sellerAddressTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 1
        label.text = "Ciudad:"
        label.font = .mercadoHeavy(withSize: Constants.labelsSize)
        label.textColor = .mercadoGrayColor
        label.textAlignment = .left
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var sellerAddress: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.8
        label.font = .mercadoFont(withSize: Constants.labelsSize)
        label.textColor = .mercadoGrayColor
        label.textAlignment = .left
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialSetup() {
        addSubview(sellerLabel)
        addSubview(sellerSpinner)
        addSubview(sellerContainer)
        addSubview(sellerErrorContainer)
        
        sellerErrorContainer.addSubview(sellerErrorLabel)
        sellerContainer.addSubview(sellerNickname)
        sellerContainer.addSubview(sellerAddressTitle)
        sellerContainer.addSubview(sellerAddress)
        
        NSLayoutConstraint.activate([
            sellerLabel.topAnchor.constraint(equalTo: topAnchor),
            sellerLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            sellerLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            sellerSpinner.centerXAnchor.constraint(equalTo: sellerContainer.centerXAnchor),
            sellerSpinner.centerYAnchor.constraint(equalTo: sellerContainer.centerYAnchor),
            
            sellerContainer.topAnchor.constraint(equalTo: sellerLabel.bottomAnchor, constant: 12),
            sellerContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            sellerContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            sellerContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            sellerErrorContainer.topAnchor.constraint(equalTo: sellerLabel.bottomAnchor, constant: 12),
            sellerErrorContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            sellerErrorContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            sellerErrorContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            sellerErrorLabel.topAnchor.constraint(equalTo: sellerErrorContainer.topAnchor, constant: 12),
            sellerErrorLabel.leadingAnchor.constraint(equalTo: sellerErrorContainer.leadingAnchor, constant: 12),
            sellerErrorLabel.trailingAnchor.constraint(equalTo: sellerErrorContainer.trailingAnchor, constant: -12),
            sellerErrorLabel.bottomAnchor.constraint(equalTo: sellerErrorContainer.bottomAnchor, constant: -12),
            
            sellerNickname.topAnchor.constraint(equalTo: sellerContainer.topAnchor, constant: 12),
            sellerNickname.leadingAnchor.constraint(equalTo: sellerContainer.leadingAnchor, constant: 12),
            sellerNickname.trailingAnchor.constraint(equalTo: sellerContainer.trailingAnchor, constant: -12),
            
            sellerAddressTitle.topAnchor.constraint(equalTo: sellerNickname.bottomAnchor, constant: 12),
            sellerAddressTitle.leadingAnchor.constraint(equalTo: sellerNickname.leadingAnchor),
            sellerAddressTitle.bottomAnchor.constraint(equalTo: sellerContainer.bottomAnchor, constant: -12),
            
            sellerAddress.topAnchor.constraint(equalTo: sellerAddressTitle.topAnchor),
            sellerAddress.leadingAnchor.constraint(equalTo: sellerAddressTitle.trailingAnchor, constant: 6),
            sellerAddress.bottomAnchor.constraint(equalTo: sellerAddressTitle.bottomAnchor),
        ])
    }
    
    func showErrorRetrievingDetailInfo() {
        sellerSpinner.stopAnimating()
        sellerErrorContainer.isHidden = false
    }
    
    func showLoadingSeller() {
        sellerSpinner.startAnimating()
    }
    
    func stopLoadingSeller() {
        sellerSpinner.stopAnimating()
    }
    
    func setupSellerInfo(for seller: SellerEntity) {
        sellerContainer.isHidden = false
        sellerNickname.text = seller.nickname
        sellerAddress.text = seller.addressCity
    }
}
