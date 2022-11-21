//
//  Notification.swift
//  Navigation
//
//  Created by Sergey on 21.11.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import Foundation
import UserNotifications

class LocalNotificationsService {
    let center = UNUserNotificationCenter.current()
    
    func registeForLatestUpdatesIfPossible() {
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                print("Ошибка запроса уведомлений")
            } else {
                if granted {
                    print("Доступ получен")
                    self.sendSceduledNotification()
                } else {
                    print("Доступ не получен")
                }
            }
        }
    }
    
   private func sendSceduledNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Зайди в приложение ВК"
        content.body = "Посмотрите последние обновления"
        
        var datesComponents = DateComponents()
        datesComponents.hour = 19
        datesComponents.minute = 00
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: datesComponents, repeats: true)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        center.add(request)
    }
    
}
