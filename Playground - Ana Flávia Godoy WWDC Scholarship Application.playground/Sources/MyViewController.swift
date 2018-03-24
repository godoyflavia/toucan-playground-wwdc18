import UIKit
import PlaygroundSupport

public class MyViewController : UIViewController {
    
    var counter = 1
    
    var nextSceneButton = UIButton()
    var doSomethingButton = UIButton()
    
    var nextButtonImage = UIImage()
    var doSomethingButtonImage = UIImage()
    
    let sceneView = UIView()
    var bgImage = UIImageView()
    
    public override func loadView() {
        
        // Scene 1 - Bedroom
        sceneView.frame = CGRect(x: 0, y: 0, width: 600, height: 400)
        self.view = sceneView
        
        bgImage = UIImageView(frame: sceneView.frame)
        changeBackground(image: #imageLiteral(resourceName: "darkBedroom.png") , thisView: bgImage)
        self.view.insertSubview(bgImage, at: 0)
        
        // Setting "next" button
        nextButtonImage = #imageLiteral(resourceName: "next.png")
        nextSceneButton.frame = CGRect(x: 550, y: 350, width: 40, height: 20)
        nextSceneButton.setImage(nextButtonImage, for: .normal)
        nextSceneButton.addTarget(self, action: #selector(buttonNextScene), for: .touchUpInside)
        self.view.insertSubview(nextSceneButton, at: 1)
        
        // Setting "do something" button
        doSomethingButtonImage = #imageLiteral(resourceName: "doSmth.jpg")
        doSomethingButton.frame = CGRect(x: 300, y: 200, width: 80, height: 40)
        doSomethingButton.setImage(doSomethingButtonImage, for: .normal)
        doSomethingButton.addTarget(self, action: #selector(buttonNextScene), for: .touchUpInside)
        
    }
    
    func changeBackground(image: UIImage, thisView: UIImageView) {
        thisView.image = image
        thisView.contentMode = UIViewContentMode.scaleAspectFit
    }

    @objc func buttonNextScene(sender: UIButton!) {
        counter = counter + 1
        
        switch counter {
        case 2:
            // Scene 2 - Waking up in the bedroom
            changeBackground(image: #imageLiteral(resourceName: "bedroomLightEntering.png"), thisView: bgImage)
        case 3:
            // Scene 3 - Going out of the bedroom
            changeBackground(image: #imageLiteral(resourceName: "room.jpg"), thisView: bgImage)
            
            self.view.insertSubview(doSomethingButton, at: 1)
            nextSceneButton.isHidden = true
            nextSceneButton.isEnabled = false
        case 4:
            // Scene 4 - Getting closer to check
            changeBackground(image:#imageLiteral(resourceName: "gettingCloser.jpg") , thisView: bgImage)
            
            nextSceneButton.isHidden = false
            nextSceneButton.isEnabled = true
            
            doSomethingButton.isHidden = true
            doSomethingButton.isEnabled = false
    
        default:
            print("eita")
        }
    }
}
