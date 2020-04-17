import Foundation
import PlaygroundSupport
import WebKit
import AVKit
import AVFoundation

public class TvViewController : UIViewController, WKUIDelegate {
    public var feelingsSelected:[String] = []
    let fullScreenButton = UIButton()
    
    let firstPlayButton = playlistVideo(videoNumber: "1", X: 46, Y: 250, function: #selector(touchedPlayVideo)).button
    let secondPlayButton = playlistVideo(videoNumber: "2", X: 216, Y: 250, function: #selector(touchedPlayVideo)).button
    let thirdPlayButton = playlistVideo(videoNumber: "3", X: 46,Y: 360, function: #selector(touchedPlayVideo)).button
    let fourthPlayButton = playlistVideo(videoNumber: "4", X: 216,Y: 360, function: #selector(touchedPlayVideo)).button
    
    var webView: WKWebView!
    
    //var webConfiguration = WKWebViewConfiguration()
    
    var video1 = ""
    var video2 = ""
    var video3 = ""
    var video4 = ""
    
    var alpha = 0
    var beta = 0
    var delta = 0
    var theta = 0
    
    var fullScreen = false
    
    var player: AVPlayer!
    var playerLayer: AVPlayerLayer!
    
    public override func loadView() {
        let tvPage = UIView()
        tvPage.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        tvPage.backgroundColor = .white
        
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.ignoresViewportScaleLimits = true
        webView = WKWebView(frame: CGRect(x: 419, y: 40, width: 1025, height: 850), configuration: webConfiguration)
        webView.uiDelegate = self
        webView.isHidden = true
        
        //images
        //backgrounds
        let filePath = Bundle.main.path(forResource: "TVAnimation", ofType: "mov")
        let videoURL = URL.init(fileURLWithPath: filePath!)
        player = AVPlayer(url: videoURL as URL)
            
        playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = CGRect(x: 419, y: 0, width: 1050, height: 900)
        playerLayer.videoGravity = .resizeAspectFill
        player.actionAtItemEnd = .pause
        player.play()
        
        let image2 = UIImage(named: "Chat Phone")!
        let phone = UIImageView(image: image2)
        
        //buttons
        let image5 = UIImage(named: "Full Screen")
        fullScreenButton.frame = CGRect(x: 1350, y: 830, width: 73, height: 61)
        fullScreenButton.setImage(image5, for: .normal)
        fullScreenButton.addTarget(nil, action: #selector(touchedfullScreen), for: .touchUpInside)
        fullScreenButton.backgroundColor = .black
        fullScreenButton.isHidden = true
        
        //labels
        let title = UILabel()
        let titleFont = UIFont(name: "Courier", size: 30)!
        title.frame = CGRect (x: 21, y: 119, width: 400, height: 70)
        title.text = "Escolha um dos Vídeos Abaixo!"
        title.lineBreakMode = .byWordWrapping
        title.numberOfLines = 0
        title.textColor = .black
        title.textAlignment = .center
        title.font = titleFont
        
        let subtitleFont = UIFont(name: "Courier", size: 22)
        let subtitle = UILabel()
        subtitle.font = subtitleFont
        subtitle.text = "Recomendamos colocar fones de ouvido!!"
        subtitle.textColor = .black
        subtitle.textAlignment = .left
        subtitle.frame = CGRect(x: 21, y: 179, width: 326, height: 70)
        subtitle.lineBreakMode = .byWordWrapping
        subtitle.numberOfLines = 0
        
        
        //putting the navigation bar on the phone
        let phoneNavigationBar = NavigationBar(X: 16, Y: 73, Width: 206, Height: 22)
        phoneNavigationBar.backButton.addTarget(nil, action: #selector(touchedBack), for: .touchUpInside)
        
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
            video1 = "https://www.youtube.com/embed/watch?v=rEEHdaRo5mE"
            
            if delta == 1 && theta == 1 && beta == 1{ //alpha+beta+theta+delta
                video2 = video1
                
                video1 = "https://www.youtube.com/embed/KEAW_2lO-bA"
                
                video3 = "https://www.youtube.com/embed/HA6nSQawROM"
                
                video4 = "https://www.youtube.com/embed/hIv13ou5mzw"
                
                
            } else if beta == 1 || theta == 1 || delta == 1{
                
                if beta == 1{
                    
                    video4 = video1
                    
                    video1 = "https://www.youtube.com/embed/81DZeMb9T84"
                    
                    video3 = "https://www.youtube.com/embed/NDXB9k9GfC0"
                    
                    if theta == 1{ //alpha+beta+theta
                        
                        video2 = "https://www.youtube.com/embed/CreU9g302yU"
                        
                    } else if delta == 1{ //alpha+beta+delta
                        
                        video2 = "https://www.youtube.com/embed/hIv13ou5mzw"
                        
                    } else{ //alpha+beta
                        
                        video2 = "https://www.youtube.com/embed/ZrGrYyScwjQ"
                    }
                    
                } else if theta == 1{
                    
                    video4 = video1
                    
                    video1 = "https://www.youtube.com/embed/p3BIW8GbVF8"
                    
                    video3 = "https://www.youtube.com/embed/1jQH0RqLJ2c"
                    
                    if delta == 1 {//alpha+theta+delta
                        
                        video2 = "https://www.youtube.com/embed/4SmAqaCrCpU"
                        
                    } else { //alpha+theta
                        
                        video2 = "https://www.youtube.com/embed/xPFedcuiWYE"
                    }
                    
                } else if delta == 1{ //alpha+delta
                    
                    video2 = video1
                    
                    video1 = "https://www.youtube.com/embed/5561pihKITU"
                    
                    video3 = "https://www.youtube.com/embed/xsfyb1pStdw"
                    
                    video4 = "https://www.youtube.com/embed/hCAJhkc2K08"
                }
                
            } else { //alpha
                
                video2 = "https://www.youtube.com/embed/hCAJhkc2K08"
                
                video3 = "https://www.youtube.com/embed/9TPSs16DwbA"
                
                fourthPlayButton.isHidden = true
            }
            
        } else if delta == 1{
            
            video1 = "https://www.youtube.com/embed/hIv13ou5mzw"
            
            video3 = "https://www.youtube.com/embed/NhJpV11spJU"
            
            if theta == 1{//theta+delta
                
                video2 = video1
                
                video1 = "https://www.youtube.com/embed/k9M89y63VYU"
                
                video3 = "https://www.youtube.com/embed/CreU9g302yU"
                
            } else{//delta
                
                video2 = "https://www.youtube.com/embed/xsfyb1pStdw"
                
                fourthPlayButton.isHidden = true
            }
        } else {
            video1 = "https://www.youtube.com/embed/KEAW_2lO-bA"
            
            video2 = "https://www.youtube.com/embed/xPFedcuiWYE"
            
            video3 = "https://www.youtube.com/embed/rc6figNC07o"
            
            video4 = "https://www.youtube.com/embed/k9M89y63VYU" 
            
        }
        
        //Adding elements on subview
        tvPage.layer.addSublayer(playerLayer)
        tvPage.addSubview(phone)
        tvPage.addSubview(phoneNavigationBar.backBar)
        tvPage.addSubview(phoneNavigationBar.backButton)
        tvPage.addSubview(title)
        tvPage.addSubview(subtitle)
        tvPage.addSubview(fullScreenButton)
        tvPage.addSubview(firstPlayButton)
        tvPage.addSubview(secondPlayButton)
        tvPage.addSubview(thirdPlayButton)
        tvPage.addSubview(fourthPlayButton)
        tvPage.addSubview(webView)
        tvPage.addSubview(fullScreenButton)
        
        self.view = tvPage
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        if player != nil {
            player.play()
        }
    }
    
    var lastSender = UIButton()
    
    @IBAction func touchedPlayVideo(sender: UIButton){
        sender.isSelected = !sender.isSelected
        var videoURL: URL
        
        if lastSender.isSelected == true && lastSender != sender {
            lastSender.isSelected = false
        }
        
        lastSender = sender
        if sender.isSelected{
            if sender.currentTitle! == "Vídeo 1" {
                videoURL = URL(string: video1)!
            } else if sender.currentTitle! == "Vídeo 2" {
                videoURL = URL(string: video2)!
            } else if sender.currentTitle! == "Vídeo 3" {
                videoURL = URL(string: video3)!
            } else {
                videoURL = URL(string: video4)!
            }
            
            fullScreenButton.isHidden = false
            let videoRequest = URLRequest(url: videoURL)
            webView.load(videoRequest)
            webView.uiDelegate = self
            webView.isHidden = false
        } else{
            fullScreenButton.isHidden = true
            webView.reload()
            webView.isHidden = true
        }
        
        
        
    }
    
    @IBAction func touchedfullScreen(){
        if fullScreen {
            webView.frame = CGRect(x: 419, y: 40, width: 1025, height: 850)
            fullScreen = false
        } else{
            webView.frame = self.view.frame
            fullScreen = true
        }
        
        
    }
    
    @IBAction func touchedBack(){
        player.currentItem?.seek(to: CMTime.zero, completionHandler: nil)
        player.pause()
        navigationController?.popViewController(animated: true)
    }
}
