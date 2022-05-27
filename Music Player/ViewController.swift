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
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupPlayer()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        self.player?.play()
        
    }
    func setupPlayer() {
        guard let url = Bundle.main.url(forResource: "invisible", withExtension: "mp3") else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            print(player)
            player?.play()
            guard let player = player else { return }
            player.prepareToPlay()
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
