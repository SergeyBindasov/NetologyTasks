//
//  PostDataModel.swift
//  Navigation
//
//  Created by Sergey on 16.02.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import Foundation
import CoreData
import StorageService
import UIKit

class PostDataModel {
    
    var arrayOfPosts: [SavedPost] = []
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func createNewPost(path: Int) {
        let newPost = SavedPost(context: self.context)
        newPost.author = Storage.Content.content[path].author
        newPost.postDescription = Storage.Content.content[path].description
        if let image = Storage.Content.content[path].image {
            let dataImage = image.jpegData(compressionQuality: 1)
            newPost.image = dataImage
        }
        newPost.likes = Int32(Storage.Content.content[path].likes)
        newPost.views = Int32(Storage.Content.content[path].views)
        arrayOfPosts.append(newPost)
        savePost()
    }
    
    func savePost() {
        do {
            try context.save()
        } catch {
            print("Ошибка с сохранением поста \(error.localizedDescription)")
        }
    }
    
    func loadPosts() -> [SavedPost] {
        let request: NSFetchRequest<SavedPost> = SavedPost.fetchRequest()
        do {
        arrayOfPosts = try context.fetch(request)
        } catch {
            ("Ошибка с загрузкой постов \(error.localizedDescription)")
        }
        return arrayOfPosts
}
}
