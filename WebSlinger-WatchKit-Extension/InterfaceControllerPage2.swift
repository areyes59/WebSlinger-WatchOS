//
//  InterfaceControllerPage2.swift
//  WebSlinger WatchKit Extension
//
//  Created by Aaron Reyes on 8/10/19.
//  Copyright © 2019 Aaron Reyes. All rights reserved.
//

import WatchKit
import AVFoundation

class InterfaceControllerPage2: WKInterfaceController, SoundPlaying {
    var audioPlayer: AVAudioPlayer?
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    var shaker:WatchShaker = WatchShaker(shakeSensibility: .shakeSensibilityHard, delay: 0.05)
    
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
    
    @IBAction func SpideyButtonTapped() {
        print("Spidey Button Tapped")
        playSound(named: "WebShootShort")
    }
}

extension InterfaceControllerPage2: WatchShakerDelegate {
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
