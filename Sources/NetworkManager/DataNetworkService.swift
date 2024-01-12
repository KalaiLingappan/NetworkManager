//
//  DataNetworkService.swift
//
//
//  Created by Kalaiprabha L on 02/01/24.
//

import Foundation


public protocol NetworkService {
    func fetchDataFor<Request: DataRequest>(request: Request) async throws -> Request.ResponseData?
}

public final class DataNetworkService: NetworkService {
    var urlSession: URLSession
    
    public init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    public func fetchDataFor<Request: DataRequest>(request: Request) async throws -> Request.ResponseData? {
        guard let urlRequest = request.getURLRequest() else {
            throw ErrorResponse.invalidURL
        }
        
        let (data,response) =  try await urlSession.data(for: urlRequest)
        guard let response = response as? HTTPURLResponse else {
            throw ErrorResponse.noResponse
        }
        
        switch response.statusCode {
        case 200...299:
            return try request.decode(data)
        case 401:
            throw ErrorResponse.unauthorized
        default:
            throw ErrorResponse.unexpectedStatusCode
        }
    }
}
