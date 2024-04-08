//
//  KeyboardViewController.swift
//  keypad
//
//  Created by Paramitha on 27/03/24.
//

import SwiftUI
import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    var keyboardView: KeypadView!
    
        
//      // 2
//      let nib = UINib(nibName: "MorseKeyboardView", bundle: nil)
//      let objects = nib.instantiate(withOwner: nil, options: nil)
//      morseKeyboardView = objects.first as! MorseKeyboardView
//      guard let inputView = inputView else { return }
//      inputView.addSubview(morseKeyboardView)
//      
//      // 3
//      morseKeyboardView.translatesAutoresizingMaskIntoConstraints = false
//      NSLayoutConstraint.activate([
//        morseKeyboardView.leftAnchor.constraint(equalTo: inputView.leftAnchor),
//        morseKeyboardView.topAnchor.constraint(equalTo: inputView.topAnchor),
//        morseKeyboardView.rightAnchor.constraint(equalTo: inputView.rightAnchor),
//        morseKeyboardView.bottomAnchor.constraint(equalTo: inputView.bottomAnchor)
//        ])
    
    
    @State var test: String = ""
    @State var test2: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        func onKeyPress(key: String) {
            
                textDocumentProxy.insertText(key)
            
        }
        
        keyboardView = KeypadView(
            onKeyPress: onKeyPress,
            delete: {
                self.textDocumentProxy.deleteBackward()
            }
        )
        let hostingController = UIHostingController(rootView: keyboardView)
        
        guard let inputView,
              let swiftUiView = hostingController.view
        else { return }
        
        swiftUiView.translatesAutoresizingMaskIntoConstraints = false
        
        inputView.addSubview(swiftUiView)
        
        
        
        NSLayoutConstraint.activate([
            swiftUiView.topAnchor.constraint(equalTo: inputView.topAnchor),
            swiftUiView.bottomAnchor.constraint(equalTo: inputView.bottomAnchor),
            swiftUiView.leadingAnchor.constraint(equalTo: inputView.leadingAnchor),
            swiftUiView.trailingAnchor.constraint(equalTo: inputView.trailingAnchor)
                ])
        
        
        //      // 2
        //      let nib = UINib(nibName: "MorseKeyboardView", bundle: nil)
        //      let objects = nib.instantiate(withOwner: nil, options: nil)
        //      morseKeyboardView = objects.first as! MorseKeyboardView
        //      guard let inputView = inputView else { return }
        //      inputView.addSubview(morseKeyboardView)
        //
        //      // 3
        //      morseKeyboardView.translatesAutoresizingMaskIntoConstraints = false
        //      NSLayoutConstraint.activate([
        //        morseKeyboardView.leftAnchor.constraint(equalTo: inputView.leftAnchor),
        //        morseKeyboardView.topAnchor.constraint(equalTo: inputView.topAnchor),
        //        morseKeyboardView.rightAnchor.constraint(equalTo: inputView.rightAnchor),
        //        morseKeyboardView.bottomAnchor.constraint(equalTo: inputView.bottomAnchor)
        //        ])
        
        
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton(type: .system)
        
        self.nextKeyboardButton.setTitle("Testing keyboard", for: .normal) //(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    override func viewWillLayoutSubviews() {
        self.nextKeyboardButton.isHidden = !self.needsInputModeSwitchKey
        super.viewWillLayoutSubviews()
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        
        textColor = .blue
        
//        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
//            textColor = UIColor.white
//        } else {
//            textColor = UIColor.black
//        }
        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }

}
