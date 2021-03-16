//
//  AudioViewController.swift
//  AVFoundation_Audio
//
//  Created by Sergey on 11.03.2021.
//

import UIKit
import AVFoundation

class AudioViewController: UIViewController {
    
   var Player = AVAudioPlayer()
   var playingSong: Int = 0
    
    private lazy var songsTableView: UITableView = {
        let tableview = UITableView()
        tableview.register(AudioTableViewCell.self, forCellReuseIdentifier: String(describing: AudioTableViewCell.self))
        tableview.delegate = self
        tableview.dataSource = self
        tableview.showsVerticalScrollIndicator = false
    
        return tableview
    }()
    
    private lazy var songTitle: UILabel = {
        let title = UILabel()
        title.numberOfLines = 0
        title.textAlignment = .center
        title.font = UIFont(name: "Damascus", size: 24)
        return title
    }()
    
    private lazy var playButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "play.fill"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(play), for: .touchUpInside)
        return button
    }()
    
    private lazy var stopButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "stop.fill"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(stop), for: .touchUpInside)
        return button
    }()
    
    private lazy var pauseButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(pauseMusic), for: .touchUpInside)
        return button
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "forward.fill"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(nextSong), for: .touchUpInside)
        return button
    }()
    
    private lazy var previousButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "backward.fill"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(previousSong), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews(songsTableView, songTitle, playButton, pauseButton, stopButton, nextButton, previousButton)
        setupLayout()
        title = "Audio"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "video.fill"), style: .plain, target: self, action: #selector(videoVC))
        view.backgroundColor = .white
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
            
        if UIDevice.current.orientation.isLandscape {
            songsTableView.isHidden = true
        } else {
            songsTableView.isHidden = false
        }
    }
}

extension AudioViewController {
    
    @objc func play() {
        Player.play()
    }
    
    @objc func stop() {
        if Player.isPlaying {
            Player.stop()
            Player.currentTime = 0
        }
    }
    
    @objc func pauseMusic() {
        if Player.isPlaying {
            Player.pause()
        }
    }
    
    @objc func nextSong() {
        if playingSong < MusicContent.content.count {
            getSong(song: MusicContent.content[playingSong].songTitle)
        } else {
            playingSong = 0
        }
    }
    
    @objc func previousSong() {
        if playingSong > 0 || playingSong == 0 {
        lastSong(song: MusicContent.content[playingSong].songTitle)
        } else {
            playingSong = 0
        }
    }
    
   func getSong(song: String) {
            do {
                let audioPath = Bundle.main.path(forResource: song, ofType: "mp3")
                guard let audio = audioPath else { return }
                Player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: audio))
                songTitle.text = MusicContent.content[playingSong].songTitle
                Player.prepareToPlay()
                playingSong += 1
                play()
            }
            catch {
                print(error)
            }
   }
    
    func lastSong(song:String) {
        do {
            let audioPath = Bundle.main.path(forResource: song, ofType: "mp3")
            guard let audio = audioPath else { return }
            Player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: audio))
            songTitle.text = MusicContent.content[playingSong].songTitle
            Player.prepareToPlay()
            playingSong -= 1
            play()
        }
        catch {
            print(error)
        }
    }
    
    @objc func videoVC() {
        let videoVC = VideoViewController()
        navigationController?.pushViewController(videoVC, animated: true)
        if Player.isPlaying {
            Player.stop()
        }
    }
}

private extension AudioViewController {
    func setupLayout(){
        let constraints = [
            songsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            songsTableView.bottomAnchor.constraint(equalTo: songTitle.topAnchor, constant: -22),
            songsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            songsTableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            songTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            songTitle.bottomAnchor.constraint(equalTo: playButton.topAnchor, constant: -18),
            songTitle.widthAnchor.constraint(equalToConstant: view.bounds.width - 40),
            songTitle.heightAnchor.constraint(equalToConstant: 60),
            playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playButton.bottomAnchor.constraint(equalTo: pauseButton.topAnchor, constant: -22),
            pauseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pauseButton.bottomAnchor.constraint(equalTo: stopButton.topAnchor, constant: -22),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -68),
            nextButton.centerYAnchor.constraint(equalTo: playButton.centerYAnchor),
            nextButton.leadingAnchor.constraint(equalTo: playButton.trailingAnchor, constant: 48),
            previousButton.centerYAnchor.constraint(equalTo: playButton.centerYAnchor),
            previousButton.trailingAnchor.constraint(equalTo: playButton.leadingAnchor, constant: -48)
        ]
        NSLayoutConstraint.activate(constraints)
        
    }
}

extension AudioViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Tracklist"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
}

extension AudioViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MusicContent.content.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: AudioTableViewCell.self ), for: indexPath) as? AudioTableViewCell
        cell?.content = MusicContent.content[indexPath.row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        songTitle.text = MusicContent.content[indexPath.row].songTitle
        do {
            Player = try AVAudioPlayer(contentsOf: MusicContent.content[indexPath.row].song)
            Player.prepareToPlay()
            play()
            playingSong = indexPath.row
        }
        catch {
            print(error)
        }
    }
}
