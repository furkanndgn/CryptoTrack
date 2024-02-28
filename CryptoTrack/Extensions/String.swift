//
//  String.swift
//  CryptoTrack
//
//  Created by Furkan Doğan on 12.02.2024.
//

import Foundation

extension String {
    var removeHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
