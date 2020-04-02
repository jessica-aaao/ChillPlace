//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

let backButton = UIButton()
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
        navigationController?.popViewController(animated: true)
        navigationController?.pushViewController(soundView, animated: true)
    }
    
    @IBAction func touchedTv(){
        navigationController?.popViewController(animated: true)
        navigationController?.pushViewController(tvView, animated: true)
    }
    
    @IBAction func touchedDiary(){
        navigationController?.popViewController(animated: true)
        navigationController?.pushViewController(diaryView, animated: true)
    }
    
    @IBAction func touchedIpad(){
        navigationController?.popViewController(animated: true)
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
        
        //button
        let image3 = UIImage(named: "Back Arrow")!
        backButton.frame = CGRect(x: 16, y: 73, width: 206, height: 22)
        backButton.setImage(image3, for: .normal)
        backButton.setTitle("Voltar para a tela inicial", for: .normal)
        backButton.setTitleColor(#colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1), for: .normal)
        backButton.titleLabel?.textAlignment = .center
        backButton.addTarget(nil, action: #selector(touchedBack), for: .touchUpInside)
        
        let image4 = UIImage(named: "Sound Back Bar")!
        let backBar = UIImageView(image: image4)
        backBar.frame = CGRect(x: 5, y: 53, width: 412, height: 66)
        
        //Adding elements on subview
        soundPage.addSubview(soundCloser)
        soundPage.addSubview(phone)
        soundPage.addSubview(backBar)
        soundPage.addSubview(backButton)
        self.view = soundPage
    }
    
    @IBAction func touchedBack(){
        navigationController?.popViewController(animated: true)
        navigationController?.pushViewController(mainView, animated: true)
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
        let image3 = UIImage(named: "Back Arrow")!
        backButton.frame = CGRect(x: 16, y: 73, width: 206, height: 22)
        backButton.setImage(image3, for: .normal)
        backButton.setTitle("Voltar para a tela inicial", for: .normal)
        backButton.setTitleColor(#colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1), for: .normal)
        backButton.titleLabel?.textAlignment = .center
        
        let image4 = UIImage(named: "Back Bar")!
        let backBar = UIImageView(image: image4)
        backBar.frame = CGRect(x: 5, y: 53, width: 412, height: 66)
        
        let image5 = UIImage(named: "Full Screen")
        fullScreenButton.frame = CGRect(x: 1279, y: 612, width: 73, height: 61)
        fullScreenButton.setImage(image5, for: .normal)
        
        //Adding elements on subview
        tvPage.addSubview(tvCloser)
        tvPage.addSubview(phone)
        tvPage.addSubview(backBar)
        tvPage.addSubview(backButton)
        tvPage.addSubview(fullScreenButton)
        self.view = tvPage
        
        
    }
}

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
        
        let image7 = UIImage(named: "Write Here Background")!
        let writeBackground = UIImageView(image: image7)
        writeBackground.frame = CGRect(x: 40, y: 157, width: 351, height: 471)
        
        //buttons
        let image3 = UIImage(named: "Back Arrow")!
        backButton.frame = CGRect(x: 16, y: 20, width: 206, height: 22)
        backButton.setImage(image3, for: .normal)
        backButton.setTitle("Voltar para a tela inicial", for: .normal)
        backButton.setTitleColor(#colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1), for: .normal)
        backButton.titleLabel?.textAlignment = .center
        
        let image4 = UIImage(named: "Diary Back Bar")!
        let backBar = UIImageView(image: image4)
        backBar.frame = CGRect(x: 0, y: 0, width: 420, height: 66)
        
        let image5 = UIImage(named: "Salvar Button")!
        saveButton.frame = CGRect(x: 40, y: 768, width: 355, height: 56)
        saveButton.setImage(image5, for: .normal)
        
        let image6 = UIImage(named: "Descartar Button")
        discardButton.frame = CGRect(x: 40, y: 751, width: 355, height: 56)
        discardButton.setImage(image6, for: .normal)
        
        //Adding elements on subview
        diaryPage.addSubview(diaryCloser)
        diaryPage.addSubview(page)
        diaryPage.addSubview(backBar)
        diaryPage.addSubview(backButton)
        diaryPage.addSubview(saveButton)
        diaryPage.addSubview(discardButton)
        diaryPage.addSubview(writeBackground)
        self.view = diaryPage
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
        let image3 = UIImage(named: "Back Arrow")!
        backButton.frame = CGRect(x: 16, y: 73, width: 206, height: 22)
        backButton.setImage(image3, for: .normal)
        backButton.setTitle("Voltar para a tela inicial", for: .normal)
        backButton.setTitleColor(#colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1), for: .normal)
        backButton.titleLabel?.textAlignment = .center
        
        let image4 = UIImage(named: "Back Bar")!
        let backBar = UIImageView(image: image4)
        backBar.frame = CGRect(x: 5, y: 53, width: 412, height: 66)
        
        let image5 = UIImage(named: "Gravar Button")
        recordButton.frame = CGRect(x: 100, y: 413, width: 215, height: 215)
        recordButton.setImage(image5, for: .normal)
        
        let image6 = UIImage(named: "Parar Button")
        stopButton.frame = CGRect(x: 100, y: 413, width: 215, height: 215)
        stopButton.setImage(image6, for: .normal)
        stopButton.isHidden = true
        
        //Adding elements on subview
        ipadPage.addSubview(ipadCloser)
        ipadPage.addSubview(phone)
        ipadPage.addSubview(backBar)
        ipadPage.addSubview(backButton)
        ipadPage.addSubview(recordButton)
        ipadPage.addSubview(stopButton)
        self.view = ipadPage
    }
}




let mainView = MainViewController(screenType: .mac, isPortrait: true)
let soundView = SoundViewController(screenType: .mac, isPortrait: true)
let tvView = TvViewController(screenType: .mac, isPortrait: true)
let diaryView = DiaryViewController(screenType: .mac, isPortrait: true)
let ipadView = IpadViewController(screenType: .mac, isPortrait: true)

let navigation = UINavigationController(screenType: .mac, isPortrait: true)
navigation.navigationBar.isHidden = false
navigation.pushViewController(mainView, animated: true)
PlaygroundPage.current.liveView = navigation.scale(to: 0.4)


