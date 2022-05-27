//
//  ViewController.swift
//  Music Player
//
//  Created by karen syah on 27/05/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var heartButton: UIButton!
    var player: AVAudioPlayer! = nil


    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupPlayer()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        player?.play()
        print("view did appear")
        print(player)
        print(self.player?.play())
        
        
    }
    func setupPlayer() {
        guard let url = Bundle.main.url(forResource: "Invisible", withExtension: "mp3") else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            guard let player = player else { return }
            player.prepareToPlay()
//            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    var favorited: Bool = false
    @IBAction func favoriteTapped(_ sender: Any) {
        favorited = !favorited // toggles favorite boolean
           if favorited {
               heartButton.setImage(UIImage(named: "favorite"), for: .normal)
           } else {
               heartButton.setImage(UIImage(named: "favorite-border"), for: .normal)
           }
    }
}
