//
//  BeniMotiveEtVC.swift
//  BitirmeProjesi
//
//  Created by Gamze Akyüz on 9.03.2023.
//

import UIKit

class OlumlamaVC: UIViewController {
    
    @IBOutlet weak var textView: UIView!
    @IBOutlet var textLabel: UILabel!

    
    var quotes = [
        "Yaşamak acı çekmektir, hayatta kalmak ise acıda bir anlam bulmaktır. - Friedrich Nietzsche",
                  "Hayatın %10'u başınıza gelenler ve %90'ı bunlara nasıl tepki verdiğinizdir. - Charles R. Swindoll",
                  "Dün düştüysen bugün kalk. - H. G. Wells",
                  "İlerlemenin sırrı başlamaktır. - Mark Twain",
                  "Hayallerinin Hayatını Yaşa: Hayallerinin hayatını başkalarının beklentileri ve görüşleri yerine kendi vizyonuna ve amacına göre yaşayacak kadar cesur ol. - Roy T. Bennett",
                  "Gözünüze çarpanın değil, kalbinize takılanın peşinden gidin. - Roy T. Bennett",
                  "Yaratıcı bir hayat yaşamak için yanılma korkumuzu yenmeliyiz - Anonymous",
                  "Olağanı riske atmaya istekli değilseniz, sıradan olanla yetinmek zorunda kalacaksınız. - Jim Rohn",
                  "Bir fikri benimseyin. Bu tek fikri hayatınız yapın - düşünün, hayal edin, bu fikirle yaşayın. Beynin, kasların, sinirlerin, vücudunun her parçasının bu fikirle dolu olmasına izin ver ve diğer tüm fikirleri kendi haline bırak. Başarıya giden yol budur. - Swami Vivekananda",
                  "Zamanınıza değer vermezseniz, diğerleri de vermez. Zamanınızı ve yeteneklerinizi harcamayı bırakın, bunun için ücret almaya başlayın. - Kim Garst",
                  "Yanlış şeylerin peşinden koşmayı bıraktığınızda, doğru şeylere sizi yakalaması için bir şans vermiş olursunuz. - Lolly Daskal",
                  "Mutluluk, peşinden koştuğunda asla kavrayamayacağın ama sessizce oturursan üzerine konabilecek bir kelebektir. - Nathaniel Hawthorne",
                  "Yeteneğiniz neler yapabileceğinizi belirler. Motivasyonunuz, ne kadar yapmak istediğinizi belirler. Tutumunuz, onu ne kadar iyi yaptığınızı belirler. - Lou Holtz",
                  "Bunu en azından deneyerek öğrendim; hayalleri doğrultusunda emin adımlarla ilerleyen, hayal ettiği hayatı yaşamaya çalışan insan, beklenmedik bir anda beklenmedik bir başarı ile karşılaşacaktır. - Henry David Thoreau",
                  "Gerçekleşmesi zaman alacak diye bir hayalden asla vazgeçme. Nasıl olsa zaman geçecek. - Earl Nightingale",
                  "Deneme. Yap ya da yapma. Burada deneme yok. - Yoda",
                  "Gerçek cesaret, daha başlamadan başarısız olduğunu bildiğin, ama yine de başladığın ve ne olursa olsun sonuna kadar devam ettiğin zamandır. - Harper Lee",
                  "Kimse geri dönüp yeni bir başlangıca başlayamaz ama herkes bugün başlayıp yeni bir son yapabilir. - Maria Robinson",
                  "Hayattaki başarısızlıkların çoğu, pes ettiklerinde başarıya ne kadar yakın olduklarını fark etmeyen insanlardır. - Thomas Edison",
                  "Hayallerinin peşinden koşan motive olmuş insanların özelliği, tembel insanlara deli gibi görünmeleridir. - Albert Einstein",
                  "Eğitim, dünyayı değiştirmek için kullanabileceğiniz en güçlü silahtır. - Nelson Mandele",
                  "Bir araya gelmek bir başlangıçtır. Bir arada kalmak ilerlemedir. Birlikte çalışmak başarıdır. - Henry Ford",
                  "Diğer insanların istediklerini elde etmelerine yeterince yardım ederseniz, hayatta istediğiniz her şeyi elde edebilirsiniz. - Zig Ziglar",
                  "Bir şeyin olması gerektiğine inanıyorsan, kendin kullanmak istediğin bir şeyse, kimsenin seni bunu yapmaktan alıkoymasına izin verme. - Tobias Lütke",
                  "Sana 'kazanamazsın' diyebilecek tek kişi sensin ve dinlemek zorunda değilsin - Jessica Ennis",
                  "Basit bir gerçeği keşfettiğinizde hayat çok daha geniş olabilir: Etrafınızda hayat dediğiniz her şey, sizden daha akıllı olmayan insanlar tarafından yapılmıştır. Ve onu değiştirebilirsin, etkileyebilirsin... Bunu bir kez öğrendiğinde, bir daha asla eskisi gibi olmayacaksın. - Steve Jobs",
                  "Cesaret her zaman kükremez. Bazen cesaret, günün sonunda 'Yarın tekrar deneyeceğim' diyen kısık bir sestir. - Mary Anne Radmacher",
                  "Mümkün olanın sınırlarını keşfetmenin tek yolu, imkansıza doğru onları biraz aşmayı göze almaktır. - Arthur C. Clarke",
                  "Güvensizlikle mücadele etmemizin nedeni, perde arkamızı diğer herkesin öne çıkan filmleriyle karşılaştırmamızdır. - Steve Furtick",
                  "En kötü düşmanınızın iki kulağınızın arasında yaşamadığından emin olun. - Laird Hamilton",
                  "Tek bir adım yeryüzünde yol yapmayacağı gibi, tek bir düşünce de zihinde yol açmayacaktır. Derin bir fiziksel yol yapmak için tekrar tekrar yürüyoruz. Derin bir zihinsel yol yapmak için, hayatımıza hakim olmasını istediğimiz türden düşünceleri tekrar tekrar düşünmeliyiz. - Henry David Thoreau",
                  "Bir hayalin olduğunda, onu yakalamalı ve asla bırakmamalısın. - Carol Burnett",
                  "Hayatın tüm bu kıvrımları ve dönüşleri var. Sıkıca tutunmalısın ve yola koyulmalısın. - Nicole Kidman",
                  "Günün sonunda, o insanların senin hayatını nasıl yaşadığından memnun olup olmaması önemli değil. Önemli olan senin bu konuda rahat olup olmadığın. - Dr. Phil",
                  "Her zaman bir plana ihtiyacın yok. Bazen sadece nefes alman, güvenmen, bırakman ve ne olacağını görmen gerekir. - Mandy Hale",
                  "Benim için açılmayan o eski kapıyı çalmaya devam etmeyeceğim. Kendi kapımı yaratacağım ve içinden geçeceğim. - Ava DuVernay",
                  "Sadece gerçekten yapmak istediğin şeyi yapmaya çalışmaktan vazgeçme. Aşkın ve ilhamın olduğu yerde yanlış gidebileceğini düşünmüyorum - Ella Fitzgerald"
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        textView.layer.cornerRadius = 10.0
        textLabel.numberOfLines = -1
        textLabel.adjustsFontSizeToFitWidth = true
        
        rasgeleMetin()
        
//        RECOGNİZER
        
        let didTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapAction))
        
        view.addGestureRecognizer(didTapGestureRecognizer)
        
        
    }
    func rasgeleMetin(){
        let randomNumber = Int.random(in: 0...(quotes.count-1))
        textLabel.text = quotes[randomNumber]
    }
    @IBAction func shuffleText(_ sender: Any){
        rasgeleMetin()
    }

    @objc func didTapAction(){
        let randomNumber = Int.random(in: 0...(quotes.count-1))
        textLabel.text = quotes[randomNumber]
    }
    
    @IBAction func sharePressed(_ sender: Any) {
        let activityVC = UIActivityViewController(activityItems: [textLabel.text!], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true,completion: nil)
    }
}

