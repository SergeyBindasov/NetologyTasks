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
    
    private lazy var searchBar: UISearchBar = {
        let search = UISearchBar()
        search.isHidden = true
        search.placeholder = "Поиск по автору"
        search.delegate = self
        return search
    }()
    
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
        navigationItem.titleView = searchBar
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(barButtonSystemItem: .undo , target: self, action: #selector(cancelButtonPressed)),
            UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchButtonPressed))
        ]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        favTavleView.reloadData()
    }
}

extension FavoriteViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Удалить") { [weak self] (_, _, _) in
            guard let self = self else { return }
            self.dataModel.deletePost(post: self.favoritePost[indexPath.row])
            self.favTavleView.deleteRows(at: [indexPath], with: .automatic)
            self.favTavleView.reloadData()
        }
        let configuration = UISwipeActionsConfiguration(actions: [action])
        configuration.performsFirstActionWithFullSwipe = true
        return configuration
    }
    
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

extension FavoriteViewController: UISearchBarDelegate {

}



extension FavoriteViewController {
    @objc func searchButtonPressed() {
        searchBar.isHidden = false
    }
    
    @objc func cancelButtonPressed() {
        searchBar.isHidden = true
    }
    
    func setupLayout() {
        view.addSubviews(searchBar,favTavleView)
        
        favTavleView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}




