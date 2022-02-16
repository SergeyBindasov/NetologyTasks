//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Sergey on 03.10.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit
import StorageService
import CoreData


class ProfileViewController: UIViewController {
    
    weak var coordinator: ProfileFlowCoordinator?
    
    let postDataModel: PostDataModel
    
    let userService: UserService
    let userName: String
    
    init(userService: UserService, userName: String, postDataModel: PostDataModel) {
        self.userService = userService
        self.userName = userName
        self.postDataModel = postDataModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .grouped)
        tv.register(PostTableViewCell.self, forCellReuseIdentifier: String(describing: PostTableViewCell.self))
        tv.register(PhotosTableViewCell.self, forCellReuseIdentifier: String(describing: PhotosTableViewCell.self))
        tv.sectionFooterHeight = 8
        tv.showsVerticalScrollIndicator = false
        tv.dataSource = self
        tv.delegate = self
        tv.toAutoLayuot()
        return tv
    }()
    
       
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        
    }
    
    private func setupLayout() {
        view.addSubview(tableView)
        
        let constraints = [
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}

extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 2 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PostTableViewCell.self), for: indexPath) as? PostTableViewCell
            cell?.content = Storage.Content.content[indexPath.row]
            return cell!
            }
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PhotosTableViewCell.self), for: indexPath) as? PhotosTableViewCell
            return cell!
        }
    return UITableViewCell()
}
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return 1 }
        if section == 2 {
            return Storage.Content.content.count }
        else {
            return 0 }
}
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section == 0 else { return nil }
        let headerView = ProfileTableHederView()
        let currentUser = userService.userName(by: userName)
        headerView.title.text = currentUser.name
        headerView.avatarImageView.image = currentUser.avatar
        headerView.status.text = currentUser.status
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 {
            return 0 }
        if section == 2 {
            return 0
        }
        return tableView.estimatedSectionHeaderHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            coordinator?.showGallery()
        } else {
            postDataModel.createNewPost(path: indexPath.row)
        }
            
    }
}
