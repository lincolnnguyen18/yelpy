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
            // print(restaurants)
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
        let categories = restaurant["categories"] as! [[String:String]]
        let starCount = restaurant["rating"] as? Double ?? 0.0
        // for category in categories {
        //     print(category["title"] ?? "")
        //     cell.categories.text! += category["title"] ?? ""
        // }
        cell.categories.text! = categories[0]["title"] ?? ""
        cell.numRatings.text! = String(restaurant["review_count"] as? Int ?? 0)
        cell.phone.text! = restaurant["display_phone"] as? String ?? ""
        switch starCount {
        case 0.0:
            print("0 stars")
            cell.stars.image = UIImage(named: "regular_0")!
        case 1.0:
            print("1 star")
            cell.stars.image = UIImage(named: "regular_1")!
        case 1.5:
            print("1.5 stars")
            cell.stars.image = UIImage(named: "regular_1_half")!
        case 2.0:
            print("2 stars")
            cell.stars.image = UIImage(named: "regular_2")!
        case 2.5:
            print("2.5 stars")
            cell.stars.image = UIImage(named: "regular_2_half")!
        case 3.0:
            print("3 stars")
            cell.stars.image = UIImage(named: "regular_3")!
        case 3.5:
            print("3.5 stars")
            cell.stars.image = UIImage(named: "regular_3_half")!
        case 4.0:
            print("4 stars")
            cell.stars.image = UIImage(named: "regular_4")!
        case 4.5:
            print("4.5 stars")
            cell.stars.image = UIImage(named: "regular_4_half")!
        case 5.0:
            print("5 stars")
            cell.stars.image = UIImage(named: "regular_5")!
        default:
            fatalError("Invalid stars.")
        }
        
        print(restaurant["name"] as? String ?? "")
        print(categories[0]["title"] ?? "")
        print(restaurant["rating"] as? Double ?? 0.0)
        print(restaurant["review_count"] as? Int ?? 0)
        print(restaurant["display_phone"] as? String ?? "")
        
        // cell.
        
        print("\n")
        
        if let imageUrlString = restaurant["image_url"] as? String {
            let imageUrl = URL(string: imageUrlString)
            cell.restaurantImage.af.setImage(withURL: imageUrl!)
        }
        
        return cell
    }
}

// ––––– TODO: Create tableView Extension and TableView Functionality


