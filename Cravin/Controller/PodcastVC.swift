//
//  PodcastVC.swift
//  BitirmeProjesi
//
//  Created by Gamze Akyüz on 18.03.2023.
//

import UIKit

class PodcastVC: UIViewController {
    
    var podcast = [Podcast]()
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSongs()
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    func configureSongs() {
        podcast.append(Podcast(name: "Hayatını Anında Değiştirebilecek 10 Alışkanlık",albumName: "Kişisel Gelişim",artistName: "Jim Kwik",imageName: "sadece21gunDene",trackName: "sadece21gunDene"))
        
        podcast.append(Podcast(name: "Kazanmaya Başlamak", albumName: "Motivasyon", artistName: "Haluk Tatar", imageName: "kazanmayaBaslamak", trackName: "kazanmayaBaslamak"))
        
        podcast.append(Podcast(name: "Bahane Yok", albumName: "Motivasyon", artistName: "Jocko Willink/Tyrese Gibson/John Maxwell/Eric Thomas", imageName: "bahaneyok", trackName: "bahaneYok"))
        
        podcast.append(Podcast(name: "Zihni Uyandırmak", albumName: "Meditasyon", artistName: "Alan Watts", imageName: "zihniyandirmak", trackName: "zihniyandirmak"))
        
        podcast.append(Podcast(name: "Travmayı iyileştirmenin 6 yolu", albumName: "Meditasyon", artistName: "Bessel van der Kolk", imageName: "travma", trackName: "travma"))
        
        podcast.append(Podcast(name: "Hücrelerin iyileşmesi", albumName: "Meditasyon", artistName: "Mind Set", imageName: "hucreleriniyilesmesi", trackName: "hucreleriniyilesmesi"))
    }
    
}
extension PodcastVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return podcast.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PodcastTableViewCell
        let song = podcast[indexPath.row]
        cell.labelText?.text = song.name
        cell.images?.image = UIImage(named: song.imageName)
        cell.labelText?.font = UIFont(name: "Rockwell", size: 12)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        // present the player
        let position = indexPath.row
        guard let vc = storyboard?.instantiateViewController(identifier: "PodcastPlayerVC") as? PodcastPlayerVC else {
            return
        }
        vc.podcast = podcast
        vc.position = position
        present(vc, animated: true)
    }
}
