import Foundation
import UIKit
import PlaygroundSupport

public class playlistVideo {
    public var button = UIButton()
    
    public init (videoNumber: String, X: Int, Y: Int, function: Selector) {
        
        self.button.setTitle("Vídeo \(videoNumber)", for: .normal)
        self.button.setTitle("Vídeo \(videoNumber)", for: .selected)
        self.button.setBackgroundImage(UIImage(named: "Music Selected"), for: .selected)
        
        self.button.titleLabel!.textAlignment = .left
        
        self.button.frame = CGRect(x: X, y: Y, width: 150, height: 100)
        self.button.layer.borderColor = #colorLiteral(red: 0.1176470588, green: 0.1176470588, blue: 0.1176470588, alpha: 1)
        self.button.layer.borderWidth = 3
        
        self.button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        self.button.setTitleColor(#colorLiteral(red: 0.2431372549, green: 0.1647058824, blue: 0.8196078431, alpha: 1), for: .selected)
        
        self.button.addTarget(nil, action: function, for: .touchUpInside)
        
        self.button.isSelected = false
    }
}
