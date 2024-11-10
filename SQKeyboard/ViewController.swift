//
//  ViewController.swift
//  SQKeyboard
//
//  Created by luxingkai on 2024/11/2.
//

import UIKit

class ViewController: UIViewController {
    
    var keyboardView: UIInputView?
    
//    override var hasFullAccess: Bool {
//        return true
//    }
//    
//    override var needsInputModeSwitchKey: Bool {
//        return true
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
                
//        let size = UIScreen.main.bounds.size
//        
//        keyboardView = UIInputView(frame:CGRect(x: 0, y: 0, width: size.width, height: 200), inputViewStyle: .keyboard)
//        keyboardView?.allowsSelfSizing = true
//        keyboardView?.backgroundColor = .red
//        self.inputView = keyboardView!
        
//        self.textDocumentProxy.insertText("Hello")
//        self.primaryLanguage = "en_US"
//        
//        let keyboardType = textDocumentProxy.keyboardType
//        switch keyboardType {
//        case .asciiCapable:
//            print("dfa")
//        case .emailAddress:
//            print("dfa")
//        case .numberPad:
//            print("dfa")
//        default:
//            print("dfa")
//        }
        
        self.view.backgroundColor = UIColor.white
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        let controller = RedViewController()
        controller.controller = self
        controller.showAlertViewController()
        
    }
    
}


