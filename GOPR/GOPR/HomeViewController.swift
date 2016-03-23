//
//  HomeViewController.swift
//  GOPR
//
//  Created by Steven Thompson on 2015-12-06.
//  Copyright © 2015 stevethomp. All rights reserved.
//

import UIKit
import GameplayKit
//TODO: idleTimerDisabled
//TODO: switch between GC & UI

class HomeViewController: UIViewController {
    var letterAnimationIndex: Int = 0
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var butonStack: UIStackView!
    
    let stateMachine = GKStateMachine(states: [PlayingState(), PausedState(), PlayingState(), NuclearState()])
    
    let intro = "Greetings Doctor Cocoa. \nWelcome to GOPR. \nWould you like to play a game?"
    let repeatText = "Would you like to play a game?"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        animate(intro, textView: textView)
    }
    @IBAction func gTNWButtonAction(sender: AnyObject) {
        animate("\n\nGLOBAL THERMONUCLEAR WAR", textView: textView)
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(5 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) { () -> Void in
            self.allowTextInput(false)
            self.animate("\n\nGame in progress. 6 days 12 hours 37 minutes remaining.\n\nWould you like to play a game?", textView: self.textView)
        }
    }
    
    func configureView() {
        let blur = UIBlurEffect(style: .Light)
        let blurView = UIVisualEffectView(effect: blur)
        blurView.frame = textView.bounds
        textView.addSubview(blurView)
    }

    func animate(text: String, textView: UITextView) {
        allowTextInput(false)

        if letterAnimationIndex >= text.characters.count {
            letterAnimationIndex = 0
            allowTextInput(true)
            butonStack.alpha = 1.0
            setNeedsFocusUpdate()
            return
        }
        
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            let letter = text.characters[text.startIndex.advancedBy(self.letterAnimationIndex)]
            
            self.animate(letter)
            }, completion: { (complete) -> Void in
                if complete {
                    self.letterAnimationIndex += 1
                    self.animate(text, textView: textView)
                }
        })
    }
    
    func animate(letter: Character) {
        if let text: String = textView.text {
            textView.text = text + "\(letter)"
        }
        self.view.setNeedsDisplay()
    }
    
    func allowTextInput(allowed: Bool) {
        butonStack.userInteractionEnabled = allowed
        if allowed {
            butonStack.becomeFirstResponder()
        }
    }
    
    override func didUpdateFocusInContext(context: UIFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator) {
        if ((context.nextFocusedView?.isKindOfClass(UIButton.self)) != nil) {
            coordinator.addCoordinatedAnimations({ () -> Void in
//                context.nextFocusedView?.backgroundColor = UIColor.lightGrayColor()
                }, completion: nil)
        }
        coordinator.addCoordinatedAnimations({ () -> Void in
            context.previouslyFocusedView?.backgroundColor = UIColor.blackColor()
            }, completion: nil)
    }
}