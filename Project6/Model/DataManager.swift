//
//  DataManager.swift
//  Project6
//
//  Created for MPCS 501030
//

import Foundation
class DataManager {
    //
    // MARK: - Singleton
    //
    public static let sharedInstance = DataManager()
    /// List of movies retrieved from iTunes, does not mutate with filters, maintains original fetch data
    private(set) var movies: [Movie]
    /// List of movies retrieved from iTunes, and then filtered based on user input
    private(set) var filteredMovies: [Movie]
    private(set) var priceLimitFilter: Float
    
    private(set) var ratingFilter: String
    
    var priceLimitDisplayString: String {
        return "$\(priceLimitFilter)"
    }
    // Init with default values
    private init() {
        priceLimitFilter = 20
        ratingFilter = "anyRating"
        movies = []
        filteredMovies = []
    }
    func refreshMovieData(_ movies: [Movie]) {
        self.movies = movies
        self.filteredMovies = movies
    }
    func update1(_ filteredMovies: [Movie]) {
        self.filteredMovies = filteredMovies
    }
    
    func update2(priceLimit: Float? = nil, rating: String? = nil) {
        if let priceLimit = priceLimit {
            self.priceLimitFilter = priceLimit
        }
        
        if let rating = rating {
            self.ratingFilter = rating
        }
    }
}
