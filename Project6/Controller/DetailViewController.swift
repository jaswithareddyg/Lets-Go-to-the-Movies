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
    //
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet private var ratingLabel: UILabel!
    @IBOutlet private var priceLabel: UILabel!
    @IBOutlet private var descriptionTextView: UILabel!
    
    var movie: Movie!

    //
    // MARK: - Lifecycle
    //
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = movie.trackName
        
        // uses the default swift image if the movie poster has not been loaded
        imageView.image = UIImage(systemName: "swift")
        MovieClient.getImage ( url: movie.artworkUrl100 ?? "", completion: { (image, error) in
            guard let image = image, error == nil else {
                print(error ?? "")
                return
            }
            
            // increases the size of image to the same in MovieCollectionViewController
            let scale: CGFloat = 2.0 // Set the scale factor for the new image
            let newSize = CGSize(width: image.size.width * scale, height: image.size.height * scale)
            let renderer = UIGraphicsImageRenderer(size: newSize)
            let newImage = renderer.image { _ in
                image.draw(in: CGRect(origin: .zero, size: newSize))
            }
            
            self.imageView.image = newImage
        })
        ratingLabel.text = "Rated " + movie.contentAdvisoryRating!
        priceLabel.text = movie.trackPrice_TOSTRING
        descriptionTextView.text = movie.longDescription
    }

    //
    // MARK: - IBActions
    //
    
    /// Open the current movie preview in Safari using system `UIApplication` method
    /// - Parameter sender: The button that was tapped
    @IBAction func openSafari(_ sender: UIBarButtonItem) {
        //FIXME: Link to Safari to show preview
        
        if let unwrappedURL = movie.previewUrl {
            UIApplication.shared.open(unwrappedURL)
        }
    }
}
