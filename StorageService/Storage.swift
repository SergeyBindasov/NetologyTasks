//
//  PostContent.swift
//  StorageService
//
//  Created by Sergey on 26.05.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation
import UIKit

public class Storage {
    
    public struct Content {
        public static let content = [
            Post(author: "Rock Paper Shotgun", description: "Over the past few weeks, the developers of the excellent metroidvania Hollow Knight have been revealing new characters that players will meet in the upcoming sequel, Silksong. To uncover these NPCs, fans have had to answer riddles, and so far, we’ve seen the rather creepy Huntress and the sneak-thief Grindle. Last night, however, a new challenger approached. Meet Seth, an ancient guardian of a place called the Citadel, who was designed with and named after a young person who recently passed away.", image: UIImage(named: "Silksong"), likes: 20, views: 83),
            Post(author: "BBC News", description: "Canary Islands added to UK's safe travel list. UK tourists seeking winter sun have been given a boost, after Spain's Canary Islands and the Maldives were added to the government's safe travel list. It means visitors will no longer need to quarantine for 14 days on their return, with the Greek island of Mykonos and Denmark also deemed safe. The changes apply to anyone arriving in the UK after 04:00 BST on Sunday.But Liechtenstein has been taken off the list, so arrivals must isolate. The changes apply to citizens from England, Scotland, Northern Ireland and Wales.", image: UIImage(named: "Beach"), likes: 53, views: 646),
            Post(author: "VC.ru", description: "Коалиция Epic Games, Tinder, Spotify и других против Apple получила около 400 заявок на вступление от разработчиков. Количество участников «Коалиции за справедливость приложений» (Coalition for App Fairness) против Apple выросло с 13 до 40 компаний, передаёт The Washington Post. Организация получила ещё более 400 заявок на вступление. Организация выступает против 30%-х комиссий App Store, отсутствия возможности распространения приложений на iOS в обход магазина Apple и антиконкурентных правил App Store.", image: UIImage(named: "Apple"), likes: 15, views: 396),
            Post(author: "Чемпионат.com", description: "Магазин цифровой и бытовой техники и электроники М.Видео вновь открыл предзаказы на PlayStation 5 после того как первая партия консолей была полностью раскуплена. Оформить консоль можно на сайте магазина. Правда теперь PlayStation 5 стоит 46 999 рублей. Ранее консоль в этом магазине можно было приобрести на 1 000 рублей дешевле. Стоимость PlayStation 5 в России составляет 46 999 рублей. Версия без дисковода обойдётся в 37 999 рублей. PS5 выйдет 12 ноября 2020 года в США, Канаде, Мексике, Корее, Японии и Австралии. В России дата выхода PlayStation 5 запланирована на 19 ноября 2020 года.", image: UIImage(named: "PS5"), likes: 60, views: 468),
            Post(author: "Forbes", description: "Фитнес-клубы в открытом письме арендодателям попросили снизить стоимость аренды на 50%, пообещав в ответ содействовать в снижении налогов. В ином случае клубы не смогут существовать и будут вынуждены закрываться, предупреждает отрасль. Ассоциация операторов фитнес-индустрии (АОФИ) обратилась с открытым письмом ко всем арендодателям с предложением начать переговоры о снижении арендной платы для их объектов на 50% до конца года.", image: UIImage(named: "Sport"), likes: 60, views: 864)]
    }
    
    public struct Photos {
        public static var photos = [Pic(image: UIImage(named: "01")), Pic(image: UIImage(named: "02")), Pic(image: UIImage(named: "03")), Pic(image: UIImage(named: "04")), Pic(image: UIImage(named: "05")), Pic(image: UIImage(named: "06")), Pic(image: UIImage(named: "07")), Pic(image: UIImage(named: "08")), Pic(image: UIImage(named: "09")), Pic(image: UIImage(named: "10")), Pic(image: UIImage(named: "11")), Pic(image: UIImage(named: "12")), Pic(image: UIImage(named: "13")), Pic(image: UIImage(named: "14")), Pic(image: UIImage(named: "15")), Pic(image: UIImage(named: "16")), Pic(image: UIImage(named: "17")), Pic(image: UIImage(named: "18")), Pic(image: UIImage(named: "19")), Pic(image: UIImage(named: "20"))]
    }
    
}


