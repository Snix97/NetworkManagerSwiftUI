//
//  NetworkManager.swift
//  NetworkManagerSwiftUI
//
//  Created by Claire Roughan on 10/09/2024.
//

import Foundation
import Network

//ObservableObject needed so we can listen for changes to update the UI
class NetworkManager: ObservableObject {
    
    @Published var isConnected = true //ContentView will listen for changes on this property
    
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "NetworkManager")
    
    //Computer properties
    var connectionDescription: String {
        if isConnected {
            return "Internet connection looks good!"
        } else {
            return "It looks like your not connected to the internet.  Please check your settings and retry"
        }
    }
    
    var connectionImageName: String {
        return isConnected ? "wifi" : "wifi.slash"
    }
    
    init() {
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isConnected = path.status == .satisfied
            }
        }
        monitor.start(queue: queue)
    }
    
    
}
