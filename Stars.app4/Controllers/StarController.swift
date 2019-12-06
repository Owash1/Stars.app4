//
//  starController.swift
//  Stars.app4
//
//  Created by Osha Washington on 12/5/19.
//  Copyright © 2019 Osha Washington. All rights reserved.
//

import Foundation

class StarController {
    //CRUD
    init() {
        loadFromPersistentStore()
    }
    
    private(set) var stars: [Star] = []
    
    private var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        
        // /Users/oshawashington/Documents/stars.plist
        return documents.appendingPathComponent("stars.plist")
        
    }
    //Create
    @discardableResult func createStar(named name: String, withDistance distance: Double) -> Star {
        let star = Star(name: name, distance: distance)
        stars.append(star)
        saveToPersistanceStore()
        return star
    }
    //Read
    
    //Update
    
    // Save & Load
    
    func saveToPersistanceStore() {
        guard let url = persistentFileURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(stars)
            try data.write(to: url)
        } catch {
            print("Error saving stars data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let url = persistentFileURL,
            fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            stars = try decoder.decode([Star].self, from: data)
        } catch {
            print("Error loading stars data: \(error)")
        }
    }
}
