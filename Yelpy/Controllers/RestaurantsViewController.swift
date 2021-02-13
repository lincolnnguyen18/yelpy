//
//  ViewController.swift
//  Yelpy
//
//  Created by Memo on 5/21/20.
//  Copyright © 2020 memo. All rights reserved.
//

import UIKit
import AlamofireImage

class RestaurantsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // ––––– TODO: Add storyboard Items (i.e. tableView + Cell + configurations for Cell + cell outlets)
    // ––––– TODO: Next, place TableView outlet here
    @IBOutlet weak var tableView: UITableView!
    
    // –––––– TODO: Initialize restaurantsArray
    var restaurantsArray: [[String:Any?]] = []
    
    
    // ––––– TODO: Add tableView datasource + delegate
    override func viewDidLoad() {
        super.viewDidLoad()
        getAPIData()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    // ––––– TODO: Get data from API helper and retrieve restaurants
    func getAPIData() {
        API.getRestaurants() { (restaurants) in
            guard let restaurants = restaurants else {
                return
            }
            print(restaurants)
            self.restaurantsArray = restaurants
            self.tableView.reloadData()
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell") as! RestaurantCell
        
        let restaurant = restaurantsArray[indexPath.row]
        
        cell.label.text = restaurant["name"] as? String ?? ""
        
        if let imageUrlString = restaurant["image_url"] as? String {
            let imageUrl = URL(string: imageUrlString)
            cell.restaurantImage.af.setImage(withURL: imageUrl!)
            let recognizer = UITapGestureRecognizer(target: self, action: #selector(didTapImageView(_:)))
            cell.restaurantImage.addGestureRecognizer(recognizer)
            cell.restaurantImage.isUserInteractionEnabled = true
        }
        
        return cell
    }
    
    var imageToSend: UIImage?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        // find selected movie id
        // let movieId = movie["id"] as! Int
        // pass it to movie trailer view controller
        let foodNavViewController = segue.destination as! UINavigationController
        let foodViewController = foodNavViewController.topViewController as! FoodViewController
        foodViewController.image = imageToSend
        // movieTrailerViewController.movieId = movieId
    }
    
    @objc private func didTapImageView(_ sender: UITapGestureRecognizer) {
        print("did tap image view", sender)
        let cell = sender.view as! UIImageView
        imageToSend = cell.image
        performSegue(withIdentifier: "toFood", sender: self)
    }
}

// ––––– TODO: Create tableView Extension and TableView Functionality


