import Foundation
import PlaygroundSupport
import WebKit

public class ExitViewController : UIViewController {
    public override func loadView() {
        let exitPage = UIView()
        exitPage.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        exitPage.backgroundColor = .white
        
        let background = UIImageView(image: UIImage(named: "Final Screen"))
        
        exitPage.addSubview(background)
        self.view = exitPage
    }
}
