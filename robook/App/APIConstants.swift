//
//  APIConstants.swift
//  robook
//
//  Created by Roberto Franco on 03/01/21.
//

import Foundation

public struct API {
    static let Endpoint = "http://192.168.0.14:8000"
    static let SocketEndpoint = "http://192.168.0.14:8000"
    static let ApiVersion = "v1"
    
    static func baseUrl() -> String {
        return "\(Endpoint)/api/\(ApiVersion)"
    }
    
    static func getSocketPath(auctionId: Int) -> String {
        return "/ws/bid/\(auctionId)/"
    }
    
    static func getSocketEndpoint(auctionId: Int) -> String {
        return "\(SocketEndpoint)/ws/bid/\(auctionId)/"
    }
    
    static func getImageUrl(imageUrl: String) -> URL {
        return URL(string: "\(Endpoint)\(imageUrl)")!
    }
    
    // MARK: AUCTIONS
    
    static let auctions = "auctions/"
    
    static func auctionsPath() -> String {
        return "\(self.baseUrl())/\(auctions)"
    }
    
    static func getAuctionCurrentLot(auctionId: Int) -> String {
        return "\(self.baseUrl())/\(auctions)\(auctionId)/current_lot/"
    }
}


