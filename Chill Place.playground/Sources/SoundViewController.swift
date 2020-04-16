import Foundation
import PlaygroundSupport
import WebKit
import AVKit
import AVFoundation


public class SoundViewController : UIViewController, WKUIDelegate {
    public var feelingsSelected:[String] = []
    
    let firstPlayButton = playlistSound(soundNumber: "1", X: 46, Y: 250, function: #selector(touchedPlaySong)).button
    let secondPlayButton = playlistSound(soundNumber: "2", X: 216, Y: 250, function: #selector(touchedPlaySong)).button
    let thirdPlayButton = playlistSound(soundNumber: "3", X: 46,Y: 300, function: #selector(touchedPlaySong)).button
    let fourthPlayButton = playlistSound(soundNumber: "4", X: 216,Y: 300, function: #selector(touchedPlaySong)).button
    
    var webView: WKWebView!
    
    var sound1 = ""
    var sound2 = ""
    var sound3 = ""
    var sound4 = ""
    
    var alpha = 0
    var beta = 0
    var delta = 0
    var theta = 0
    
    public var player: AVPlayer!
    var playerLayer: AVPlayerLayer!
    
    public override func loadView() {
        let soundPage = UIView()
        soundPage.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        soundPage.backgroundColor = .white
        
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: CGRect(x: 16, y: 360, width: 380, height: 177), configuration: webConfiguration)
        webView.uiDelegate = self
        webView.isHidden = true
        
        //images
        //backgrounds
        
        let filePath = Bundle.main.path(forResource: "SoundAnimation", ofType: "mov")
        let videoURL = URL.init(fileURLWithPath: filePath!)
        player = AVPlayer(url: videoURL as URL)
        
        playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = CGRect(x: 419, y: 0, width: 1050, height: 900)
        playerLayer.videoGravity = .resize
        player.actionAtItemEnd = .none
        player.play()
        
        //NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: player.currentItem)
        
        
        
        let image2 = UIImage(named: "Sound Phone")!
        let phone = UIImageView(image: image2)
        
        //putting the navigation bar on the phone
        let phoneNavigationBar = NavigationBar(X: 16, Y: 73, Width: 206, Height: 22)
        phoneNavigationBar.backButton.addTarget(nil, action: #selector(touchedBack), for: .touchUpInside)
        
        //Labels
        let titleFont = UIFont(name: "Courier", size: 28)
        let title = UILabel()
        title.font = titleFont
        title.text = "Essa é sua Playlist!"
        title.textColor = .white
        title.textAlignment = .left
        title.frame = CGRect(x: 29, y: 119, width: 380, height: 35)
        title.lineBreakMode = .byWordWrapping
        title.numberOfLines = 0
        
        
        let subtitleFont = UIFont(name: "Courier", size: 22)
        let subtitle = UILabel()
        subtitle.font = subtitleFont
        subtitle.text = "Essas músicas irão te ajudar a se sentir melhor!"
        subtitle.textColor = .white
        subtitle.textAlignment = .left
        subtitle.frame = CGRect(x: 29, y: 164, width: 326, height: 70)
        subtitle.lineBreakMode = .byWordWrapping
        subtitle.numberOfLines = 0
        
        let subtitle2 = UILabel()
        subtitle2.font = subtitleFont
        subtitle2.text = "Recomendamos escutar com fones de ouvido!!"
        subtitle2.textColor = .white
        subtitle2.textAlignment = .left
        subtitle2.frame = CGRect(x: 29, y: 527, width: 326, height: 70)
        subtitle2.lineBreakMode = .byWordWrapping
        subtitle2.numberOfLines = 0
        
        for feeling in feelingsSelected {
            if feeling == "Ansiedade" || feeling == "Medo" || feeling == "Tensão" || feeling == "Tristeza"  || feeling == "Pensamentos Negativos" || feeling == "Inútil" || feeling == "Fadiga"{
                
                alpha = 1
                
                if feeling == "Ansiedade"  || feeling == "Tensão"{
                    delta = 1
                    if feeling == "Ansiedade" {
                        theta = 1
                    }
                } else if feeling == "Fadiga" {
                    beta = 1
                } else if feeling == "Medo"  || feeling == "Inútil"{
                    theta = 1
                }
            } else {
                delta = 1
                
                if  feeling == "Insônia"{
                    theta = 1
                }
            }
        }
        
        if alpha == 1 {
            sound1 = "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/534448191&color=%230066cc&auto_play=true&hide_related=true&show_comments=false&show_user=true&show_reposts=false&show_teaser=false"
            
            if delta == 1 && theta == 1 && beta == 1{ //alpha+beta+theta+delta
                
                sound2 = "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/534468351&color=%230066cc&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true"
                
                sound3 = "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/534468126&color=%230066cc&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true"
                
                sound4 = "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/534452598&color=%230066cc&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true"
                
                
            } else if beta == 1 || theta == 1 || delta == 1{
                
                if beta == 1{
                    
                    sound2 = "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/534468351&color=%230066cc&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true"
                    
                    sound4 = "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/417505842&color=%232f233b&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true"
                    
                    if theta == 1{ //alpha+beta+theta
                        
                        sound3 = "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/534452598&color=%230066cc&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true"
                        
                    } else if delta == 1{ //alpha+beta+delta
                        
                        sound3 = "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/534468126&color=%230066cc&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true"
                        
                    } else{ //alpha+beta
                        
                        sound3 = "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/428663355&color=%232a261a&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true"
                    }
                    
                } else if theta == 1{
                    
                    sound2 = "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/431609280&color=%231c3434&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true"
                    
                    sound4 = "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/417505842&color=%232f233b&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true"
                    
                    if delta == 1 {//alpha+theta+delta
                        
                        sound3 = "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/534468126&color=%230066cc&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true"
                        
                    } else { //alpha+theta
                        
                        sound3 = "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/534452598&color=%230066cc&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true"
                    }
                    
                } else if delta == 1{ //alpha+delta
                    
                    sound2 = "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/534468126&color=%230066cc&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true"
                    
                    sound3 = "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/417505842&color=%232f233b&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true"
                    
                    sound4 = "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/420018404&color=%232f233b&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true"
                }
                
            } else { //alpha
                
                sound2 = "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/432070080&color=%23182d1d&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true"
                
                sound3 = "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/417505842&color=%232f233b&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true"
                
                fourthPlayButton.isHidden = true
            }
            
        } else if delta == 1{
            
            sound1 = "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/534468126&color=%230066cc&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true"
            
            sound3 = "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/420043752&color=%232a261a&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true"
            
            if theta == 1{//theta+delta
                
                sound2 = "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/420014528&color=%232f233b&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true"
                
                sound4 = "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/420015608&color=%232f233b&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true"
                
            } else{//delta
                
                sound2 = "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/420018404&color=%232f233b&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true"
                
                fourthPlayButton.isHidden = true
            }
        } else {
            sound1 = "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/534448191&color=%230066cc&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true"
            sound2 = "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/534468351&color=%230066cc&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true"
            
            sound3 = "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/534468126&color=%230066cc&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true"
            
            sound4 = "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/534452598&color=%230066cc&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true"
            
        }
        
        //Adding elements on subview
        //soundPage.addSubview(soundCloser)
        soundPage.addSubview(phone)
        soundPage.addSubview(phoneNavigationBar.backBar)
        soundPage.addSubview(phoneNavigationBar.backButton)
        soundPage.addSubview(title)
        soundPage.addSubview(subtitle)
        soundPage.addSubview(subtitle2)
        soundPage.addSubview(firstPlayButton)
        soundPage.addSubview(secondPlayButton)
        soundPage.addSubview(thirdPlayButton)
        soundPage.addSubview(fourthPlayButton)
        soundPage.addSubview(webView)
        soundPage.layer.addSublayer(playerLayer)
        
        self.view = soundPage
    }
    
    /*@objc func playerItemDidReachEnd(notification: Notification) {
     if let playerItem = notification.object as? AVPlayerItem {
     playerItem.seek(to: CMTime.zero, completionHandler: nil)
     }
     }*/
    
    public override func viewDidAppear(_ animated: Bool) {
        if player != nil {
            player.play()
        }
    }
    
    var lastSender = UIButton()
    @IBAction func touchedPlaySong(sender: UIButton){
        
        sender.isSelected = !sender.isSelected
        var soundURL: URL
        
        if lastSender.isSelected == true && lastSender != sender {
            lastSender.isSelected = false
        }
        
        lastSender = sender
        
        if sender.isSelected{
            if sender.currentTitle! == "Música 1" {
                soundURL = URL(string: sound1)!
            } else if sender.currentTitle! == "Música 2" {
                soundURL = URL(string: sound2)!
            } else if sender.currentTitle! == "Música 3" {
                soundURL = URL(string: sound3)!
            } else {
                soundURL = URL(string: sound4)!
            }
            
            let soundRequest = URLRequest(url: soundURL)
            webView.load(soundRequest)
            webView.isHidden = false
        } else{
            webView.reload()
            webView.isHidden = true
        }
        
    }
    
    @IBAction func touchedBack(){
        player.currentItem?.seek(to: CMTime.zero, completionHandler: nil)
        player.pause()
        navigationController?.popViewController(animated: true)
    }
}
