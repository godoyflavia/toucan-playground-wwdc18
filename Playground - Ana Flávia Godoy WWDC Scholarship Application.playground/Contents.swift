//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

let myBackground = MyViewController()
myBackground.preferredContentSize = CGSize(width: 600, height: 400)

PlaygroundPage.current.liveView = myBackground
