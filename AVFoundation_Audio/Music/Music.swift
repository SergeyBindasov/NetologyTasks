//
//  Music.swift
//  AVFoundation_Audio
//
//  Created by Sergey on 11.03.2021.
//

import Foundation
import UIKit

struct MusicStruct {
    var song: URL
    var songTitle: String
    var cover: UIImage
}

struct MusicContent {
    static let content = [MusicStruct(song: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Miley Cyrus - Plastic Hearts", ofType: "mp3") ?? "no track"), songTitle: "Miley Cyrus - Plastic Hearts", cover: UIImage(named: "02")!),
                          MusicStruct(song: URL.init(fileURLWithPath: Bundle.main.path(forResource: "David Bowie - Life On Mars", ofType: "mp3") ?? "no track"), songTitle: "David Bowie - Life On Mars", cover: UIImage(named: "01")!),
                          MusicStruct(song: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Dolly Parton - Jolene", ofType: "mp3") ?? "no track"), songTitle: "Dolly Parton - Jolene", cover: UIImage(named: "03")!),
                          MusicStruct(song: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Madonna - Borderline", ofType: "mp3") ?? "no track"), songTitle: "Madonna - Borderline", cover: UIImage(named: "04")!),
                          MusicStruct(song: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Placebo - Song to Say Goodbye", ofType: "mp3") ?? "no track"), songTitle: "Placebo - Song to Say Goodbye", cover: UIImage(named: "05")!),
                          MusicStruct(song: URL.init(fileURLWithPath: Bundle.main.path(forResource: "David Bowie - Life On Mars", ofType: "mp3") ?? "no track"), songTitle: "David Bowie - Life On Mars", cover: UIImage(named: "01")!),
                          MusicStruct(song: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Miley Cyrus - Plastic Hearts", ofType: "mp3") ?? "no track"), songTitle: "Miley Cyrus - Plastic Hearts", cover: UIImage(named: "02")!),
                          MusicStruct(song: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Dolly Parton - Jolene", ofType: "mp3") ?? "no track"), songTitle: "Dolly Parton - Jolene", cover: UIImage(named: "03")!),
                          MusicStruct(song: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Madonna - Borderline", ofType: "mp3") ?? "no track"), songTitle: "Madonna - Borderline", cover: UIImage(named: "04")!),
                          MusicStruct(song: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Placebo - Song to Say Goodbye", ofType: "mp3") ?? "no track"), songTitle: "Placebo - Song to Say Goodbye", cover: UIImage(named: "05")!)
    ]
}
