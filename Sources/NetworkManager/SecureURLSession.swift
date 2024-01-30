//
//  SecureURLSession.swift
//  
//
//  Created by Kalaiprabha L on 30/01/24.
//

import Foundation

public class SecureURLSession: URLSession {
    public override class var shared: URLSession {
        URLSession(configuration: URLSessionConfiguration.default, delegate: SecureSessionDelegate(), delegateQueue: OperationQueue.main)
    }
}
