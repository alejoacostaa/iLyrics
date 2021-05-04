//
//  NetworkMonitor.swift
//  iLyrics
//
//  Created by Alejo Acosta on 03/05/2021.
//

import Foundation
import Network


//Class dedicated to checking wether the user has an active internet connection or not
final class NetworkMonitor {
    static let shared = NetworkMonitor()
    
    private let queue = DispatchQueue.global()
    
    
    private let monitor : NWPathMonitor
    
    
    public private(set) var isConnected : Bool = false
    
    init() {
        self.monitor = NWPathMonitor()
    }
    
    
    public func startMonitoring() {
        monitor.start(queue: queue)
        monitor.pathUpdateHandler = { [weak self] path in
            self?.isConnected = path.status == .satisfied
        }
    }
    
    public func stopMonitoring() {
        monitor.cancel()
    }
}
