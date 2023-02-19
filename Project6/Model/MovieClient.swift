//
//  MovieClient.swift
//  Project6
//
//  Created for MPCS 501030
//

import Foundation
import UIKit

/// Creates a task that retrieves the contents of the an itunes URL, then calls a handler upon completion.
class MovieClient {
    
    /// Fetch movies from iTunes with completion block
    /// - Parameters:
    ///     - completion: A tuple with an `Array` of the movies and an error code
    /// - Throws:
    /// - Returns:
    
    static var cachedMovies: movielist?
    
    static func fetchMovies(url: String, completion: @escaping (movielist?, Error?) -> Void) {
        print("DEBUG ---> Attempting to fetch movies")
        
        // checking if cached results already exist
        if let cachedMovies = cachedMovies {
            print("DEBUG ---> Returning cached movies")
            DispatchQueue.main.async {
                completion(cachedMovies, nil)
                return
            }
        }
        
        let defaulturl = URL(string: "https://itunes.apple.com/search?country=US&media=movie&limit=200&term=love")!
        let url = URL(string: url) ?? defaulturl

        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            
            guard let data = data, error == nil else {
                DispatchQueue.main.async { completion(nil, error) }
                return
            }
            
            do{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let issues = try decoder.decode(movielist.self, from: data)
                print("DEBUG ------> fetched new movies:", issues)
                
                // updating cached results
                cachedMovies = issues
                DispatchQueue.main.async { completion(issues, nil) }
            } catch(let parsingError) {
                DispatchQueue.main.async { completion(nil, parsingError) }
            }
        }
        
        task.resume()
    }
    
    //
    // FIXME: Cache images locally to improve performance
    //
    
    static let imageCache = NSCache<NSString, UIImage>()

    static func getImage(url: String, completion: @escaping (UIImage?, Error?) -> Void) {
        if let cachedImage = imageCache.object(forKey: url as NSString) {
            completion(cachedImage,nil)
            return
        }

        let url = URL(string: url)!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }

            if let image = UIImage(data: data) {
                imageCache.setObject(image, forKey: url.absoluteString as NSString)
                DispatchQueue.main.async {
                    completion(image, nil)
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }
        }

        task.resume()
    }

}
