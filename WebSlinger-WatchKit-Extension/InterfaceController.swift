//
//  InterfaceController.swift
//  WebSlinger WatchKit Extension
//
//  Created by Aaron Reyes on 8/9/19.
//  Copyright © 2019 Aaron Reyes. All rights reserved.
//

import WatchKit
import AVFoundation

class InterfaceController: WKInterfaceController, SoundPlaying {
    var audioPlayer: AVAudioPlayer?
    var n = 1
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    var shaker:WatchShaker = WatchShaker(shakeSensibility: .shakeSensibilityHard, delay: 0.05)
    
//    override func setTitle(_ title: String?) {
//        let titleLabel = 
//    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        shaker.delegate = self
        shaker.start()
        
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        shaker.stop()
    }
    
    @IBAction func TobeyButtonTapped() {
        print("Tobey Button Tapped")
        
        let TobeyTune = ["TMGoWeb", "TMFly", "TMUpUpAndAwayWeb", "TMShazam", "TMGoGoGoWebGo"]
        
        print("Audio Playing: \(TobeyTune[n-1]).mp3")
        playSound(named: TobeyTune[n-1])
        
        n = n+1
        if n == 6 {
            n = 1
        }
        
    }
    
    @IBAction func AndrewButtonTapped() {
        print("Andrew Button Tapped")
    }
    
    @IBAction func TomButtonTapped() {
        print("Tom Button Tapped")
    }
    
    
    
}

extension InterfaceController: WatchShakerDelegate {
    func watchShakerDidShake(_ watchShaker: WatchShaker) {
        print("YOU HAVE SHAKEN YOUR ⌚️⌚️⌚️")
        playSound(named: "WebShootShort")
    }
    func watchShaker(_ watchShaker: WatchShaker, didFailWith error: Error) {
        print(error.localizedDescription)
    }
    func watchShaker(_ watchShaker: WatchShaker, didShakeWith sensibility: ShakeSensibility) {
        playSound(named: "WebShootShort")
        
    }
    
}
