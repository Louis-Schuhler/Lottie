import UIKit
import Lottie

class ViewController: UIViewController {

    var red = false
    
    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func showAnimation(_ sender: Any) {
        button.isEnabled = false
        let screen = UIScreen.main.bounds
        let animationView = LOTAnimationView(name: "lottietest")
        
        if (red){
            animationView.setValue(UIColor.white, forKeypath: "shape.Rectangle 1.Fill 1.Color", atFrame: 0)
            red = false
        } else {
            animationView.setValue(UIColor (red: 255/255.0, green: 85/255.0, blue: 85/255.0, alpha: 1.0).cgColor, forKeypath: "shape.Rectangle 1.Fill 1.Color", atFrame: 0)
            red = true
        }
        
        animationView.frame = screen
        animationView.center = CGPoint(x: screen.width/2, y: screen.height/2)
        
        self.view.insertSubview(animationView, belowSubview: button)
        
        animationView.play{ (finished) in
            if (self.red){
                self.view.backgroundColor = (UIColor (red: 255/255.0, green: 85/255.0, blue: 85/255.0, alpha: 1.0))
            } else {
                self.view.backgroundColor = UIColor.white
            }
            animationView.removeFromSuperview()
            self.button.isEnabled = true
        }
    }
}
