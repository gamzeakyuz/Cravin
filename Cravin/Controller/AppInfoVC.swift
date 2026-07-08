//
//  AppInfoVC.swift
//  BitirmeProjesi
//
//  Created by Gamze Akyüz on 8.03.2023.
//

import UIKit

class AppInfoVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "dream_TradingCard-5")
        backgroundImage.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
        
    }
}



