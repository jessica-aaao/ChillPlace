import Foundation
import UIKit
import PlaygroundSupport

public class playlistSound {
    public var button = UIButton()
    
    public init (soundNumber: String, X: Int, Y: Int, function: Selector) {
        
        self.button.setTitle("Música \(soundNumber)", for: .normal)
        self.button.setTitle("Música \(soundNumber)", for: .selected)
        self.button.setBackgroundImage(UIImage(named: "Music Selected"), for: .selected)
        
        self.button.titleLabel!.textAlignment = .left
        
        self.button.frame = CGRect(x: X, y: Y, width: 150, height: 40)
        self.button.layer.borderColor = #colorLiteral(red: 0.1176470588, green: 0.1176470588, blue: 0.1176470588, alpha: 1)
        self.button.layer.borderWidth = 3
        
        self.button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        self.button.setTitleColor(#colorLiteral(red: 0.2431372549, green: 0.1647058824, blue: 0.8196078431, alpha: 1), for: .selected)
        
        self.button.addTarget(nil, action: function, for: .touchUpInside)
        
        self.button.isSelected = false
    }
}
