import Foundation
import UIKit
import PlaygroundSupport

public class userButton {
    public let button = UIButton()
    public init (text: String){
        self.button.setTitle(text, for: .normal)
        self.button.setBackgroundImage(UIImage(named: "Rectangle Button"), for: .normal)
        self.button.frame = CGRect(x: 137, y: 815, width: 100, height: 30)
        self.button.layer.borderColor = #colorLiteral(red: 0.1176470588, green: 0.1176470588, blue: 0.1176470588, alpha: 1)
        self.button.layer.borderWidth = 3
        self.button.setTitleColor(#colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1), for: .normal)
    }
}
