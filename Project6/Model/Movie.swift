//
//  Movie.swift
//  Project6
//
//  Created for MPCS 501030
//

import Foundation

/// A list of the of `Movie` types
struct movielist: Decodable {
    let results: [Movie]
}

/// A movie type with data matching the iTunes API (note that the names have historically music-like names)
struct Movie : Decodable, Hashable {
    let trackName: String?
    let trackPrice: Float?
    let contentAdvisoryRating: String?
    let releaseDate: String?
    let artworkUrl100: String?
    let longDescription: String?
    let previewUrl: URL?

    var trackPrice_TOSTRING: String {
        if let trackPrice = trackPrice {
            return "$\(trackPrice)"
        } else {
            return "Unknown Price"
        }
    }
}


