# CryptoTrack  

![Platform](https://img.shields.io/badge/platform-iOS-blue)
![Swift](https://img.shields.io/badge/swift-5.0-orange)
![Xcode](https://img.shields.io/badge/Xcode-15-blue)

## Overview  

**CryptoTrack** is a cryptocurrency tracking app that allows users to monitor the top 250 coins by volume, view detailed insights, and manage a personal portfolio. The app provides historical price charts, key market data, and useful insights to help users stay informed about the crypto market.  

## Screenshots  

Screenshots will be added.  

## Features  

- Displays the **top 250** cryptocurrencies by volume.  
- Coin **detail screen** with:  
  - **7-day price chart**  
  - **Overview** with information about the coin  
  - **Key insights** like current price, market cap, and volume  
- **Portfolio tracking** where users can:  
  - Add coins to their portfolio  
  - View their assets and **24-hour portfolio value changes**  
  - See insights like **BTC dominance**  
- Uses **Core Data** for portfolio storage.  
- Implements **Combine** for reactive programming.  

## Tech Stack  

- **Language:** Swift  
- **Frameworks:** SwiftUI, Combine  
- **Architecture:** MVVM  
- **Data Management:** Core Data  
- **Networking:** URLSession  
- **API Used:** [CoinGecko API](https://docs.coingecko.com/v3.0.1/reference/introduction)

## Installation  

1. Clone the repository:  
   ```bash
   git clone https://github.com/furkanndgn/CryptoTrack.git
   ```
2. Open the `.xcodeproj` or `.xcworkspace` file.
3. Run the project on the simulator or a real device.

## Project Structure

- `Core/` - Contains view components and ViewModels for different scenes.  
- `Extensions/` - Includes extensions for system classes used throughout the app.  
- `Models/` - Defines API response models and Core Data entities for persistent storage.  
- `Services/` - Handles data fetching and business logic.  
- `Utilities/` - Includes `NetworkManager` for API requests and `LocalFileManager` for caching coin images.  

## How It Works


1. On launch, the app fetches the top 250 cryptocurrencies by volume.
2. Users can tap a coin to view detailed insights, including:
   - A 7-day price chart
   - A brief overview of the cryptocurrency
   - Key statistics (price, market cap, volume, etc.)
3. In the Portfolio section, users can:
   - Add coins to track their holdings.
   - See insights like BTC dominance and 24h portfolio value change.
4. Core Data stores portfolio information locally.
5. Combine is used for reactive data updates across the app.
