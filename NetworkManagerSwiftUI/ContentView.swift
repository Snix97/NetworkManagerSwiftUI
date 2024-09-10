//
//  ContentView.swift
//  NetworkManagerSwiftUI
//
//  Created by Claire Roughan on 10/09/2024.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        ZStack {
            Color(.systemBlue).ignoresSafeArea()
            
            if !networkManager.isConnected {
                Color(.systemRed).ignoresSafeArea()
            }
           
            
            VStack {
                Image(systemName:networkManager.connectionImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    //.foregroundColor(.white)
                
                Text(networkManager.connectionDescription)
                    .font(.system(size: 24))
                    .padding()
                    //.foregroundColor(.white)
                
                if !networkManager.isConnected {
                    Button {
                        // Action not really needed here as NetworkManager monitor will constantly be polling.  But could some specific login here
                        print("Handle action")
                    } label: {
                        Text("Retry")
                            .padding()
                            .font(.headline)
                            .foregroundColor(Color(.systemBlue))
                    }
                    .frame(width: 140)
                    .background(.white)
                    .clipShape(.capsule)
                    .padding()
                }
                
            }
            .foregroundColor(.white)
        }
       
    }
}

#Preview {
    ContentView()
}
