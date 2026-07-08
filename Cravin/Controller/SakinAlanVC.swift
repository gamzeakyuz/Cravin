//
//  SakinAlanVC.swift
//  BitirmeProjesi
//
//  Created by Gamze Akyüz on 8.03.2023.
//

import UIKit
import AVKit

class SakinAlanVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func buttonYagmur(_ sender: Any) {
        VideoPlayer(forResource: "yagmur", ofType: "mp4")
    }
    @IBAction func buttonOdaklanma(_ sender: Any){
        VideoPlayer(forResource: "focus", ofType: "mp4")
    }
    @IBAction func buttonSelale(_ sender: Any){
        VideoPlayer(forResource: "waterfall", ofType: "mp4")
    }
    @IBAction func buttonDuslerDiyari(_ sender: Any){
        VideoPlayer(forResource: "fairylands", ofType: "mp4")
    }
    @IBAction func buttonDoga(_ sender: Any){
        VideoPlayer(forResource: "nature", ofType: "mp4")
    }
    @IBAction func buttonSleep(_ sender: Any){
        VideoPlayer(forResource: "sleep", ofType: "mp4")
    }
    @IBAction func buttonPiano(_ sender: Any){
        VideoPlayer(forResource: "piano", ofType: "mp4")
    }
    @IBAction func buttonHuzur(_ sender: Any){
        VideoPlayer(forResource: "peacful", ofType: "mp4")
    }
    @IBAction func buttonSessizlik(_ sender: Any){
        VideoPlayer(forResource: "silence", ofType: "mp4")
    }
    func VideoPlayer(forResource: String, ofType: String){
//        oluşturulan değişken türünde video olup olmadığını kontrol eder.
        if let path = Bundle.main.path(forResource: forResource, ofType: ofType){
//            video oynatıcısının kaynak içeriğini tutmasına izin verir
            let video = AVPlayer(url: URL(fileURLWithPath: path))
//            videoyu tutan ve oynatıcı vc oluşturur
            let videoPlayer = AVPlayerViewController()
//            videoyu yeni vce atar
            videoPlayer.player = video
            present(videoPlayer, animated: true){
//               videoyu gösterir
                video.play()
            }
            print("Şu anda \(forResource).\(ofType) uzantılı video oynatılıyor.")
        }
    }
}
