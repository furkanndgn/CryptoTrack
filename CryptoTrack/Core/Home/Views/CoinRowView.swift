//
//  CoinRowView.swift
//  CryptoTrack
//
//  Created by Furkan Doğan on 20.01.2024.
//

import SwiftUI

struct CoinRowView: View {
    let coin: Coin
    let showinHoldingsColumn: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            leftColumn
            
            Spacer()
            
            if showinHoldingsColumn {
                centerColumn
            }
            
            rightColumn
        }
        .font(.subheadline)
        .background(
            Color.theme.background.opacity(0.0001))
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CoinRowView(coin: dev.coin, showinHoldingsColumn: true)
                .previewLayout(.sizeThatFits)
        }
    }
}

extension CoinRowView {
    private var leftColumn: some View {
        HStack(spacing: 0) {
            Text(String(coin.rank))
                .font(.caption)
                .foregroundStyle(.secondaryText)
                .frame(minWidth: 30)
            CoinImageView(coin: coin)
                .frame(width: 30, height: 30)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundStyle(.accent)
        }
    }
    
    private var centerColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
                .bold()
            Text((coin.currentHoldings ?? 0).asNumberString())
        }
        .foregroundStyle(.accent)
    }
    
    private var rightColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentPrice.asCurrencyWith6Decimals())
                .bold()
                .foregroundStyle(.accent)
            Text(coin.priceChangePercentage24H?.asPercentageString() ?? "")
                .foregroundStyle((coin.priceChange24H ?? 0) >= 0 ? Color.theme.green : Color.theme.red)
        }
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
    }
}

