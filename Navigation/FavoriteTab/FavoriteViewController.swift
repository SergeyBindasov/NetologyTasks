//
//  FavoriteViewController.swift
//  Navigation
//
//  Created by Sergey on 16.02.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import UIKit
import SnapKit
import StorageService

class FavoriteViewController: UIViewController {
    
    weak var coordinator: FavoriteFlowCoordinator?
    
    var favoritePost: [Post] = []
    
    private lazy var favTavleView: UITableView = {
        let tableView = UITableView()
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: String(describing: PostTableViewCell.self))
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
    }
}

extension FavoriteViewController: UITableViewDelegate {
    
}

extension FavoriteViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritePost.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PostTableViewCell.self), for: indexPath) as? PostTableViewCell
        guard let newCell = cell else { return PostTableViewCell()}
        return newCell
    }
}

extension FavoriteViewController {
    func setupLayout() {
        view.addSubviews(favTavleView)
        
        favTavleView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaInsets)
        }
    }
}



