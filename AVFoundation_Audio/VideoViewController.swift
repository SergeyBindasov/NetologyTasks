//
//  VideoViewController.swift
//  AVFoundation_Audio
//
//  Created by Sergey on 15.03.2021.
//

import UIKit
import WebKit
import AVFoundation

class VideoViewController: UIViewController {
    
    var playlist: [String] = ["https://www.youtube.com/watch?v=0yZatBxIqVk", "https://www.youtube.com/watch?v=tN-c94dgRps", "https://www.youtube.com/watch?v=arEdruKxrQ8", "https://www.youtube.com/watch?v=qSyT3XAFcSQ", "https://www.youtube.com/watch?v=ojJMi8MfIT0"
    ]
    
    private lazy var videoTableView: UITableView = {
       let tv = UITableView()
        tv.register(VideoTableViewCell.self, forCellReuseIdentifier: String(describing: VideoTableViewCell.self))
        tv.dataSource = self
        tv.delegate = self
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Video"
        view.backgroundColor = .white
        view.addSubviews(videoTableView)
        setupLayout()
    }
}

extension VideoViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "YouTube playlist"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 720 / 3 + 10
    }
}

extension VideoViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: VideoTableViewCell.self ), for: indexPath) as? VideoTableViewCell
        cell?.link = playlist[indexPath.row]
        return cell!
    }
}

private extension VideoViewController {
    func setupLayout() {
        let constraints = [
            videoTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            videoTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            videoTableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            videoTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            videoTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
