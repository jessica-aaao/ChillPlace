//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

//let backButton = UIButton()
let saveButton = UIButton()
let discardButton = UIButton()

class MainViewController : UIViewController {
    //botões do cenário
    let tvButton = UIButton()
    let soundButton = UIButton()
    let diaryButton = UIButton()
    let ipadButton = UIButton()
    
    override func loadView() {
        let firstPage = UIView()
        firstPage.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        firstPage.backgroundColor = .white
        
        //images
        //backgrounds
        let image1 = UIImage(named: "Visão Geral")!
        let safePlace = UIImageView(image: image1)
        safePlace.frame = CGRect(x: 419, y: 0, width: 1050, height: 900)
        
        let image2 = UIImage(named: "Chat Phone")!
        let phone = UIImageView(image: image2)
        
        //buttons
        let image3 = UIImage(named: "Button")!
        tvButton.frame = CGRect(x: 965, y: 344, width: 50, height: 50)
        tvButton.setImage(image3, for: .normal)
        tvButton.addTarget(nil, action: #selector(touchedTv), for: .touchUpInside)
        
        soundButton.frame = CGRect(x: 857, y: 385, width: 50, height: 50)
        soundButton.setImage(image3, for: .normal)
        soundButton.addTarget(nil, action: #selector(touchedSound), for: .touchUpInside)
        
        diaryButton.frame = CGRect(x: 906, y: 604, width: 30, height: 30)
        diaryButton.setImage(image3, for: .normal)
        diaryButton.addTarget(nil, action: #selector(touchedDiary), for: .touchUpInside)
        
        ipadButton.frame = CGRect(x: 990, y: 592, width: 30, height: 30)
        ipadButton.setImage(image3, for: .normal)
        ipadButton.addTarget(nil, action: #selector(touchedIpad), for: .touchUpInside)
        
        //Adding elements on subview
        firstPage.addSubview(phone)
        firstPage.addSubview(safePlace)
        firstPage.addSubview(tvButton)
        firstPage.addSubview(soundButton)
        firstPage.addSubview(diaryButton)
        firstPage.addSubview(ipadButton)
        
        self.view = firstPage
    }
    
    @IBAction func touchedSound(){
        navigationController?.pushViewController(soundView, animated: true)
    }
    
    @IBAction func touchedTv(){
        navigationController?.pushViewController(tvView, animated: true)
    }
    
    @IBAction func touchedDiary(){
        navigationController?.pushViewController(diaryView, animated: true)
    }
    
    @IBAction func touchedIpad(){
        navigationController?.pushViewController(ipadView, animated: true)
    }
}

class SoundViewController : UIViewController {
    override func loadView() {
        let soundPage = UIView()
        soundPage.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        soundPage.backgroundColor = .white
        
        //images
        //backgrounds
        let image1 = UIImage(named: "Sound")!
        let soundCloser = UIImageView(image: image1)
        soundCloser.frame = CGRect(x: 419, y: 0, width: 1050, height: 900)
        
        let image2 = UIImage(named: "Sound Phone")!
        let phone = UIImageView(image: image2)
        
        //putting the navigation bar on the phone
        let phoneNavigationBar = NavigationBar(X: 16, Y: 73, Width: 206, Height: 22)
        phoneNavigationBar.backButton.addTarget(nil, action: #selector(touchedBack), for: .touchUpInside)
        
        //Adding elements on subview
        soundPage.addSubview(soundCloser)
        soundPage.addSubview(phone)
        soundPage.addSubview(phoneNavigationBar.backBar)
        soundPage.addSubview(phoneNavigationBar.backButton)
        
        self.view = soundPage
    }
    
    @IBAction func touchedBack(){
        navigationController?.popViewController(animated: true)?.addChild(tvView)
    }
}

class TvViewController : UIViewController {
    let fullScreenButton = UIButton()
    
    override func loadView() {
        let tvPage = UIView()
        tvPage.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        tvPage.backgroundColor = .white
        
        //images
        //backgrounds
        let image1 = UIImage(named: "TV")!
        let tvCloser = UIImageView(image: image1)
        tvCloser.frame = CGRect(x: 419, y: 0, width: 1050, height: 900)
        
        let image2 = UIImage(named: "Chat Phone")!
        let phone = UIImageView(image: image2)
        
        //buttons
        let image5 = UIImage(named: "Full Screen")
        fullScreenButton.frame = CGRect(x: 1370, y: 612, width: 73, height: 61)
        fullScreenButton.setImage(image5, for: .normal)
        
        //putting the navigation bar on the phone
        let phoneNavigationBar = NavigationBar(X: 16, Y: 73, Width: 206, Height: 22)
        phoneNavigationBar.backButton.addTarget(nil, action: #selector(touchedBack), for: .touchUpInside)
        
        //Adding elements on subview
        tvPage.addSubview(tvCloser)
        tvPage.addSubview(phone)
        tvPage.addSubview(phoneNavigationBar.backBar)
        tvPage.addSubview(phoneNavigationBar.backButton)
        tvPage.addSubview(fullScreenButton)
        self.view = tvPage
    }
    
    @IBAction func touchedBack(){
        navigationController?.popViewController(animated: true)
    }
}

let writeHere = UITextField()
class DiaryViewController : UIViewController {
    override func loadView() {
        let diaryPage = UIView()
        diaryPage.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        diaryPage.backgroundColor = .white
        
        //images
        //backgrounds
        let image1 = UIImage(named: "Diary")!
        let diaryCloser = UIImageView(image: image1)
        diaryCloser.frame = CGRect(x: 419, y: 0, width: 1050, height: 900)
        
        let image2 = UIImage(named: "Diary Page")!
        let page = UIImageView(image: image2)
        
        //labels
        let diaryFont = UIFont(name: "Bradley Hand", size: 28)
        
        let title = UILabel()
        title.frame = CGRect(x: 36, y: 80, width: 341, height: 70)
        title.lineBreakMode = .byWordWrapping
        title.numberOfLines = 0
        title.font = diaryFont
        title.textColor = #colorLiteral(red: 0.05882352941, green: 0.1176470588, blue: 0.2117647059, alpha: 1)
        title.text = "ESCREVE AQUI TUDO \n QUE TE AFLIGE!!!"
        title.textAlignment = .center
        
        //text field
        let writeHere = UITextField()
        let image7 = UIImage(named: "Write Here Background")!
        writeHere.adjustsFontSizeToFitWidth = true
        writeHere.frame = CGRect(x: 30, y: 207, width: 351, height: 471)
        writeHere.background = image7
        writeHere.placeholder = "Escreva aqui..."
        writeHere.textAlignment = .justified
        writeHere.insertText("gfowiehf;nwd \n kwqbiewbfpwiebv")
        
        
        
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
        diaryPage.addSubview(diaryCloser)
        diaryPage.addSubview(page)
        diaryPage.addSubview(phoneNavigationBar.backBar)
        diaryPage.addSubview(phoneNavigationBar.backButton)
        diaryPage.addSubview(saveButton)
        diaryPage.addSubview(discardButton)
        diaryPage.addSubview(writeHere)
        diaryPage.addSubview(title)
        self.view = diaryPage
    }
    
    @IBAction func touchedSave(){
        
        let date = Date()
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day], from: date)
        let day = dateComponents.day!
        let month = dateComponents.month!
        let year = dateComponents.year!
        let todayDate = "\(day)-\(month)-\(year)"
        let fileUrl = playgroundSharedDataDirectory.appendingPathComponent("\(todayDate).txt")
        let textToWrite = "\(writeHere)\n\n"
        
        do {
            try textToWrite.write(to: fileUrl, atomically: true, encoding: .utf8)
        } catch {
            print("Error saving file: \(error)")
        }
        
        let _ = try? String(contentsOf: fileUrl)
        
        /*do {
         // get the documents folder url
         if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
         // create the destination url for the text file to be saved
         let fileURL = documentDirectory.appendingPathComponent("file.txt")
         // define the string/text to be saved
         let text = "Hello World !!!"
         // writing to disk
         // Note: if you set atomically to true it will overwrite the file if it exists without a warning
         //try text.write(to: fileURL, atomically: false, encoding: .utf8)
         print("saving was successful")
         print(fileURL)
         // any posterior code goes here
         // reading from disk
         let savedText = try String(contentsOf: fileURL)
         print("savedText:", savedText)   // "Hello World !!!\n"
         }
         } catch {
         print("error:", error)
         }*/
    }
    
    @IBAction func touchedDiscard(){
        navigationController?.reloadInputViews()
    }
    
    @IBAction func touchedBack(){
        navigationController?.popViewController(animated: true)
    }
}

class IpadViewController : UIViewController {
    let recordButton = UIButton()
    let stopButton = UIButton()
    override func loadView() {
        let ipadPage = UIView()
        ipadPage.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        ipadPage.backgroundColor = .white
        
        //images
        //backgrounds
        let image1 = UIImage(named: "Ipad")!
        let ipadCloser = UIImageView(image: image1)
        ipadCloser.frame = CGRect(x: 419, y: 0, width: 1050, height: 900)
        
        let image2 = UIImage(named: "Chat Phone")!
        let phone = UIImageView(image: image2)
        
        //buttons
        let image5 = UIImage(named: "Gravar Button")
        recordButton.frame = CGRect(x: 105, y: 373, width: 215, height: 215)
        recordButton.setImage(image5, for: .normal)
        
        let image6 = UIImage(named: "Parar Button")
        stopButton.frame = CGRect(x: 105, y: 373, width: 215, height: 215)
        stopButton.setImage(image6, for: .normal)
        stopButton.isHidden = true
        
        //putting the navigation bar on the phone
        let phoneNavigationBar = NavigationBar(X: 16, Y: 73, Width: 206, Height: 22)
        phoneNavigationBar.backButton.addTarget(nil, action: #selector(touchedBack), for: .touchUpInside)
        
        //Adding elements on subview
        ipadPage.addSubview(ipadCloser)
        ipadPage.addSubview(phone)
        ipadPage.addSubview(phoneNavigationBar.backBar)
        ipadPage.addSubview(phoneNavigationBar.backButton)
        ipadPage.addSubview(recordButton)
        ipadPage.addSubview(stopButton)
        self.view = ipadPage
    }
    
    @IBAction func touchedBack(){
        navigationController?.popViewController(animated: true)
    }
}

let mainView = MainViewController(screenType: .mac, isPortrait: true)
let soundView = SoundViewController(screenType: .mac, isPortrait: true)
let tvView = TvViewController(screenType: .mac, isPortrait: true)
let diaryView = DiaryViewController(screenType: .mac, isPortrait: true)
let ipadView = IpadViewController(screenType: .mac, isPortrait: true)

let navigation = UINavigationController(screenType: .mac, isPortrait: true)
navigation.navigationBar.isHidden = true
navigation.pushViewController(mainView, animated: true)
PlaygroundPage.current.liveView = navigation.scale(to: 0.4)


