//
//  BilgilenelimDetayVC.swift
//  BitirmeProjesi
//
//  Created by Gamze Akyüz on 16.03.2023.
//

import UIKit

class NedirDetayVC: UIViewController {

    var selectedBilgi : Bilgilendirme?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailsText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let backgrounImage = UIImageView(frame: UIScreen.main.bounds)
        backgrounImage.image = UIImage(named: "4")
        backgrounImage.contentMode = .scaleAspectFill
        view.insertSubview(backgrounImage, at: 0)

        titleLabel.text = selectedBilgi?.title
        detailsText.text = selectedBilgi?.details
    }
}
