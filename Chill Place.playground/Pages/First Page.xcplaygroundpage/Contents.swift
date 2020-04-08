//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

//let backButton = UIButton()
let saveButton = UIButton()
let discardButton = UIButton()

var buttonList: [UIButton] = []
var feelingsSelected: [String] = []

class MainViewController : UIViewController {
    //botões do cenário
    let tvButton = UIButton()
    let soundButton = UIButton()
    let diaryButton = UIButton()
    let ipadButton = UIButton()
    
    //ELEMENTOS DO CHAT
    let scrollPhone = UIScrollView()
    
    //User Name
    let userTextField = UITextField()
    let userNameMessage = UILabel()
    var userName = ""
    
    //User interactions
    let sendButton = UIButton()
    let gotItButton = userButton(text:"Entendi!").button
    let finishedButton = userButton(text:"Terminei!").button
    let exitButton = userButton(text:"Sair!").button
    
    //User Balloons Messages
    let firstUserMessage = UILabel()
    let secondUserMessage = UILabel()
    
    //System Ballons Messages
    let firstSystemMessage = chatBalloon(text: "Olá, qual o seu nome?").label
    let secondSystemMessage = chatBalloon(text: "").label
    let thirdSystemMessage = chatBalloon(text: "Clique nas opções abaixo e quando terminar, digite: 'Terminei!'").label
    let fourthSystemMessage = chatBalloon(text: "").label
    let fifthSystemMessage = chatBalloon(text: "Quando estiver se sentindo melhor e desejar sair, digite 'Sair!'").label
    
    let buttonsBackground = UILabel()
    let anxietyButton = fellingsButton(text: "Ansiedade", X: 29, Y: 334, function: #selector(touchedFeeling)).button
    let fearButton = fellingsButton(text: "Medo", X: 159, Y: 334, function: #selector(touchedFeeling)).button
    let insomniaButton = fellingsButton(text: "Insônia", X: 29, Y: 374, function: #selector(touchedFeeling)).button
    let tensionButton = fellingsButton(text: "Tensão", X: 159, Y: 374, function: #selector(touchedFeeling)).button
    let sadnessButton = fellingsButton(text: "Tristeza", X: 29, Y: 414, function: #selector(touchedFeeling)).button
    let guiltyButton = fellingsButton(text: "Culpa", X: 159, Y: 414, function: #selector(touchedFeeling)).button
    let fatigueButton = fellingsButton(text: "Fadiga", X: 29, Y: 454, function: #selector(touchedFeeling)).button
    let noEnergyButton = fellingsButton(text: "Sem Energia", X: 159, Y: 454, function: #selector(touchedFeeling)).button
    let worryButton = fellingsButton(text: "Preocupação", X: 29, Y: 494, function: #selector(touchedFeeling)).button
    let uselessnessButton = fellingsButton(text: "Inutilidade", X: 159, Y: 494, function: #selector(touchedFeeling)).button
    
    let negativeThoughts = fellingsButton(text: "Pensamentos Negativos", X: 29, Y: 534, function: #selector(touchedFeeling)).button
    
    let infoOne = chatBalloon(text: "").label
    let infoTwo = chatBalloon(text: "Temos alguns objetos na nossa salinha que podem te ajudar: ").label
    let infoThree = chatBalloon(text: "1 - Som : escute sons escolhidos especialmente para você!").label
    let infoFour = chatBalloon(text: "2 - TV : veja vídeos com imagens maravilhosas!!!").label
    let infoFive = chatBalloon(text: "3 - Diário: escreva o teu desabafo!!").label
    let infoSix = chatBalloon(text: "4 - Tablet/Ipad : grava o teu desabafo!!").label
    
    override func loadView() {
        let firstPage = UIView()
        firstPage.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        firstPage.backgroundColor = .white
        
        //IMAGES
        let image1 = UIImage(named: "Visão Geral")!
        let safePlace = UIImageView(image: image1)
        safePlace.frame = CGRect(x: 419, y: 0, width: 1050, height: 900)
        
        let image2 = UIImage(named: "Chat Phone")!
        let phone = UIImageView(image: image2)
        
        let image4 = UIImage(named: "Text Box")!
        let textBox = UIImageView(image: image4)
        textBox.frame = CGRect(x: 16, y: 790, width: 400, height: 76)
        
        scrollPhone.frame = CGRect(x: 16, y: 73, width: 400, height: 700)
        scrollPhone.contentSize = CGSize(width: 390, height: 865)
        scrollPhone.isScrollEnabled = true
        scrollPhone.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9568627451, blue: 0.9725490196, alpha: 1)
        scrollPhone.isDirectionalLockEnabled = true
        scrollPhone.showsVerticalScrollIndicator = true
        scrollPhone.showsHorizontalScrollIndicator = false
        scrollPhone.alwaysBounceVertical = true
        scrollPhone.alwaysBounceHorizontal = true
        
        let image5 = UIImage(named: "Send Icon")!
        sendButton.frame = CGRect(x: 310, y: 780, width: 100, height: 100)
        sendButton.setImage(image5, for: .normal)
        sendButton.addTarget(nil, action: #selector(touchedSend), for: .touchUpInside)
        
        
        //BUTTONS
        let image3 = UIImage(named: "Button")!
        tvButton.frame = CGRect(x: 965, y: 344, width: 50, height: 50)
        tvButton.setImage(image3, for: .normal)
        tvButton.addTarget(nil, action: #selector(touchedTv), for: .touchUpInside)
        tvButton.isEnabled = false
        
        soundButton.frame = CGRect(x: 857, y: 385, width: 50, height: 50)
        soundButton.setImage(image3, for: .normal)
        soundButton.addTarget(nil, action: #selector(touchedSound), for: .touchUpInside)
        soundButton.isEnabled = false
        
        diaryButton.frame = CGRect(x: 906, y: 604, width: 30, height: 30)
        diaryButton.setImage(image3, for: .normal)
        diaryButton.addTarget(nil, action: #selector(touchedDiary), for: .touchUpInside)
        diaryButton.isEnabled = false
        
        ipadButton.frame = CGRect(x: 990, y: 592, width: 30, height: 30)
        ipadButton.setImage(image3, for: .normal)
        ipadButton.addTarget(nil, action: #selector(touchedIpad), for: .touchUpInside)
        ipadButton.isEnabled = false
        
        
        //CHAT
        let image6 = UIImage(named: "Back Bar")!
        let bar = UIImageView(image: image6)
        bar.frame = CGRect(x: 5, y: 53, width: 412, height: 66)
        
        let image7 = UIImage(named: "Title Place")!
        let title = UIImageView(image: image7)
        title.frame = CGRect(x: 5, y: 53, width: 412, height: 66)
        
        firstSystemMessage.frame = CGRect(x: 19, y: 60, width: 170, height: 50)
        
        let chatFont = UIFont(name: "Avenir Denso", size: 28)
        userTextField.placeholder = "Josisvalde"
        userTextField.frame = CGRect(x: 137, y: 815, width: 180, height: 30)
        userTextField.layer.borderColor = #colorLiteral(red: 0.5960784314, green: 0.5960784314, blue: 0.6156862745, alpha: 1)
        userTextField.layer.borderWidth = 3
        userTextField.backgroundColor = .white
        userTextField.textAlignment = .center
        
        userNameMessage.font = chatFont
        userNameMessage.text = "Olá, eu sou: "
        userNameMessage.frame = CGRect(x: 10, y: 817, width: 147, height: 22)
        userNameMessage.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        userNameMessage.textAlignment = .center
        
        firstUserMessage.frame = CGRect(x: 209, y: 120, width: 170, height: 50)
        firstUserMessage.backgroundColor = #colorLiteral(red: 0.0245267451, green: 0, blue: 0.6720931155, alpha: 1)
        firstUserMessage.textColor = .white
        firstUserMessage.textAlignment = .center
        firstUserMessage.layer.cornerRadius = 50
        firstUserMessage.lineBreakMode = .byWordWrapping
        firstUserMessage.numberOfLines = 0
        firstUserMessage.isHidden = true
        
        infoOne.frame = CGRect(x: 19, y: 180, width: 170, height: 150)
        infoOne.isHidden = true
        
        infoTwo.frame = CGRect(x: 19, y: 340, width: 170, height: 115)
        infoTwo.isHidden = true
        
        infoThree.frame = CGRect(x: 19, y: 465, width: 170, height: 115)
        infoThree.isHidden = true
        
        infoFour.frame = CGRect(x: 19, y: 590, width: 170, height: 84)
        infoFour.isHidden = true
        
        infoFive.frame = CGRect(x: 19, y: 684, width: 170, height: 84)
        infoFive.isHidden = true
        
        infoSix.frame = CGRect(x: 19, y: 778, width: 170, height: 84)
        infoSix.isHidden = true
        
        gotItButton.addTarget(nil, action: #selector(touchedGotIt), for: .touchUpInside)
        gotItButton.isHidden = true
        
        secondUserMessage.frame = CGRect(x: 209, y: 60, width: 170, height: 50)
        secondUserMessage.text = "Entendi!"
        secondUserMessage.backgroundColor = #colorLiteral(red: 0.0245267451, green: 0, blue: 0.6720931155, alpha: 1)
        secondUserMessage.textColor = .white
        secondUserMessage.textAlignment = .center
        secondUserMessage.layer.cornerRadius = 50
        secondUserMessage.lineBreakMode = .byWordWrapping
        secondUserMessage.numberOfLines = 0
        secondUserMessage.isHidden = true
        
        secondSystemMessage.frame = CGRect(x: 19, y: 120, width: 170, height: 84)
        secondSystemMessage.isHidden = true
        
        thirdSystemMessage.frame = CGRect(x: 19, y: 214, width: 170, height: 100)
        thirdSystemMessage.isHidden = true
        
        buttonsBackground.backgroundColor = #colorLiteral(red: 0.9230250634, green: 0.9230250634, blue: 0.9230250634, alpha: 1)
        buttonsBackground.frame = CGRect(x: 19, y: 324, width: 300, height: 330)
        buttonsBackground.isHidden = true
        
        negativeThoughts.frame.size = CGSize(width: 120, height: 60)
            
        anxietyButton.isHidden = true
        fearButton.isHidden = true
        insomniaButton.isHidden = true
        tensionButton.isHidden = true
        sadnessButton.isHidden = true
        guiltyButton.isHidden = true
        negativeThoughts.isHidden = true
        uselessnessButton.isHidden = true
        fatigueButton.isHidden = true
        noEnergyButton.isHidden = true
        worryButton.isHidden = true
        
        finishedButton.addTarget(nil, action: #selector(touchedFinished), for: .touchUpInside)
        finishedButton.isHidden = true
        
        fourthSystemMessage.frame = CGRect(x: 19, y: 60, width: 170, height: 100)
        fourthSystemMessage.isHidden = true
        
        fifthSystemMessage.frame = CGRect(x: 19, y: 170, width: 170, height: 100)
        fifthSystemMessage.isHidden = true
        
        exitButton.addTarget(nil, action: #selector(touchedExit), for: .touchUpInside)
        exitButton.isHidden = true
        
        //Adding elements on subview
        firstPage.addSubview(phone)
        firstPage.addSubview(safePlace)
        firstPage.addSubview(tvButton)
        firstPage.addSubview(soundButton)
        firstPage.addSubview(diaryButton)
        firstPage.addSubview(ipadButton)
        firstPage.addSubview(scrollPhone)
        firstPage.addSubview(bar)
        firstPage.addSubview(title)
        
        scrollPhone.addSubview(firstSystemMessage)
        scrollPhone.addSubview(firstUserMessage)
        scrollPhone.addSubview(infoOne)
        scrollPhone.addSubview(infoTwo)
        scrollPhone.addSubview(infoThree)
        scrollPhone.addSubview(infoFour)
        scrollPhone.addSubview(infoFive)
        scrollPhone.addSubview(infoSix)
        scrollPhone.addSubview(secondUserMessage)
        scrollPhone.addSubview(secondSystemMessage)
        scrollPhone.addSubview(thirdSystemMessage)
        scrollPhone.addSubview(fourthSystemMessage)
        scrollPhone.addSubview(fifthSystemMessage)
        scrollPhone.addSubview(buttonsBackground)
        scrollPhone.addSubview(fearButton)
        scrollPhone.addSubview(worryButton)
        scrollPhone.addSubview(guiltyButton)
        scrollPhone.addSubview(sadnessButton)
        scrollPhone.addSubview(tensionButton)
        scrollPhone.addSubview(fatigueButton)
        scrollPhone.addSubview(anxietyButton)
        scrollPhone.addSubview(insomniaButton)
        scrollPhone.addSubview(uselessnessButton)
        scrollPhone.addSubview(noEnergyButton)
        scrollPhone.addSubview(negativeThoughts)
        
        firstPage.addSubview(textBox)
        firstPage.addSubview(userNameMessage)
        firstPage.addSubview(userTextField)
        firstPage.addSubview(sendButton)
        firstPage.addSubview(gotItButton)
        firstPage.addSubview(finishedButton)
        firstPage.addSubview(exitButton)
        
        self.view = firstPage
    }
        
    @IBAction func touchedSend(){
        
        if userTextField.text != ""{
            userName = userTextField.text!
            firstUserMessage.text = "Olá, eu sou \(userTextField.text!)!!"
        } else {
            userName = "Queridx Usuárix"
            firstUserMessage.text = "Olá, prefiro não informar o meu nome!"
        }
        
        infoOne.text = "Olá, \(userName)!! Bem-vindx ao nosso cantinho, a nossa ideia é que esse seja um lugar seguro para você!"
        secondSystemMessage.text = "\(userName), como você está se sentindo hoje?"
        fourthSystemMessage.text = "Prontinho, \(userName)! Sinta-se à vontade na sua salinha!!"
        
        firstUserMessage.isHidden = false
        infoOne.isHidden = false
        infoTwo.isHidden = false
        infoThree.isHidden = false
        infoFour.isHidden = false
        infoFive.isHidden = false
        infoSix.isHidden = false
        gotItButton.isHidden = false
        
        userTextField.isHidden = true
        userNameMessage.isHidden = true
        
        sendButton.isEnabled = false
    }
    
    @IBAction func touchedGotIt(){
        secondUserMessage.isHidden = false
        secondSystemMessage.isHidden = false
        secondSystemMessage.isHidden = false
        buttonsBackground.isHidden = false
        anxietyButton.isHidden = false
        fearButton.isHidden = false
        insomniaButton.isHidden = false
        tensionButton.isHidden = false
        sadnessButton.isHidden = false
        guiltyButton.isHidden = false
        negativeThoughts.isHidden = false
        uselessnessButton.isHidden = false
        fatigueButton.isHidden = false
        noEnergyButton.isHidden = false
        worryButton.isHidden = false
        thirdSystemMessage.isHidden = false
        finishedButton.isHidden = false
        
        firstUserMessage.isHidden = true
        gotItButton.isHidden = true
        firstSystemMessage.isHidden = true
        infoOne.isHidden = true
        infoTwo.isHidden = true
        infoThree.isHidden = true
        infoFour.isHidden = true
        infoFive.isHidden = true
        infoSix.isHidden = true
        scrollPhone.contentSize = CGSize(width: 390, height: 700)
        scrollPhone.isScrollEnabled = false
    }
    
    @IBAction func touchedFeeling(sender: UIButton){
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func touchedFinished(){
        buttonList = [anxietyButton, fearButton, insomniaButton, tensionButton, sadnessButton, guiltyButton, negativeThoughts, uselessnessButton, fatigueButton, noEnergyButton, worryButton]
        
        for button in buttonList {
            if button.isSelected {
                feelingsSelected.append(button.currentTitle!)
            }
        }
        
        fourthSystemMessage.isHidden = false
        fifthSystemMessage.isHidden = false
        exitButton.isHidden = false
        
        tvButton.isEnabled = true
        soundButton.isEnabled = true
        ipadButton.isEnabled = true
        diaryButton.isEnabled = true
        
        secondUserMessage.isHidden = true
        secondSystemMessage.isHidden = true
        secondSystemMessage.isHidden = true
        buttonsBackground.isHidden = true
        anxietyButton.isHidden = true
        fearButton.isHidden = true
        insomniaButton.isHidden = true
        tensionButton.isHidden = true
        sadnessButton.isHidden = true
        guiltyButton.isHidden = true
        negativeThoughts.isHidden = true
        uselessnessButton.isHidden = true
        fatigueButton.isHidden = true
        noEnergyButton.isHidden = true
        worryButton.isHidden = true
        thirdSystemMessage.isHidden = true
    }
    
    @IBAction func touchedExit(){
        navigationController?.pushViewController(exitView, animated: true)
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
        navigationController?.popViewController(animated: true)
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




class DiaryViewController : UIViewController {
    let writeHere = UITextView()
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
        //let writeHere = UITextField()
        let image7 = UIImage(named: "Write Here Background")!
        writeHere.frame = CGRect(x: 30, y: 207, width: 351, height: 471)
        writeHere.largeContentImage = image7
        writeHere.textAlignment = .justified
        writeHere.font = writingFont
        writeHere.showsVerticalScrollIndicator = true
        writeHere.isScrollEnabled = true
        writeHere.backgroundColor = #colorLiteral(red: 0.8901960784, green: 0.8549019608, blue: 0.8039215686, alpha: 1)
        writeHere.layer.cornerRadius = 10
        writeHere.isEditable = true
        writeHere.endFloatingCursor()
        
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
        /*let fileUrl = playgroundSharedDataDirectory.appendingPathComponent("\(todayDate).txt")
         let textToWrite = "\(writeHere)\n\n"
         
         do {
         try textToWrite.write(to: fileUrl, atomically: true, encoding: .utf8)
         } catch {
         print("Error saving file: \(error)")
         }
         
         let _ = try? String(contentsOf: fileUrl)*/
        
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
                print(fileUrl)
            }
        }
    }
    
    @IBAction func touchedDiscard(){
        writeHere.text = ""
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

class ExitViewController : UIViewController {
    override func loadView() {
        let exitPage = UIView()
        exitPage.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        exitPage.backgroundColor = .white
        
        let background = UIImageView(image: UIImage(named: "Final Screen"))
        
        exitPage.addSubview(background)
        self.view = exitPage
    }
}

let mainView = MainViewController(screenType: .mac, isPortrait: true)
let soundView = SoundViewController(screenType: .mac, isPortrait: true)
let tvView = TvViewController(screenType: .mac, isPortrait: true)
let diaryView = DiaryViewController(screenType: .mac, isPortrait: true)
let ipadView = IpadViewController(screenType: .mac, isPortrait: true)
let exitView = ExitViewController(screenType: .mac, isPortrait: true)

let navigation = UINavigationController(screenType: .mac, isPortrait: true)
navigation.navigationBar.isHidden = true
navigation.pushViewController(mainView, animated: true)
PlaygroundPage.current.liveView = navigation.scale(to: 0.4)


