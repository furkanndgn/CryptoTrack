//
//  DetailViewModel.swift
//  CryptoTrack
//
//  Created by Furkan Doğan on 9.02.2024.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    
    @Published var overviewStatistics: [Statistic] = []
    @Published var additionalStatistics: [Statistic] = []
    @Published var coinDescription: String? = nil
    @Published var websiteURL: String? = nil
    @Published var redditURL: String? = nil
    
    @Published var coin: Coin
    private let coinDetailService: CoinDetailDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: Coin) {
        self.coin = coin
        self.coinDetailService = CoinDetailDataService(coin: coin)
        addSubscribers()
    }
    
    private func addSubscribers() {
        
        coinDetailService.$coinDetails
            .combineLatest($coin)
            .map(matDataToStatistics)
            .sink { [weak self] (returnedArrays) in
                self?.overviewStatistics = returnedArrays.overview
                self?.additionalStatistics = returnedArrays.additional
            }
            .store(in: &cancellables)
            
        coinDetailService.$coinDetails
            .sink { [weak self] (returnedDetails) in
                self?.coinDescription = returnedDetails?.readableDescription
                self?.websiteURL = returnedDetails?.links?.homepage?.first
                self?.redditURL = returnedDetails?.links?.subredditURL
            }
            .store(in: &cancellables)
    }
    
    private func matDataToStatistics(coinDetail: CoinDetail?, coin: Coin) -> (overview: [Statistic], additional: [Statistic]) {

        let overviewArray = createOverviewArray(coin: coin)
        let additionalArray = createAdditionalArray(coin: coin, coinDetail: coinDetail)
        return (overviewArray, additionalArray)
    }
    
    private func createOverviewArray(coin: Coin) -> [Statistic] {
        let price = coin.currentPrice.asCurrencyWith6Decimals()
        let pricePercentageChange = coin.priceChangePercentage24H
        let priceStat = Statistic(title: "Current Price", value: price, percentageChange: pricePercentageChange)
        
        let marketCap = "$" + (coin.marketCap?.formattedWithAbreviations() ?? "")
        let marketCapPercentageChange = coin.marketCapChangePercentage24H
        let marketCapStat = Statistic(title: "Market Capitalization", value: marketCap, percentageChange: marketCapPercentageChange)
        
        let rank = "\(coin.rank)"
        let rankStat = Statistic(title: "Rank", value: rank)
        
        let volume = "$" + (coin.totalVolume?.formattedWithAbreviations() ?? "")
        let volumeStat = Statistic(title: "Volume", value: volume)
        
        let overviewArray: [Statistic] = [priceStat, marketCapStat, rankStat, volumeStat]
        return overviewArray
    }
    
    private func createAdditionalArray(coin: Coin, coinDetail: CoinDetail?) -> [Statistic] {
        let high = coin.high24H?.asCurrencyWith6Decimals() ?? "n/a"
        let highStat = Statistic(title: "24h High", value: high)
        
        let low = coin.low24H?.asCurrencyWith6Decimals() ?? "n/a"
        let lowStat = Statistic(title: "24h Low", value: low)
        
        let priceChange = coin.priceChange24H?.asCurrencyWith6Decimals() ?? "n/a"
        let pricePercentageChange2 = coin.priceChangePercentage24H
        let priceChangeStat = Statistic(title: "24h Price Change", value: priceChange, percentageChange: pricePercentageChange2)
        
        let marketCapChange = "$" + (coin.marketCapChange24H?.formattedWithAbreviations() ?? "")
        let marketCapPercentageChange2 = coin.marketCapChangePercentage24H
        let marketCapChangeStat = Statistic(title: "24h Market Cap Change", value: marketCapChange, percentageChange: marketCapPercentageChange2)
        
        let blockTime = coinDetail?.blockTimeInMinutes ?? 0
        let blockTimeString = blockTime == 0 ? "n/a" : "\(blockTime)"
        let blockTimeStat = Statistic(title: "Block Time", value: blockTimeString)
        
        let hashing = coinDetail?.hashingAlgorithm ?? "n/a"
        let hashingStat = Statistic(title: "Hashing Algorithm", value: hashing)
        
        let additionalArray: [Statistic] = [highStat, lowStat, priceChangeStat, marketCapChangeStat, blockTimeStat, hashingStat]
        return additionalArray
    }
}
