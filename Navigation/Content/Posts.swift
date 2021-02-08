//
//  Posts.swift
//  Navigation
//
//  Created by Sergey on 27.10.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

public struct PostStruct {
    var author: String
    var description: String
    var image: UIImage!
    var likes: Int
    var views: Int
}

struct Content {
    static let content = [
        PostStruct(author: "Rock Paper Shotgun", description: "Over the past few weeks, the developers of the excellent metroidvania Hollow Knight have been revealing new characters that players will meet in the upcoming sequel, Silksong. To uncover these NPCs, fans have had to answer riddles, and so far, we’ve seen the rather creepy Huntress and the sneak-thief Grindle. Last night, however, a new challenger approached. Meet Seth, an ancient guardian of a place called the Citadel, who was designed with and named after a young person who recently passed away.", image: UIImage(named: "Silksong"), likes: 20, views: 83),
        PostStruct(author: "BBC News", description: "Canary Islands added to UK's safe travel list. UK tourists seeking winter sun have been given a boost, after Spain's Canary Islands and the Maldives were added to the government's safe travel list. It means visitors will no longer need to quarantine for 14 days on their return, with the Greek island of Mykonos and Denmark also deemed safe. The changes apply to anyone arriving in the UK after 04:00 BST on Sunday.But Liechtenstein has been taken off the list, so arrivals must isolate. The changes apply to citizens from England, Scotland, Northern Ireland and Wales.", image: UIImage(named: "Beach"), likes: 53, views: 646),
        PostStruct(author: "VC.ru", description: "Коалиция Epic Games, Tinder, Spotify и других против Apple получила около 400 заявок на вступление от разработчиков. Количество участников «Коалиции за справедливость приложений» (Coalition for App Fairness) против Apple выросло с 13 до 40 компаний, передаёт The Washington Post. Организация получила ещё более 400 заявок на вступление. Организация выступает против 30%-х комиссий App Store, отсутствия возможности распространения приложений на iOS в обход магазина Apple и антиконкурентных правил App Store.", image: UIImage(named: "Apple"), likes: 15, views: 396),
        PostStruct(author: "Чемпионат.com", description: "Магазин цифровой и бытовой техники и электроники М.Видео вновь открыл предзаказы на PlayStation 5 после того как первая партия консолей была полностью раскуплена. Оформить консоль можно на сайте магазина. Правда теперь PlayStation 5 стоит 46 999 рублей. Ранее консоль в этом магазине можно было приобрести на 1 000 рублей дешевле. Стоимость PlayStation 5 в России составляет 46 999 рублей. Версия без дисковода обойдётся в 37 999 рублей. PS5 выйдет 12 ноября 2020 года в США, Канаде, Мексике, Корее, Японии и Австралии. В России дата выхода PlayStation 5 запланирована на 19 ноября 2020 года.", image: UIImage(named: "PS5"), likes: 60, views: 468),
        PostStruct(author: "Forbes", description: "Фитнес-клубы в открытом письме арендодателям попросили снизить стоимость аренды на 50%, пообещав в ответ содействовать в снижении налогов. В ином случае клубы не смогут существовать и будут вынуждены закрываться, предупреждает отрасль. Ассоциация операторов фитнес-индустрии (АОФИ) обратилась с открытым письмом ко всем арендодателям с предложением начать переговоры о снижении арендной платы для их объектов на 50% до конца года.", image: UIImage(named: "Sport"), likes: 60, views: 864)]
}

