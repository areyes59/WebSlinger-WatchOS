//
//  SoundPlayingM4A.swift
//  WebSlinger WatchKit Extension
//
//  Created by Aaron Reyes on 8/10/19.
//  Copyright © 2019 Aaron Reyes. All rights reserved.
//

import AVFoundation

protocol SoundPlayingM4A: AnyObject {
    var audioPlayer: AVAudioPlayer? { get set }
}

extension SoundPlayingM4A {
    func playSoundM4A(named name: String) {
        guard let url = Bundle.main.url(forResource: name, withExtension: "m4a") else {
            fatalError("Unable to find sound file \(name).m4a")
        }
        
        try? audioPlayer = AVAudioPlayer(contentsOf: url)
        audioPlayer?.play()
    }
}
