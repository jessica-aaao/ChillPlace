//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
    
        let label = UILabel()
        label.frame = CGRect(x: 80, y: 200, width: 500, height: 20)
        label.text = "This is my first playground 🤷🏽‍♀️🤷🏽‍♀️"
        label.textColor = .black
        
        view.addSubview(label)
        self.view = view
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
