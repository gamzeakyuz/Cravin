# 🧘 Cravin — iOS Meditasyon & Zihin Sağlığı Platformu
`swift5`, `uikit`, `coredata`, `mvc-architecture`, `avfoundation`, `ios-development`.


Cravin, kullanıcıların zihin sağlığını desteklemek, meditasyon alışkanlığı kazandırmak ve günlük stres yönetimine yardımcı olmak amacıyla geliştirilmiş kapsamlı bir iOS uygulamasıdır. Uygulama; meditasyon rehberleri, motivasyon alıntıları, podcast içerikleri, video oturumları ve kişisel not alma özelliklerini tek bir çatıda bir araya getirir.

---

### 🚀 Kurulum ve Çalıştırma Notu
Proje içerisinde yer alan yüksek boyutlu yerel video (`.mp4`) ve ses (`.mp3`) dosyaları, **Git LFS (Large File Storage)** entegrasyonu sayesinde uzak repoya eksiksiz bir şekilde dahil edilmiştir. 

Projeyi kendi yerel ortamınızda simülatör üzerinde çalıştırmak ve tüm modülleri (ses/video oynatıcılar dahil) test etmek için aşağıdaki adımları izleyebilirsiniz:

1. **Projeyi Klonlayın:**
   ```bash
   git clone [https://github.com/gamzeakyuz/Cravin.git](https://github.com/gamzeakyuz/Cravin.git)
---

## 🎯 Uygulamanın Amacı
Kullanıcılara günlük yaşamın stresinden uzaklaşabilecekleri dijital bir sığınak sunmak, yerel veri saklama çözümleriyle kendi düşüncelerini kayıt altına almalarını sağlamak ve zihin-beden sağlığı konularında rehberlik etmektir.

## 🛠 Kullanılan Teknolojiler ve Yapılar

### Programlama Dili
| Teknoloji | Açıklama |
| :--- | :--- |
| **Swift 5** | Apple'ın modern, güvenli ve hızlı programlama dili. Uygulamanın tüm mantığı Swift ile yazılmıştır. |

### Framework'ler (Apple Native)
| Framework | Nerede Kullanıldı | Açıklama |
| :--- | :--- | :--- |
| **UIKit** | Tüm Ekranlar | iOS'un temel UI framework'ü. Görsel bileşenlerin (butonlar, label, tableView vb.) oluşturulmasında kullanıldı. |
| **CoreData** | `DataModel.swift`, `AppDelegate.swift` | Apple'ın yerleşik yerel veritabanı çözümü. Kullanıcının yazdığı notlar (Düşün Seli ekranı) kalıcı olarak cihazda saklanır. |
| **AVFoundation** | `PodcastPlayerVC.swift` | Ses dosyalarını (.mp3) oynatmak için kullanılan medya framework'ü. Play/Pause, ses seviyesi ve slider kontrolü bu çatı ile yapılmıştır. |
| **AVKit** | `SakinAlanVC.swift` | Video dosyalarını (.mp4) oynatmak için kullanılan framework. `AVPlayerViewController` ile tam ekran video oynatma sağlanmıştır. |

---

## 🏗 Yazılım Mimarisi Detayları

### 🔹 Model Katmanı
* **`Bilgilendirme` (class):** `title`, `image` ve `details` alanlarını barındıran, custom initializer (`init`) ile kurgulanmış bilgi kartı veri modeli.
* **`Podcast` (struct):** `name`, `albumName`, `artistName`, `imageName` ve `trackName` alanlarından oluşan, bellek dostu *value-type* veri yapısı.
* **`DataModel` (Singleton class):** Veri tutarlılığını sağlamak amacıyla tüm CoreData operasyonlarını tek bir noktadan merkezi olarak yöneten; `loadData()`, `save()` ve `delete()` fonksiyonlarını barındıran katman.

### 🔹 View Katmanı
* **`Main.storyboard`:** Sürükle-bırak kolaylığı ve farklı ekran boyutlarına tam uyum sağlayan **Auto Layout** destekli görsel UI mimarisi.
* Ekran tasarımları ile arka plandaki kod mantığı arasındaki iletişim tamamen `@IBOutlet` ve `@IBAction` bağlantıları üzerinden kurgulanmıştır.

### 🔹 Controller Katmanı
* Uygulamanın ekran akışlarını, yaşam döngüsünü (Lifecycle) ve kullanıcı etkileşimlerini yöneten **23 adet özelleştirilmiş `UIViewController` subclass'ı**.

---

## 📱 Uygulama Özellikleri & Modül Analizleri

### 1. 🧘 Meditasyon Modülü (`MeditasyonVC`)
* **Zengin İçerik Yönlendirmesi:** Kullanıcıların ihtiyaçlarına göre seçebileceği 10 farklı köklü meditasyon türü (Zen, Yoga, Mantra, Chakra, Vipassana, Mindfulness, Transandantal, Loving-Kindness, Nefes Farkındalığı, Nidra Yoga) listelenmiştir.
* **Güvenli Navigasyon:** Ekranlar arası geçişler Storyboard Segue yapıları ile kararlı hale getirilmiştir.
* **Dinamik Arayüz:** Tam ekran arka plan görsel özelleştirmeleri için `UIImageView` kullanılırken, bazı geçişlerde `instantiateViewController(withIdentifier:)` ile programatik navigasyon yönetimi tercih edilmiştir.

### 2. 🎯 Olumlama (Motivasyon Alıntıları) Modülü (`OlumlamaVC`)
* **Veri Seti:** Kullanıcı motivasyonunu her açılışta yüksek tutmak amacıyla kurgulanmış 35'ten fazla özel alıntı listesi barındırır.
* **Rastgele Algoritma:** `Int.random(in:)` yapısı kullanılarak her etkileşimde ekrana dinamik ve benzersiz bir alıntı getirilmesi sağlanır.
* **Jest Algılayıcı:** `UITapGestureRecognizer` entegrasyonu sayesinde kullanıcının sadece ekrana dokunarak yeni bir alıntı tetiklemesi sağlanmıştır.
* **Sosyal Entegrasyon:** `UIActivityViewController` yerel iOS paylaşım arayüzü entegre edilerek, beğenilen alıntıların sosyal medyada veya mesajlarda kolayca paylaşılması desteklenmiştir.

### 3. 📰 Bilgilendirme Modülü (`NedirVC` + `NedirDetayVC`)
* **Dinamik Listeleme:** Performans odaklı veri gösterimi için `UITableView` mimarisi üzerinde `delegate` ve `dataSource` pattern'leri uygulanmıştır.
* **Özel Hücre Tasarımı:** Standart görünümlerin dışına çıkılarak, tasarıma özel bir `CustomTableViewCell` sınıfı kodlanmıştır.
* **Veri Aktarımı:** Listeden seçilen ögeye ait bilgilerin detay ekranına güvenli ve eksiksiz taşınması için `prepare(for:sender:)` metodu üzerinden Segue veri transferi kurgulanmıştır.
* **İçerik Kapsamı:** Zihin-beden sağlığını destekleyen 6 kritik makale başlığı (Uykunun Etkileri, Meditasyon ve Beyin, Kalp Çakrası, Müzik Terapisi, Biyolojik Saat, Stres Yönetimi & Bilişsel Terapi) listelenir.

### 4. 🎙 Podcast Modülü (`PodcastVC` + `PodcastPlayerVC`)
* **Medya Listesi:** `UITableView` kullanılarak listelenen yerel podcast içerikleri arayüze bağlanmıştır.
* **Ses Oynatıcı:** `AVFoundation` framework'ünün `AVAudioPlayer` sınıfı ile yerel ses dosyalarının kararlı ve akıcı bir şekilde oynatılması sağlanmıştır.
* **Oturum Yönetimi:** Arka plan ses dengesini korumak adına `AVAudioSession` ile ses oturumu konfigürasyonları (`.setMode(.default)`, `.setActive()`) yapılmıştır.
* **Kullanıcı Kontrolleri:** `UISlider` kullanılarak hassas anlık ses seviyesi kontrolü; Play/Pause ve İleri/Geri buton etkileşimleri kurgulanmıştır.
* **Estetik Animasyonlar:** Medya duraklatıldığında veya oynatıldığında albüm kapağının yumuşak bir şekilde küçülüp büyümesini sağlayan `UIView.animate()` blokları eklenmiştir.

### 5. 🎬 Sakin Alan (Video) Modülü (`SakinAlanVC`)
* **Native Güç:** Apple'ın yerleşik `AVKit` framework'ünün gücünden yararlanılarak kararlı bir video oynatıcı arayüzü oluşturulmuştur.
* **Video Mimarisi:** `AVPlayer` ve `AVPlayerViewController` entegrasyonu sayesinde akıcı, tam ekran destekli ve native oynatıcı kontrollerine sahip bir video deneyimi sunulmuştur.
* **Tematik Kategoriler:** Kullanıcıların odaklanmasını veya uykuya geçişini kolaylaştıran 9 farklı yüksek çözünürlüklü tema (Yağmur, Odaklanma, Şelale, Düşler Diyarı, Doğa, Uyku, Piyano, Huzur, Sessizlik) sunulmaktadır.

### 6. 📝 Düşün Seli (Not Defteri) Modülü (`DusunSeliVC`)
Uygulamanın iş mantığı (Business Logic) açısından en yoğun ve veri kalıcılığı katmanının doğrudan test edildiği en teknik modüldür:
* **CoreData CRUD İşlemleri:**
    * **Create (Oluşturma):** `DataModel.shared.save(_:)` metodu çağrılarak arayüzden alınan girdiyle dinamik yeni bir `NSManagedObject` örneği oluşturulur.
    * **Read (Okuma):** `DataModel.shared.loadData()` fonksiyonu tetiklenerek arka planda `NSFetchRequest` yardımıyla cihaz diskindeki yerel veriler çekilir ve TableView'a basılır.
    * **Delete (Silme):** `DataModel.shared.delete(_:)` ile ilgili nesne bellek bağlamından silinir ve `context` güncellenerek disk kalıcılığı sağlanır.
* **Klavye Yönetimi:** `UITextFieldDelegate` protokolü entegre edilerek, kullanıcının klavyedeki "Return" (Bitti) tuşuna basmasıyla notun otomatik olarak kaydedilmesi ve klavyenin estetik şekilde kapanması kurgulanmıştır.
* **Hızlı Aksiyonlar:** `UISwipeActionsConfiguration` (Trailing Swipe) mekanizması entegre edilerek, kullanıcının not satırını sola kaydırarak animasyonlu bir şekilde hızlı silme aksiyonu tetiklemesi sağlanmıştır.
* **Veri Güvenliği:** Olası yanlış silmelerin önüne geçmek amacıyla `UIAlertController` ile modern bir "Silme Onay Diyaloğu" kurgulanmıştır.

---

## 🧩 Kullanılan Temel Swift / UIKit Konseptleri

* **Protocol & Delegate Pattern:** `UITableView` veri kaynaklarının beslenmesi, hücre etkileşimleri ve klavye aksiyonlarının takibi (`UITextFieldDelegate`) gibi yoğun olay yönetimleri protokol mimarisiyle gevşek bağlı (loosely coupled) olarak tasarlanmıştır.
* **Extension Kullanımı:** Temiz kod (Clean Code) ve yüksek okunabilirlik standartları gereği, her bir ViewController sınıfının protokol uyumlulukları ana kod bloğundan ayrıştırılarak `extension` yapıları içinde yazılmıştır.
* **Singleton Pattern:** Uygulama genelinde tek bir veritabanı bağlamının (context) bulunması ve veri tutarlılığının korunması amacıyla `DataModel.shared` tasarımı uygulanmıştır.
* **Lazy Properties:** `NSPersistentContainer` gibi ilk yükleme maliyeti ve bellek tüketimi yüksek olan yapılar `lazy var` ile sarmalanarak yalnızca ihtiyaç duyulduğu anda belleğe yüklenmesi (Lazy Loading) sağlanmıştır.
* **Guard & Optional Binding:** Olası çalışma zamanı hatalarının (runtime crash) ve `nil` değer uyumsuzluklarının önüne geçmek adına savunma odaklı kodlama prensibiyle `guard let` blokları yoğun şekilde kullanılmıştır.

---

## 🗄 Veri Kalıcılığı: CoreData Model Şeması

* **Entity (Tablo):** `Notes`
* **Attributes (Alanlar):** `note` (Tipi: `String`)

| Fonksiyon | Tetiklenen İşlem | Açıklama |
| :--- | :--- | :--- |
| **`loadData()`** | `NSFetchRequest` | Cihazın yerel diskinde kayıtlı olan tüm not verilerini hafızaya asenkron olarak çeker ve arayüz listesini günceller. |
| **`save()`** | `NSManagedObject` & `context.save()` | Parametre olarak gelen string veriyi yeni bir veritabanı nesnesine dönüştürür ve diske kalıcı olarak yazar. |
| **`delete()`** | `managedContext.delete()` | Seçilen satıra ait veritabanı nesnesini diskten kaldırır, ardından context'i kaydederek listeyi animasyonla günceller. |

---

## 🏗 Yazılım Mimarisi

### Tasarım Deseni: MVC (Model – View – Controller)
Proje, iOS geliştirmede endüstri standardı olan **MVC** deseniyle yapılandırılmış ve temiz kod (Clean Code) pratiklerine uygun olarak klasörlenmiştir:

```text
Cravin/
├── Model/          → Veri yapıları ve iş mantığı
│   ├── DataModel.swift      (CoreData CRUD işlemleri)
│   ├── Podcast.swift        (Podcast veri modeli)
│   └── Specification.swift  (Bilgilendirme veri modeli)
│
├── View/           → Kullanıcı arayüzü dosyaları
│   ├── Base.lproj/Main.storyboard   (Tüm ekranların UI tasarımı)
│   └── Launch Screen.storyboard     (Açılış ekranı)
│
└── Controller/     → Uygulama mantığı (23 adet ViewController)
    ├── AppDelegate.swift
    ├── SceneDelegate.swift
    ├── ContainerTabController.swift
    └── [20+ ViewController]


