//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
//import CoreData
import RealmSwift

class TodoListViewController: UITableViewController {
    
    var selectedCategory: RealmCategory?  {
        didSet {
            loadItems()
        }
    }
    
    
    // var items: [Item] = []
    var items: Results<RealmItem>?
    
    let defaults = UserDefaults.standard
    
    // .doucmentationDirectory, .documentDirectory 차이점
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("items.plist")
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let realm = try! Realm()
    
    //    func decodeItems(dataArray: Data) -> [Item] {
    //        var result: [Item] = []
    //        do {
    //            result = try JSONDecoder().decode([Item].self, from: dataArray)
    //        } catch {
    //            print(error)
    //        }
    //        return result
    //    }
    //
    //    func encodeItems(itemArray: [Item]) -> Data? {
    //        var result: Data? = nil
    //        do {
    //            result = try JSONEncoder().encode(self.items)
    //        } catch {
    //            print(error)
    //        }
    //        return result
    //    }
    
    func saveItems() {
        //        do {
        //            try context.save()
        //        } catch {
        //            print(error)
        //        }
        //            do {
        //                let encoder = PropertyListEncoder()
        //                let data = try encoder.encode(items)
        //                try data.write(to: dataFilePath!)
        //            } catch {
        //                print(error)
        //            }
    }
    
    func saveItem(item: RealmItem) {
        do {
            try realm.write({
                realm.add(item)
            })
        } catch {
            print(error)
        }
    }
    
    func loadItems(where predicate: NSPredicate? = nil, orderBy sorter: NSSortDescriptor? = nil) {
        // database path
        // ~/Library/Developer/CoreSimulator/Devices/2CCE66B3-D7D2-44BE-B223-F24128A14440/data/Containers/Data/Application/48C450D7-0698-45E4-BDAF-0647E0CF202A/Library/Application Support
        
        // Realm
        // items = realm.objects(RealmItem.self)
        items = selectedCategory?.items.sorted(byKeyPath: "title", ascending: true)
        
        // DataBase
        // fetch all items
        //        let request: NSFetchRequest<Item> = Item.fetchRequest()
        //
        //        if let safeSorter = sorter {
        //            request.sortDescriptors = [safeSorter]
        //        }
        //
        //        var predicates: [NSPredicate] = [NSPredicate(format: "parentCategory.name MATCHES %@", selectedCategory!.name!)]
        //        if let safePredicate = predicate {
        //            predicates.append(safePredicate)
        //        }
        //        request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: predicates)
        //
        //        do {
        //            items = try context.fetch(request)
        //        } catch {
        //            print(error)
        //        }
        
        // FileSystem
        //            do {
        //                let data = try Data(contentsOf: dataFilePath!)
        //                let decoder = PropertyListDecoder()
        //                self.items = try decoder.decode([Item].self, from: data)
        //            } catch {
        //                print(error)
        //            }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(dataFilePath!)
        
        // Codable
        loadItems()
        
        // mine
        // if let jsonArray = defaults.data(forKey: "TodoList") {
        //     items = decodeItems(dataArray: jsonArray)
        // }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print(#function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // it doesnt call
        super.viewWillDisappear(animated)
        // mine
        //        if let jsonItems = encodeItems(itemArray: self.items) {
        //            self.defaults.set(jsonItems, forKey: "TodoList")
        //        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        return items.count
        return items?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 셀을 재사용하면서 셀의 속성을 같이 사용하는 경우가 발생한다.
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        //        let item = items[indexPath.row]
        //        cell.textLabel?.text = item.title
        //        cell.accessoryType = item.done ? .checkmark : .none
        if let item = items?[indexPath.row] {
            cell.textLabel?.text = item.title
            cell.accessoryType = item.done ? .checkmark : .none
        } else {
            cell.textLabel?.text = "Not added item yet"
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        items[indexPath.row].done = !items[indexPath.row].done
        
        if let item = items?[indexPath.row] {
            do {
                try realm.write({
                    item.done = !item.done
                    // realm.delete(item)
                })
            } catch {
                print(error)
            }
            // saveItem(item: item)
        }
        
        // let item = items.remove(at: indexPath.row)
        // delete method is temporary function
        // cause this delete function works item which is in context only
        // context.delete(item)
        
        // codable, database
        // saveItems()
        
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadData()
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField: UITextField?
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) {
            // what will happen once the user clicks the add item on our UIAlert
            uiAction in
            if let text = textField?.text {
                
                //                let item = Item(context: self.context)
                //                item.title = text
                //                item.done = false
                //                item.parentCategory = self.selectedCategory
                //
                //                self.items.append(item)
                
                if let currentCategory = self.selectedCategory {
                    do {
                        try self.realm.write({
                            let item = RealmItem()
                            item.title = text
                            item.done = false
                            item.createdAt = Date()
                            currentCategory.items.append(item)
                        })
                    } catch {
                        print(error)
                    }
                }

                self.tableView.reloadData()
                
                // codable, database
                // self.saveItems()
                
                // mine
                // if let jsonItems = self.encodeItems(itemArray: self.items) {
                //    self.defaults.set(jsonItems, forKey: "TodoList")
                // }
            }
        }
        
        alert.addAction(action)
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
        }
        present(alert, animated: true, completion: nil)
    }
}

// MARK - UISearchBarDelegate
extension TodoListViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        var predicate: NSPredicate? = nil
//        var sorter: NSSortDescriptor? = nil
        if let text = searchBar.text {
//            predicate = NSPredicate(format: "title CONTAINS[cd] %@", text)
//            sorter = NSSortDescriptor(key: "title", ascending: true)
            items = items?.filter("title CONTAINS[cd] %@", text).sorted(byKeyPath: "createdAt", ascending: true)
        }
        // loadItems(where: predicate, orderBy: sorter)
        tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            loadItems()
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
        tableView.reloadData()
    }
}
