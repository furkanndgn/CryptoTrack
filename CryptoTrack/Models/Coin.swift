//
//  CoinModel.swift
//  CryptoTrack
//
//  Created by Furkan Doğan on 20.01.2024.
//

import Foundation

// CoinGecko API Info
/*
 URL:
 https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h&locale=en
 
 JSON Response
 {
 "id": "bitcoin",
 "symbol": "btc",
 "name": "Bitcoin",
 "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
 "current_price": 41497,
 "market_cap": 814587920949,
 "market_cap_rank": 1,
 "fully_diluted_valuation": 872617259584,
 "total_volume": 21948546692,
 "high_24h": 42094,
 "low_24h": 40300,
 "price_change_24h": 370.2,
 "price_change_percentage_24h": 0.90013,
 "market_cap_change_24h": 6917206868,
 "market_cap_change_percentage_24h": 0.85644,
 "circulating_supply": 19603493,
 "total_supply": 21000000,
 "max_supply": 21000000,
 "ath": 69045,
 "ath_change_percentage": -39.81702,
 "ath_date": "2021-11-10T14:24:11.849Z",
 "atl": 67.81,
 "atl_change_percentage": 61179.77531,
 "atl_date": "2013-07-06T00:00:00.000Z",
 "roi": null,
 "last_updated": "2024-01-20T14:25:13.009Z",
 "sparkline_in_7d": {
 "price": [
 42946.26645181208,
 42890.12463639017,
 42817.99980499583,
 42739.77447179521,
 42900.62935751003,
 42919.11390786829,
 42901.19652700834,
 42910.8551094731,
 42970.37989439881,
 42912.59869673776,
 42673.61970251325,
 42507.76890096498,
 42442.088434188234,
 42279.079271689065,
 41753.68155974889,
 42226.0482506253,
 42242.652522430864,
 42358.46495312003,
 42520.55498117203,
 42567.442340384805,
 42736.27916799869,
 42640.98001402418,
 42704.12550087481,
 42677.56569785656,
 42712.71391926351,
 42546.22079252131,
 42673.55848288864,
 42635.881490202904,
 42824.959051230086,
 42219.41657918872,
 42257.148664380176,
 42516.25075282865,
 42692.42700720438,
 42954.24288046856,
 42905.29339904443,
 42865.9823090945,
 42772.365018332785,
 42570.85110583026,
 42587.336038354406,
 42595.618405364774,
 42536.700178525374,
 42703.74954670219,
 42876.80876440539,
 42743.33357705546,
 42746.23254955701,
 42703.42448359616,
 42709.53723335667,
 42980.54149665972,
 42906.665844896015,
 42843.67445578118,
 42824.21651204008,
 43115.483169793784,
 42760.85064196941,
 42620.4624579984,
 43233.62964380465,
 43177.34816828273,
 43037.862760029355,
 42997.128633165405,
 43164.539908499515,
 43122.169178503034,
 43407.03851293744,
 43212.30286234406,
 43135.81444844422,
 43094.02261074893,
 42975.76855026493,
 42984.50277499803,
 42836.49240196535,
 42812.22225779579,
 42765.27840737889,
 42797.782036357494,
 42639.909302406755,
 42705.20399573444,
 42662.33344351148,
 42801.87808140655,
 42658.4234596079,
 42718.146315928585,
 42582.502692139264,
 42724.22189165348,
 42467.34156889164,
 42307.79016949053,
 42374.46162247654,
 42549.27806320843,
 42594.69487372182,
 42549.30786322405,
 42635.68516739609,
 42699.215928408215,
 42752.74932167083,
 42636.22685895103,
 42548.84177998278,
 42612.90498225697,
 42538.92367999053,
 42615.07396771357,
 42733.060348224586,
 42745.25542409034,
 42847.485319378924,
 42691.99266294602,
 42672.40187567871,
 42393.254007473326,
 42485.64837823764,
 42371.295628956694,
 42520.893337922775,
 42682.485738965435,
 42585.94185832168,
 41875.158656012405,
 41743.54554992553,
 41473.48769286642,
 40913.96701409703,
 40894.52084211355,
 41063.98329729876,
 41321.6662328304,
 41260.43935439521,
 41282.327711841936,
 41248.868053556405,
 41084.45652935916,
 41022.81960741404,
 41057.589753733366,
 41156.435419504196,
 41465.43244900281,
 41227.84036910724,
 41303.65435807533,
 41348.59074965771,
 41413.37353474256,
 41444.45243175656,
 41306.22424183696,
 41356.01597977101,
 40929.767534463965,
 40890.55126059527,
 40377.50182249039,
 41174.83399781058,
 41750.529310430305,
 41752.772511822106,
 41610.9560394368,
 41616.904311771905,
 41636.0557325019,
 41623.9304380649,
 41467.100392257926,
 41600.94937699323,
 41581.45103823459,
 41627.32128994354,
 41585.24073381301,
 41603.40031988902,
 41634.183337777446,
 41630.88095439588,
 41578.403780418834,
 41468.06614272561,
 41505.1085719137
 ]
 },
 "price_change_percentage_24h_in_currency": 0.9001298613797013
 }
 */

struct Coin: Identifiable, Codable {
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let marketCap, marketCapRank, fullyDilutedValuation: Double?
    let totalVolume, high24H, low24H: Double?
    let priceChange24H, priceChangePercentage24H: Double?
    let marketCapChange24H: Double?
    let marketCapChangePercentage24H: Double?
    let circulatingSupply, totalSupply, maxSupply, ath: Double?
    let athChangePercentage: Double?
    let athDate: String?
    let atl, atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?
    let sparklineIn7D: SparklineIn7D?
    let priceChangePercentage24HInCurrency: Double?
    let currentHoldings: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supple"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
        case sparklineIn7D = "sparkline_in_7d"
        case priceChangePercentage24HInCurrency = "price_change_percentage_in_24h_in_currency"
        case currentHoldings
    }
    
    func updateHoldings(amount: Double) -> Coin {
        return Coin(id: id, symbol: symbol, name: name, image: image, currentPrice: currentPrice, marketCap: marketCap, marketCapRank: marketCapRank, fullyDilutedValuation: fullyDilutedValuation, totalVolume: totalVolume, high24H: high24H, low24H: low24H, priceChange24H: priceChange24H, priceChangePercentage24H: priceChangePercentage24H, marketCapChange24H: marketCapChange24H, marketCapChangePercentage24H: marketCapChangePercentage24H, circulatingSupply: circulatingSupply, totalSupply: totalSupply, maxSupply: maxSupply, ath: ath, athChangePercentage: athChangePercentage, athDate: athDate, atl: atl, atlChangePercentage: atlChangePercentage, atlDate: atlDate, lastUpdated: lastUpdated, sparklineIn7D: sparklineIn7D, priceChangePercentage24HInCurrency: priceChangePercentage24HInCurrency, currentHoldings: amount)
    }
    
    var currentHoldingsValue: Double {
        return (currentHoldings ?? 0) * currentPrice
    }
    
    var rank: Int {
        return Int(marketCapRank ?? 0)
    }
}

struct SparklineIn7D: Codable {
    let price: [Double]?
}

