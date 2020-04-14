import Foundation
import PlaygroundSupport
import UIKit
import AVFoundation


public class IpadViewController : UIViewController {
    let recordButton = UIButton()
    let stopButton = UIButton()
    let ipadButtonSubtitle = UILabel()
    let ipadButtonSubtitle2 = UILabel()
    let ipadTitle2 = UILabel()
    let saveButton = UIButton()
    let discardButton = UIButton()
    
    var recordingSession: AVAudioSession!
    var audioRecorder: AVAudioRecorder!
    
    public override func loadView() {
        let ipadPage = UIView()
        ipadPage.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        ipadPage.backgroundColor = .white
        
        //images
        //backgrounds
        let image1 = UIImage(named: "Ipad")!
        let ipadCloser = UIImageView(image: image1)
        ipadCloser.frame = CGRect(x: 419, y: 0, width: 1050, height: 930)
        
        let image2 = UIImage(named: "Chat Phone")!
        let phone = UIImageView(image: image2)
        
        //buttons
        let image5 = UIImage(named: "Gravar Button")
        recordButton.frame = CGRect(x: 100, y: 373, width: 215, height: 215)
        recordButton.setImage(image5, for: .normal)
        recordButton.addTarget(nil, action: #selector(touchedRecord), for: .touchUpInside)
        
        let image6 = UIImage(named: "Parar Button")
        stopButton.frame = CGRect(x: 100, y: 373, width: 215, height: 215)
        stopButton.setImage(image6, for: .normal)
        stopButton.isHidden = true
        stopButton.addTarget(nil, action: #selector(touchedStop), for: .touchUpInside)
        
        let image7 = UIImage(named: "Salvar Button")!
        saveButton.frame = CGRect(x: 30, y: 720, width: 355, height: 56)
        saveButton.setImage(image7, for: .normal)
        saveButton.addTarget(nil, action: #selector(touchedSave), for: .touchUpInside)
        saveButton.isHidden = true
        
        
        let image8 = UIImage(named: "Descartar Button")
        discardButton.frame = CGRect(x: 30, y: 800, width: 355, height: 56)
        discardButton.setImage(image8, for: .normal)
        discardButton.addTarget(nil, action: #selector(touchedDiscard), for: .touchUpInside)
        discardButton.isHidden = true
        
        //putting the navigation bar on the phone
        let phoneNavigationBar = NavigationBar(X: 16, Y: 73, Width: 206, Height: 22)
        phoneNavigationBar.backButton.addTarget(nil, action: #selector(touchedBack), for: .touchUpInside)
        
        //Labels
        let ipadFont = UIFont(name: "Bradley Hand", size: 28)
        let ipadTitle = UILabel()
        ipadTitle.lineBreakMode = .byWordWrapping
        ipadTitle.numberOfLines = 0
        ipadTitle.font = ipadFont
        ipadTitle.text = "FALA AQUI TUDO QUE TE AFLIGE!!!!"
        ipadTitle.textAlignment = .center
        ipadTitle.frame = CGRect(x: 16, y: 83, width: 400, height: 150)
        ipadTitle.textColor = .black
        
        let subtitleFont = UIFont(name: "Bradley Hand", size: 22)
        
        ipadButtonSubtitle.lineBreakMode = .byWordWrapping
        ipadButtonSubtitle.numberOfLines = 0
        ipadButtonSubtitle.font = subtitleFont
        ipadButtonSubtitle.text = "Clique no botão vermelho para começar a gravar!"
        ipadButtonSubtitle.textAlignment = .center
        ipadButtonSubtitle.frame = CGRect(x: 16, y: 598, width: 400, height: 64)
        ipadButtonSubtitle.textColor = .black
        
        ipadButtonSubtitle2.lineBreakMode = .byWordWrapping
        ipadButtonSubtitle2.numberOfLines = 0
        ipadButtonSubtitle2.font = subtitleFont
        ipadButtonSubtitle2.text = "Clique no botão vermelho para parar de gravar!"
        ipadButtonSubtitle2.textAlignment = .center
        ipadButtonSubtitle2.frame = CGRect(x: 16, y: 598, width: 400, height: 64)
        ipadButtonSubtitle2.textColor = .black
        ipadButtonSubtitle2.isHidden = true
        
        let ipadFont2 = UIFont(name: "Bradley Hand", size: 24)
        ipadTitle2.lineBreakMode = .byWordWrapping
        ipadTitle2.numberOfLines = 0
        ipadTitle2.font = ipadFont2
        //ipadTitle2.font.withSize(24)
        ipadTitle2.text = "NÃO SE PREOCUPE, ESTAMOS EM UM LUGAR SEGURO E O QUE FOR DITO AQUI, SÓ VOCÊ TEM ACESSO!!!!"
        ipadTitle2.textAlignment = .center
        ipadTitle2.frame = CGRect(x: 16, y: 682, width: 395, height: 180)
        ipadTitle2.textColor = .black
        
        //Adding elements on subview
        ipadPage.addSubview(ipadCloser)
        ipadPage.addSubview(phone)
        ipadPage.addSubview(phoneNavigationBar.backBar)
        ipadPage.addSubview(phoneNavigationBar.backButton)
        ipadPage.addSubview(ipadTitle)
        ipadPage.addSubview(ipadTitle2)
        ipadPage.addSubview(ipadButtonSubtitle)
        ipadPage.addSubview(ipadButtonSubtitle2)
        ipadPage.addSubview(recordButton)
        ipadPage.addSubview(stopButton)
        ipadPage.addSubview(saveButton)
        ipadPage.addSubview(discardButton)
        self.view = ipadPage
    }
    
    @IBAction func touchedRecord(){
        recordButton.isHidden = true
        ipadButtonSubtitle.isHidden = true
        ipadTitle2.isHidden = true
        
        stopButton.isHidden = false
        ipadButtonSubtitle2.isHidden = false
        saveButton.isHidden = true
        discardButton.isHidden = true
    }
    
    @IBAction func touchedStop(){
        stopButton.isHidden = true
        ipadButtonSubtitle2.isHidden = true
        
        recordButton.isHidden = false
        saveButton.isHidden = false
        discardButton.isHidden = false
        ipadButtonSubtitle.isHidden = false
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
            
            let textToWrite = "áudio"
            
            if FileManager.default.fileExists(atPath: fileUrl.path) {
                
                if let fileHandle = try? FileHandle(forWritingTo: fileUrl) {
                    fileHandle.seekToEndOfFile()
                    fileHandle.write(textToWrite.data(using: .utf8)!)
                    fileHandle.closeFile()
                    print("writing was successful")
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
        print("descartado")
    }
    
    @IBAction func touchedBack(){
        navigationController?.popViewController(animated: true)
    }
}
