//
//  FiltersViewController.swift
//  Project6
//
//  Created for MPCS 501030
//

import UIKit

class FiltersViewController: UIViewController {

    @IBOutlet private var priceLabel: UILabel!
    @IBOutlet private var ratingsControl: UISegmentedControl!
    @IBOutlet private var priceStepper: UIStepper!
    
    weak var delegate: MoviesFilterDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        priceLabel.text = "Less than: \(DataManager.sharedInstance.priceLimitDisplayString)"
        priceStepper.value = Double(DataManager.sharedInstance.priceLimitFilter)
        
        var selectedRatingIndex: Int
        if DataManager.sharedInstance.ratingFilter == "g" {
            selectedRatingIndex = 0
        } else if DataManager.sharedInstance.ratingFilter == "pg" {
            selectedRatingIndex = 1
        } else if DataManager.sharedInstance.ratingFilter == "pg13" {
            selectedRatingIndex = 2
        } else if DataManager.sharedInstance.ratingFilter == "r" {
            selectedRatingIndex = 3
        } else {
            selectedRatingIndex = 4
        }
        ratingsControl.selectedSegmentIndex = selectedRatingIndex
    }
    
    @IBAction func ratingChanged(_ sender: UISegmentedControl) {
        guard let newRating = Rating(rawValue: ratingsControl.selectedSegmentIndex) else {
            return
        }
        
        let index = ratingsControl.selectedSegmentIndex
        var selectedRatingFilter: String
        if index == 0 {
            selectedRatingFilter = "g"
        } else if index == 1 {
            selectedRatingFilter = "pg"
        } else if index == 2 {
            selectedRatingFilter = "pg13"
        } else if index == 3 {
            selectedRatingFilter = "r"
        } else {
            selectedRatingFilter = "anyRating"
        }
        
        DataManager.sharedInstance.update2(rating: selectedRatingFilter)
        delegate!.changeFilter(price: DataManager.sharedInstance.priceLimitFilter, rating: DataManager.sharedInstance.ratingFilter)
    }
    
    @IBAction func priceChanged(_ sender: UIStepper) {
        DataManager.sharedInstance.update2(priceLimit: Float(sender.value))
        priceLabel.text = "Less than: \(DataManager.sharedInstance.priceLimitDisplayString)"
        delegate?.changeFilter(price: DataManager.sharedInstance.priceLimitFilter, rating: DataManager.sharedInstance.ratingFilter)
    }
}
