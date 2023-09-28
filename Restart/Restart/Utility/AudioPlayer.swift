//
//  AudioPlayer.swift
//  Restart
//
//  Created by apple on 27/09/23.
//

import Foundation
import AVFoundation

private var audioPlayer: AVAudioPlayer?

func playSound(fileName: String, type: String) {
    if let path = Bundle.main.path(forResource: fileName, ofType: type) {
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(filePath: path))
            audioPlayer?.play()
        } catch{
            
        }
    }
}

