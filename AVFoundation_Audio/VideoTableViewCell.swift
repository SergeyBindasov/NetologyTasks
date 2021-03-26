//
//  VideoTableViewCell.swift
//  AVFoundation_Audio
//
//  Created by Sergey on 16.03.2021.
//

import UIKit
import WebKit

class VideoTableViewCell: UITableViewCell {
    
    var link: String? {
        didSet {
            DispatchQueue.main.async { [self] in
                guard let link = self.link else { return }
                self.webView.load(createRequest(youtubeLink: link))
            }
        }
    }
    
    private lazy var webView: WKWebView = {
        var wv = WKWebView()
        wv.contentMode = .scaleAspectFit
        wv.scrollView.isScrollEnabled = false
        return wv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        contentView.addSubviews(webView)
        setupLayout()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}

private extension VideoTableViewCell {
    func setupLayout() {
        let constraints = [
            webView.widthAnchor.constraint(equalToConstant: 1280 / 3),
            webView.heightAnchor.constraint(equalToConstant: 720 / 3),
            webView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3),
            webView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3),
            webView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 3),
            webView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -3)
            
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func createRequest(youtubeLink: String) -> URLRequest {
        let urlFromString = URL(string: youtubeLink)
        let request = URLRequest(url: (urlFromString ?? URL(string: "https://www.youtube.com/"))!)
        return request
    }
}
