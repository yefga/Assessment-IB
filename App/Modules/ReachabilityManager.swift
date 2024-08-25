//
//  ReachabilityManager.swift
//  App
//
//  Created by Yefga on 25/08/24.
//

import Foundation
import Network

class ReachabilityManager {
    static let shared = ReachabilityManager()
    private let networkMonitor = NWPathMonitor()
    private let workerQueue = DispatchQueue(label: "ReachabilityManager")
    private(set) var isNetworkAvailable = false
    
    private init() {
        setupNetworkMonitor()
    }
    
    private func setupNetworkMonitor() {
        networkMonitor.pathUpdateHandler = { [weak self] path in
            self?.isNetworkAvailable = path.status == .satisfied
        }
        networkMonitor.start(queue: workerQueue)
    }
    
    deinit {
        networkMonitor.cancel()
    }
}
