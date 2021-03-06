//
//  MangaClass.swift
//  Mango (Social Manga)
//
//  Created by Blake Harrison on 11/22/18.
//  Copyright © 2018 Blake Harrison. All rights reserved.
//

import Foundation
import SwiftyJSON

class MangaDataStructure {
    
    //MARK: Properties
    var mangaChapterIDs: [String] = []
    var currentChapterIndex = 0
    var currentChapterID = ""
    var mangaChaptersString: [String] = []
    var currentChapterString = ""
    var isMangaChaptersReversed = true
    
    // MARK: Methods
    func nextID() {
        guard mangaChapterIDs.isEmpty != true else {
            return
        }
        
        if isMangaChaptersReversed == false {
            currentChapterIndex += 1
            selectedIndex += 1
            
            if currentChapterIndex == mangaChapterIDs.count {
                print("Finished Manga")
                currentChapterIndex -= 1
                selectedIndex -= 1
                NotificationCenter.default.post(name: .chaptersAreFinished, object: nil)
                return
            }
            
            currentChapterID = mangaChapterIDs[currentChapterIndex]
            selectedChapterID = currentChapterID
            
        } else if isMangaChaptersReversed == true {
            currentChapterIndex -= 1
            selectedIndex -= 1
            
            if currentChapterIndex == -1 {
                print("Finished Manga")
                currentChapterIndex += 1
                selectedIndex += 1
                NotificationCenter.default.post(name: .chaptersAreFinished, object: nil)
                return
            }
            
            currentChapterID = mangaChapterIDs[currentChapterIndex]
            selectedChapterID = currentChapterID
        }

        print(currentChapterID)
        print(selectedChapterID)
    }
    
    func previousID() {
        
        guard mangaChapterIDs.isEmpty != true else {
            return
        }
        
        if isMangaChaptersReversed == true {
            currentChapterIndex += 1
            selectedIndex += 1
            
            if currentChapterIndex == mangaChapterIDs.count {
                print("Finished Manga")
                currentChapterIndex -= 1
                selectedIndex -= 1
                NotificationCenter.default.post(name: .chaptersAreFinished, object: nil)
                return
            }
            
            currentChapterID = mangaChapterIDs[currentChapterIndex]
            selectedChapterID = currentChapterID
            
        } else if isMangaChaptersReversed == false {
            
            guard currentChapterIndex > 0 else {
                print("No previous chapters")
                NotificationCenter.default.post(name: .chaptersAreFinished, object: nil)
                return
            }
            
            currentChapterIndex -= 1
            selectedIndex -= 1
            
            currentChapterID = mangaChapterIDs[currentChapterIndex]
            selectedChapterID = currentChapterID
        }
        
        print(currentChapterID)
        print(selectedChapterID)
    }
    
    func addID(_ ID: String) {
        mangaChapterIDs.append(ID)
    }
    
    func removeIDs() {
        guard mangaChapterIDs.isEmpty != true else {
            return
        }
        mangaChapterIDs.removeAll()
    }
    
    func reverseIDs() {
        guard mangaChapterIDs.isEmpty != true else {
            return
        }
        mangaChapterIDs.reverse()
    }
    
    func removeChapterStrings() {
        guard mangaChaptersString.isEmpty != true else {
            return
        }
        mangaChaptersString.removeAll()
    }
    
    func changeChapterString(_ chapter: String) {
        currentChapterString = chapter
    }
    
    func resetToDefault() {
        mangaChapterIDs.removeAll()
        currentChapterIndex = 0
        currentChapterID = ""
        mangaChaptersString.removeAll()
        currentChapterString = ""
        isMangaChaptersReversed = true
    }
}
