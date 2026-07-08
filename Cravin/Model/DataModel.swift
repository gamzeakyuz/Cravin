//
//  DataModel.swift
//  ZihninOkyanusu
//
//  Created by Gamze Akyüz on 6.04.2023.
//

import UIKit
import CoreData

final class DataModel {
    
    static var shared = DataModel()
    var notes: [NSManagedObject] = []
    
    func loadData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Notes")
        do {
            notes = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print(error)
        }
    }
    
    func save(_ note: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Notes", in: managedContext)!
        let postIt = NSManagedObject(entity: entity, insertInto: managedContext)
        postIt.setValue(note, forKey: "note")
        do {
            try managedContext.save()
            notes.append(postIt)
        } catch let error as NSError {
            print(error)
        }
    }
    
    func delete(_ row: Int) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = appDelegate.persistentContainer.viewContext
        do {
            managedContext.delete(notes[row])
            notes.remove(at: row)
            try managedContext.save()
        } catch let error as NSError {
            print(error)
        }
    }
}
