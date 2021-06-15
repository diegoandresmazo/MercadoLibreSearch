//
//  Networking.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 8/06/21.
//

import Foundation
import Combine

public protocol APIServiceType {
    func call<T: Decodable>(_ request: URLRequest, type: T.Type) -> AnyPublisher<T, CloudError>
}

struct APIService: APIServiceType {
    func call<T: Decodable>(_ request: URLRequest, type: T.Type) -> AnyPublisher<T, CloudError> {
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .mapError({ urlError in
                return CloudError.server(error: urlError)
            })
            .tryMap { result -> T in
                let decoder = JSONDecoder()
                return try decoder.decode(T.self, from: result.data)
            }
            .mapError({ error in
                return CloudError.decode(error: error)
            })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
