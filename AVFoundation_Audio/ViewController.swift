//
//  ViewController.swift
//  AVFoundation_Audio
//
//  Created by Niki Pavlove on 18.02.2021.
//

import UIKit
import AVFoundation
/*
class ViewController: UIViewController {
    
    //var Player = AVAudioPlayer()

    @IBOutlet var songTitle: UILabel!
    @IBOutlet var playButton: UIButton!
    @IBOutlet var pauseButton: UIButton!
    @IBOutlet var stopButton: UIButton!
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var previousButton: UIButton!
    
    var tracklist = [URL]()
    var songToPlay: URL?
    
    
    /*
    let trackOne = URL.init(fileURLWithPath: Bundle.main.path(forResource: "David Bowie - Life On Mars", ofType: "mp3") ?? "no track")
    let trackTwo = URL.init(fileURLWithPath: Bundle.main.path(forResource: "Miley Cyrus - Plastic Hearts", ofType: "mp3") ?? "no track")
    let trackThree = URL.init(fileURLWithPath: Bundle.main.path(forResource: "Dolly Parton - Jolene", ofType: "mp3") ?? "no track")
    let trackFour = URL.init(fileURLWithPath: Bundle.main.path(forResource: "Madonna - Borderline", ofType: "mp3") ?? "no track")
    let trackFive = URL.init(fileURLWithPath: Bundle.main.path(forResource: "Placebo - Song to Say Goodbye", ofType: "mp3") ?? "no track")
    */
    func playNext() {
        do {
            for song in tracklist {
                Player = try AVAudioPlayer(contentsOf: song)
                self.songTitle.text = song.lastPathComponent
                Player.prepareToPlay()
            }
            Player.play()
        }
        catch {
            print(error)
        }
       
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.translatesAutoresizingMaskIntoConstraints = false
        setupLayout()
        tracklist = [trackOne, trackTwo, trackThree, trackFour, trackFive]
        for songs in tracklist {
            self.songTitle.text = songs.lastPathComponent
            print(songs.lastPathComponent)
        }
        do {
            for song in tracklist {
        
                Player = try AVAudioPlayer(contentsOf: song)
              
                Player.prepareToPlay()
            }
        }
        catch {
            print(error)
        }
    }

    @IBAction func PlayButton(_ sender: Any) {
        Player.play()
    }
    
    @IBAction func StopButton(_ sender: Any) {
        if Player.isPlaying {
            Player.stop()
            Player.currentTime = 0
        }
            
    }
    @IBAction func pauseButton(_ sender: Any) {
        if Player.isPlaying {
            Player.pause()
        }
    }
    
    @IBAction func nextSong(_ sender: Any) {
        playNext()
        
    }
    
    @IBAction func previousSong(_ sender: Any) {
    }
}

private extension ViewController {
    func setupLayout(){
        let constraints = [
            songTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            songTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        
    }
}


 */
