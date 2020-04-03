import Foundation
import UIKit
import PlaygroundSupport

public class NavigationBar {
    public let backButton = UIButton()
    private let image3 = UIImage(named: "Back Arrow")!
    
    public let backBar = UIImageView(image: UIImage(named: "Sound Back Bar")!)
    
    public init(X: Int, Y: Int, Width: Int, Height: Int){
        self.backButton.frame = CGRect(x: X, y: Y, width: Width, height: Height)
        self.backButton.setImage(image3, for: .normal)
        self.backButton.setTitle("Voltar para a tela inicial", for: .normal)
        self.backButton.setTitleColor(#colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1), for: .normal)
        self.backButton.titleLabel?.textAlignment = .center
        
        self.backBar.frame = CGRect(x: 5, y: 53, width: 412, height: 66)
    }
}

