//
//  ViewController.swift
//  Screen Sizes Simulator
//
//  Created by Felipe Augusto Sviaghin Ferri on 10/5/17.
//  Copyright © 2017 Felipe Augusto Sviaghin Ferri. All rights reserved.
//

import UIKit

enum PhotosCategory {
    case frogs, mammals, birds
}

class ViewController: UIViewController {

    var selectedCategory: PhotosCategory = .mammals {
        didSet {
            updateUI()
        }
    }
    
    @IBOutlet weak var photo1ImageView: UIImageView!
    @IBOutlet weak var photo2ImageView: UIImageView!
    
    override func viewDidLoad() {
        updateUI()
    }
    
    func updateUI() {
        switch selectedCategory {
        case .frogs:
            photo1ImageView.image = #imageLiteral(resourceName: "frog1")
            photo2ImageView.image = #imageLiteral(resourceName: "frog2")
        case .mammals:
            photo1ImageView.image = #imageLiteral(resourceName: "mammal1")
            photo2ImageView.image = #imageLiteral(resourceName: "mammal2")
        case .birds:
            photo1ImageView.image = #imageLiteral(resourceName: "bird1")
            photo2ImageView.image = #imageLiteral(resourceName: "bird2")
        }
    }
    
    @IBAction func swapButtonTap(_ sender: UIButton) {
        let tempImage = photo1ImageView.image
        photo1ImageView.image = photo2ImageView.image
        photo2ImageView.image = tempImage
    }
    
    @IBAction func frogsButtonTap(_ sender: UIButton) {
        selectedCategory = .frogs
    }

    @IBAction func mammalsButtonTap(_ sender: UIButton) {
        selectedCategory = .mammals
    }
    
    @IBAction func birdsButtonTap(_ sender: UIButton) {
        selectedCategory = .birds
    }
}

