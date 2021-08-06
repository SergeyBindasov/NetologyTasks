//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Sergey on 01.11.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit
import StorageService
import iOSIntPackage

class PhotosViewController: UIViewController, ImageLibrarySubscriber {
    
    weak var coordinator: ProfileFlowCoordinator?
  
    var imageArray: [UIImage] = []
    
    var imagePublisher: ImagePublisherFacade? = .init()
    
    private lazy var galleryCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: PhotosCollectionViewCell.self))
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = .white
        collection.showsVerticalScrollIndicator = false
        collection.toAutoLayuot()
        
        return collection
    }()
    
    func receive(images: [UIImage]) {
        self.imageArray = images
        self.galleryCollection.reloadData()
    }
    
    func converter(images: [Pic]) -> [UIImage] {
        var newArray: [UIImage] = []
        for image in images {
            guard let photo = image.image else { return [] }
            newArray.append(photo)
        }
        return newArray
    }
        
    override func viewDidLoad() {
        super .viewDidLoad()
        setupLayout()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Photo Galley"
        imagePublisher?.subscribe(self)
        imagePublisher?.addImagesWithTimer(time: 0.5, repeat: 20, userImages: converter(images: Storage.Photos.photos))
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        imagePublisher?.removeSubscription(for: self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
}



extension PhotosViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let items = imageArray.count
        return items
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PhotosCollectionViewCell.self), for: indexPath) as! PhotosCollectionViewCell
        
        cell.gallery = imageArray[indexPath.item]
        return cell
    }
    
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    
 var offset: CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (collectionView.bounds.width - offset * 4) / 3
        let hight: CGFloat = width
        return CGSize(width: width, height: hight)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return offset
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return offset
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: offset, left: offset, bottom: .zero, right: offset)
    }
}


private extension PhotosViewController {
    func setupLayout() {
        view.addSubview(galleryCollection)
        
        let contraints = [
            galleryCollection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            galleryCollection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            galleryCollection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            galleryCollection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        NSLayoutConstraint.activate(contraints)
    }
}

