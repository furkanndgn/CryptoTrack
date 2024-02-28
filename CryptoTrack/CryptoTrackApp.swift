//
//  CryptoTrackApp.swift
//  CryptoTrack
//
//  Created by Furkan Doğan on 29.11.2023.
//

import SwiftUI

@main
struct CryptoTrackApp: App {
    
    @StateObject var vm = HomeViewModel()
    @State private var showLaunchView = true
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
        UINavigationBar.appearance().tintColor = UIColor(Color.theme.accent)
        UITableView.appearance().backgroundColor = UIColor.clear
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                
                if #available(iOS 16.0, * ){
                    NavigationStack {
                        
                        HomeView()
                            .toolbar(.hidden)
                    }
                    .environmentObject(vm)
                } else {
                    NavigationView {
                        HomeView()
                            .navigationBarHidden(true)
                    }
                    .environmentObject(vm)
                }
                
                
                ZStack {
                    if showLaunchView {
                        LaunchView(showLaunchView: $showLaunchView)
                            .transition(.move(edge: .leading))
                    }
                }
                .zIndex(2)
            }
        }
    }
}
