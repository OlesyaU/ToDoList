//
//  Model.swift
//  ToDoList
//
//  Created by Олеся on 18.01.2023.
//

import Foundation

struct ToDoItem: Codable {
    var title: String
    var isCompleted: Bool
}

var items: [ToDoItem] = []

func loadItems() {
    do {
        if let data = UserDefaults.standard.data(forKey: "database") {
            items = try JSONDecoder().decode([ToDoItem].self, from: data)
        } else {
            print("Wrong with decode data Items")
        }
    }
    catch {
        print(error)
    }
}
 
func safeItem(){
    do {
        let data = try JSONEncoder().encode(items)
        UserDefaults.standard.set(data, forKey: "database")
        UserDefaults.standard.synchronize()
    }
    catch {
        print(error)
    }
}
