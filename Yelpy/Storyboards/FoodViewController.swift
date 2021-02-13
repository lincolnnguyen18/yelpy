//
//  FoodViewController.swift
//  Yelpy
//
//  Created by Lincoln Nguyen on 2/12/21.
//  Copyright © 2021 memo. All rights reserved.
//

import UIKit
import ImageScrollView

class FoodViewController: UIViewController {
    @IBOutlet weak var closeButton: UIBarButtonItem!
    var image: UIImage?
    @IBOutlet weak var foodImage: ImageScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // let pictureTest = ImageZoomView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height), image: UIImage(named: "joe")!)
        // print("Image height: \(image!.size.height)")
        // // print("View height (bounds): \(view.bounds.height)")
        // print("View height (frame): \(view.frame.height)")
        // print("Left over height: \(view.frame.height - image!.size.height)")
        // print("Top margin: \(((view.frame.height - image!.size.height) / 2) + 49)")
        // let pictureTest = ImageZoomView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height), image: image!)
        // view.addSubview(pictureTest)
        
        foodImage.display(image: image!)
        
        // pictureTest.translatesAutoresizingMaskIntoConstraints = true
        // pictureTest.center = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
        // pictureTest.autoresizingMask = [UIView.AutoresizingMask.flexibleLeftMargin, UIView.AutoresizingMask.flexibleRightMargin, UIView.AutoresizingMask.flexibleTopMargin, UIView.AutoresizingMask.flexibleBottomMargin]
        // let topConstraint = pictureTest.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -49)
        // let topConstraint = pictureTest.topAnchor.constraint(equalTo: view.topAnchor, constant: 49)
        // topConstraint.isActive = true
    }
    
    @IBAction func onClose(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
