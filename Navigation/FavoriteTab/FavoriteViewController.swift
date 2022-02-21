//
//  FavoriteViewController.swift
//  Navigation
//
//  Created by Sergey on 16.02.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import UIKit
import SnapKit

class FavoriteViewController: UIViewController {
    
    weak var coordinator: FavoriteFlowCoordinator?
    
    let dataModel = PostDataModel()
    
    var favoritePost: [SavedPost] {
        return dataModel.loadPosts()
    }
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        favTavleView.reloadData()
    }
}

extension FavoriteViewController: UITableViewDelegate {
    
}

extension FavoriteViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritePost.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PostTableViewCell.self), for: indexPath) as! PostTableViewCell
        cell.savedContent = favoritePost[indexPath.row]
        return cell
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



