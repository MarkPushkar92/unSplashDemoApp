//
//  ViewController.swift
//  UnSpalshDemoApp
//
//  Created by Марк Пушкарь on 16.10.2021.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
       let photosVC = PhotosCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        
       let favesVC = FavesViewController()

        viewControllers = [
            generateNavigationController(rootViewController: photosVC, title: "Photos", image: UIImage.init(systemName: "house.fill")!),
            generateNavigationController(rootViewController: favesVC, title: "Favourites", image: UIImage.init(systemName: "heart.fill")!)
        ]
    }
    
    private func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
}

   


