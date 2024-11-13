//
//  TabbarVC.swift
//  MathBusterSNP
//
//  Created by yunus on 11.11.2024.
//
import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        setupTab()
    }
    private func setupTab(){
        let gameVC = createNav(title: "MathBuster", image: UIImage(systemName: "gamecontroller.circle")!, vc: ViewController())
        let scoreVC = createNav(title: "Rating", image: UIImage(systemName: "crown.fill")!, vc: RatingViewController())
        
        self.setViewControllers([gameVC, scoreVC], animated: true)
    }
    
    
    private func createNav(title: String, image: UIImage, vc: UIViewController)-> UIViewController{
        let nav = vc
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        return nav
    }
}
