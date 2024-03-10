/*
 JSON URL:
 https://developer.apple.com/library/archive/documentation/AudioVideo/Conceptual/iTuneSearchAPI/SearchExamples.html#//apple_ref/doc/uid/TP40017632-CH6-SW1
 
 JSON Address:
 https://itunes.apple.com/search?term=jack+johnson&limit=25
 */

import UIKit

struct Itunes: Decodable {
    let resultCount: Int
    let results: [Results]
}

struct Results: Decodable {
    let wrapperType: String
    let kind: String
    let artistName: String
    let collectionName: String
    let trackName: String
    let collectionCensoredName: String
    let trackCensoredName: String
    let collectionArtistId: Int
    let collectionArtistViewUrl: URL
    let collectionViewUrl: URL
    let trackViewUrl: URL
    let previewUrl: URL
    let artworkUrl30: URL
    let artworkUrl60: URL
    let collectionPrice: Double
    let trackPrice: Double
    let trackRentalPrice: Double
    let collectionHdPrice: Double
    let trackHdPrice: Double
    let trackHdRentalPrice: Double
    let releaseDate: Date
    let collectionExplicitness: String
    let trackExplicitness: String
    let discCount: Int
    let discNumber: Int
    let trackCount: Int
    let trackNumber: Int
    let trackTimeMillis: Int
    let country: String
    let currency: String
    let primaryGenreName: String
    let contentAdvisoryRating: String
    let shortDescription: String
    let longDescription: String
    let hasITunesExtras: Bool
}
