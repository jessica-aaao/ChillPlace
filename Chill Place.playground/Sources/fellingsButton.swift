import Foundation
import UIKit
import PlaygroundSupport

public class fellingsButton {
    public let button = UIButton()
    public init (text: String, X: Int, Y: Int, function: Selector){
        self.button.setTitle(text, for: .normal)
        self.button.setTitle(text, for: .selected)
        self.button.setBackgroundImage(UIImage(named: "Rectangle Button"), for: .normal)
        self.button.setBackgroundImage(UIImage(named: "Rectangle Button Pressed"), for: .selected)
        self.button.frame = CGRect(x: X, y: Y, width: 120, height: 30)
        self.button.layer.borderColor = #colorLiteral(red: 0.1176470588, green: 0.1176470588, blue: 0.1176470588, alpha: 1)
        self.button.layer.borderWidth = 3
        self.button.setTitleColor(#colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1), for: .normal)
        self.button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .selected)
        self.button.addTarget(nil, action: function, for: .touchUpInside)
        self.button.titleLabel!.lineBreakMode = .byWordWrapping
        self.button.titleLabel!.numberOfLines = 0
        self.button.titleLabel!.textAlignment = .center
        self.button.isSelected = false
    }
}
