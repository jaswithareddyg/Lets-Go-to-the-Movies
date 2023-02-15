//
//  DetailViewController.swift
//  Project6
//
//  Created for MPCS 501030
//

import UIKit

class DetailViewController: UIViewController {

    //
    // MARK: - IBOutlets
    //
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var ratingLabel: UILabel!
    @IBOutlet private var priceLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!
    
    var movie: Movie!

    //
    // MARK: - Lifecycle
    //
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = movie.trackName
        ratingLabel.text = "Rated \(movie.contentAdvisoryRating)"
        priceLabel.text = movie.trackPrice
        descriptionLabel.text = movie.longDescription
    }

    //
    // MARK: - IBActions
    //
    
    /// Open the current movie preview in Safari using system `UIApplication` method
    /// - Parameter sender: The button that was tapped
    @IBAction func openSafari(_ sender: UIBarButtonItem) {
        //FIXME: Link to Safari to show preview
    }
}
