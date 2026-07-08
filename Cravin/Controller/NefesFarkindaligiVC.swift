//
//  NefesFarkindaligiVC.swift
//  BitirmeProjesi
//
//  Created by Gamze Akyüz on 15.03.2023.
//

import UIKit

class NefesFarkindaligiVC: UIViewController {
    
    let hedefURLString = "https://www.youtube.com/watch?v=2uDPo_A4b14"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "dream_TradingCard-4")
        backgroundImage.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
        
    }
    
    @IBAction func urlButonuTiklandi(_ sender: UIButton) {
        // URL'yi oluşturun
        if let hedefURL = URL(string: hedefURLString) {
            // URL'yi açmak için UIApplication'ı kullanın
            UIApplication.shared.open(hedefURL, options: [:], completionHandler: nil)
        }
    }
    

}
