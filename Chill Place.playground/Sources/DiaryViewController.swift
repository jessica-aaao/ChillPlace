import Foundation
import PlaygroundSupport
import WebKit
import AVKit
import AVFoundation

public class DiaryViewController : UIViewController {
    let saveButton = UIButton()
    let discardButton = UIButton()
    let writeHere = UITextView()
    
    var player: AVPlayer!
    var playerLayer: AVPlayerLayer!
    
    public override func loadView() {
        let diaryPage = UIView()
        diaryPage.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        diaryPage.backgroundColor = .white
        
        //images
        //backgrounds
        let filePath = Bundle.main.path(forResource: "DiaryAnimation", ofType: "mov")
        let videoURL = URL.init(fileURLWithPath: filePath!)
        player = AVPlayer(url: videoURL as URL)
            
        playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = CGRect(x: 419, y: 0, width: 1050, height: 900)
        playerLayer.videoGravity = .resize
        player.actionAtItemEnd = .pause
        player.play()
        
        let image2 = UIImage(named: "Diary Page")!
        let page = UIImageView(image: image2)
        
        //labels
        let diaryFont = UIFont(name: "Bradley Hand", size: 28)
        let writingFont = UIFont(name: "Bradley Hand", size: 20)
        
        let title = UILabel()
        title.frame = CGRect(x: 36, y: 80, width: 341, height: 70)
        title.lineBreakMode = .byWordWrapping
        title.numberOfLines = 0
        title.font = diaryFont
        title.textColor = #colorLiteral(red: 0.05882352941, green: 0.1176470588, blue: 0.2117647059, alpha: 1)
        title.text = "ESCREVE AQUI TUDO \n QUE TE AFLIGE!!!"
        title.textAlignment = .center
        
        //text field
        writeHere.frame = CGRect(x: 30, y: 207, width: 351, height: 471)
        writeHere.textAlignment = .justified
        writeHere.font = writingFont
        writeHere.showsVerticalScrollIndicator = true
        writeHere.isScrollEnabled = true
        writeHere.backgroundColor = #colorLiteral(red: 0.8901960784, green: 0.8549019608, blue: 0.8039215686, alpha: 1)
        writeHere.layer.cornerRadius = 10
        writeHere.isEditable = true
        
        //buttons
        let image5 = UIImage(named: "Salvar Button")!
        saveButton.frame = CGRect(x: 30, y: 720, width: 355, height: 56)
        saveButton.setImage(image5, for: .normal)
        saveButton.addTarget(nil, action: #selector(touchedSave), for: .touchUpInside)
        
        let image6 = UIImage(named: "Descartar Button")
        discardButton.frame = CGRect(x: 30, y: 800, width: 355, height: 56)
        discardButton.setImage(image6, for: .normal)
        discardButton.addTarget(nil, action: #selector(touchedDiscard), for: .touchUpInside)
        
        //putting the navigation bar on the phone
        let phoneNavigationBar = NavigationBar(X: 16, Y: 23, Width: 206, Height: 22)
        phoneNavigationBar.backBar.frame = CGRect(x: 0, y: 0, width: 420, height: 66)
        phoneNavigationBar.backButton.addTarget(nil, action: #selector(touchedBack), for: .touchUpInside)
        
        //Adding elements on subview
        diaryPage.layer.addSublayer(playerLayer)
        diaryPage.addSubview(page)
        diaryPage.addSubview(phoneNavigationBar.backBar)
        diaryPage.addSubview(phoneNavigationBar.backButton)
        diaryPage.addSubview(saveButton)
        diaryPage.addSubview(discardButton)
        diaryPage.addSubview(writeHere)
        diaryPage.addSubview(title)
        
        self.view = diaryPage
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        if player != nil {
            player.play()
        }
    }
    
    @IBAction func touchedSave(){
        
        let date = Date()
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day], from: date)
        let day = dateComponents.day!
        let month = dateComponents.month!
        let year = dateComponents.year!
        let todayDate = "\(day)-\(month)-\(year)"
        
        if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let fileUrl = documentDirectory.appendingPathComponent("\(todayDate).txt")
            
            let textToWrite = String(writeHere.text!) + "\n\n"
            
            if FileManager.default.fileExists(atPath: fileUrl.path) {
                
                if let fileHandle = try? FileHandle(forWritingTo: fileUrl) {
                    fileHandle.seekToEndOfFile()
                    fileHandle.write(textToWrite.data(using: .utf8)!)
                    fileHandle.closeFile()
                }
            }
            else {
                do {
                    try textToWrite.write(to: fileUrl, atomically: true, encoding: .utf8)
                    print("writing was successful")
                    
                } catch {
                    print("Error writing file: \(error)")
                }
            }
        }
    }
    
    @IBAction func touchedDiscard(){
        writeHere.text = ""
    }
    
    @IBAction func touchedBack(){
        player.currentItem?.seek(to: CMTime.zero, completionHandler: nil)
        player.pause()
        navigationController?.popViewController(animated: true)
    }
}
