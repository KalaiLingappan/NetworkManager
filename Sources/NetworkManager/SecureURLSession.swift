//
//  SecureURLSession.swift
//  
//
//  Created by Kalaiprabha L on 30/01/24.
//

import Foundation

public class SecureURLSession {
    public static var shared: URLSession = {
        let configuration = URLSessionConfiguration.default
        let delegate = SecureSessionDelegate()
        return URLSession(configuration: configuration, delegate: delegate, delegateQueue: OperationQueue.main)
    }()
}
