//
//  SettingsView.swift
//  CryptoTrack
//
//  Created by Furkan Doğan on 13.02.2024.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    private let defaultLink = URL(string: "https://www.google.com/")!
    private let coinGeckoLink = URL(string: "https://www.coingecko.com/")!
    
    var body: some View {
        NavigationView {
            ZStack {
                // background layer
                Color.theme.background
                    .ignoresSafeArea()
                
                // content layer
                List {
                    swiftfulThinkingSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                    coinGeckoSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                    developerSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                    applicationSection
                        .listRowBackground(Color.theme.background.opacity(0.5)) 
                }
            }
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    XMarkButton()
                        .onTapGesture {
                            dismiss()
                        }
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}

extension SettingsView {
    private var swiftfulThinkingSection: some View {
        Section(header: Text("Swiftful Thinking")) {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("This app was made by following a @SwiftfulThinking course on YouTube. It uses MVVM Architecture, Combine and Core Data.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.theme.accent)
            }
            .padding(.vertical)
        }
    }
    
    private var coinGeckoSection: some View {
        Section(header: Text("CoinGecko")) {
            VStack(alignment: .leading) {
                Image("coingecko")
                    .resizable()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("This cryptocurrency data that is used in this app comes from a free API from CoinGecko! Prices may be slightly delayed.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Visit CoinGecko", destination: coinGeckoLink)
                .tint(.blue)
        }
    }
    
    private var developerSection: some View {
        Section(header: Text("Developer")) {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("This app was developed by Furkan. It uses SwiftUI and is written in 100% Swift. The project benefits from multi-threading, publishers/subscribers, and data persistance.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Visit CoinGecko", destination: coinGeckoLink)
                .tint(.blue)
        }
    }
    
    private var applicationSection: some View {
        Section(header: Text("Application")) {
            Link("Terms of Service", destination: defaultLink)
                .tint(.blue)
            Link("Privacy Policy", destination: defaultLink)
                .tint(.blue)
            Link("Company Website", destination: defaultLink)
                .tint(.blue)
            Link("Learn More", destination: defaultLink)                
                .tint(.blue)
        }
    }
}
