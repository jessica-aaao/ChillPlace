import Foundation
import UIKit
import PlaygroundSupport

public class chatBalloon {
    public let label = UILabel()
    public init (text: String){
        self.label.text = text
        self.label.frame = CGRect(x: 19, y: 60, width: 195, height: 50)
        self.label.backgroundColor = #colorLiteral(red: 0.9230250634, green: 0.9230250634, blue: 0.9230250634, alpha: 1)
        self.label.textColor = .black
        self.label.textAlignment = .center
        self.label.layer.cornerRadius = 20
        self.label.lineBreakMode = .byWordWrapping
        self.label.numberOfLines = 0
    }
}
