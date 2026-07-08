//
//  MeditasyonVC.swift
//  ZihninOkyanusu
//
//  Created by Gamze Akyüz on 3.04.2023.
//

import UIKit

class MeditasyonVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "dream_TradingCard")
        backgroundImage.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
    }
    
    @IBAction func zenVC(_ sender: Any){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ZenVC")
        self.show(vc!, sender: nil)
        print("Zen Meditasyonu Sayfasına Geçiş Yapıldı")
    }
    @IBAction func yogaVC(_ sender: Any){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "YogaVC")
        self.show(vc!, sender: nil)
        print("Yoga Meditasyon Sayfasına Geçiş Yapıldı")
    }
    @IBAction func mantraVC(_ sender: Any){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MantraVC")
        self.show(vc!, sender: nil)
        print("Mantra Meditasyon Sayfasına Geçiş Yapıldı")
    }
    @IBAction func chakraVC(_ sender: Any){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ChakraVC")
        self.show(vc!, sender: nil)
        print("Chakra Meditasyon Sayfasına Geçiş Yapıldı")
    }
    @IBAction func vipassanaVC(_ sender: Any){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "VipassanaVC")
        self.show(vc!, sender: nil)
        print("Vipassana Meditasyon Sayfasına Geçiş Yapıldı")
    }
    @IBAction func mindfulnessVC(_ sender: Any){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MindfulnessVC")
        self.show(vc!, sender: nil)
        print("Mindfullness Meditasyon Sayfasına Geçiş Yapıldı")
    }
    @IBAction func transandantalVC(_ sender: Any){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TransandantalVC")
        self.show(vc!, sender: nil)
        print("Transandantal Meditasyon Sayfasına Geçiş Yapıldı")
    }
    @IBAction func lovingkidnessVC(_ sender: Any){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LovingKidnessVC")
        self.show(vc!, sender: nil)
        print("Loving-Kidness Meditasyon Sayfasına Geçiş Yapıldı.")
    }
    @IBAction func nefesfarkindaligiVC(_ sender: Any){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "NefesFarkindaligiVC")
        self.show(vc!, sender: nil)
        print("Nefes Farkındalığı Meditasyon Sayfasına Geçiş Yapıldı")
    }
    @IBAction func nidrayogaVC(_ sender: Any){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "NidraYogaVC")
        self.show(vc!, sender: nil)
        print("Nidra Yoğa Meditasyon Sayfasına Geçiş Yapıldı.")
    }

}
