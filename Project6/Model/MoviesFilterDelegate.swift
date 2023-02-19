//
//  MoviesFilterDelegate.swift
//  Project6
//
//  Created for MPCS 501030
//

import Foundation

protocol MoviesFilterDelegate: AnyObject {
    func changeFilter(price: Float, rating: String, flag: Int)
}

// flag - to determine if the list of movies need to be sorted for the latest
// 0 - need not be sorted, 1 - needs to be sorted
