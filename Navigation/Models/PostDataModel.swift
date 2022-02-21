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
    
    lazy var persistentContainer: NSPersistentContainer = {
     
        let container = NSPersistentContainer(name: "CoreDataModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    var backgroundContext: NSManagedObjectContext {
        return persistentContainer.newBackgroundContext()
    }
    
    func createNewPost(path: Int) {
        let newBackgroundContext = backgroundContext
        let newPost = SavedPost(context: newBackgroundContext)
        newPost.author = Storage.Content.content[path].author
        newPost.postDescription = Storage.Content.content[path].description
        if let image = Storage.Content.content[path].image {
            let dataImage = image.jpegData(compressionQuality: 1)
            newPost.image = dataImage
        }
        newPost.likes = Int32(Storage.Content.content[path].likes)
        newPost.views = Int32(Storage.Content.content[path].views)
        arrayOfPosts.append(newPost)
        savePost(context: newBackgroundContext)
    }
    
    func savePost(context: NSManagedObjectContext) {
        do {
            try context.save()
        } catch {
            print("Ошибка с сохранением поста \(error.localizedDescription)")
        }
    }
    
    func deletePost() {
        
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
