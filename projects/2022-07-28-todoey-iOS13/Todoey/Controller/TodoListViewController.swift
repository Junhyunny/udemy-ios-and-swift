//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var items: [Item] = []
    
    let defaults = UserDefaults.standard
    
    func decodeItems(dataArray: Data) -> [Item] {
        var result: [Item] = []
        do {
            result = try JSONDecoder().decode([Item].self, from: dataArray)
        } catch {
            print(error)
        }
        return result
    }
    
    func encodeItems(itemArray: [Item]) -> Data? {
        var result: Data? = nil
        do {
            result = try JSONEncoder().encode(self.items)
        } catch {
            print(error)
        }
        return result
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("items.plist")
        
        print(dataFilePath)
        
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
        if let jsonItems = encodeItems(itemArray: self.items) {
            self.defaults.set(jsonItems, forKey: "TodoList")
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 셀을 재사용하면서 셀의 속성을 같이 사용하는 경우가 발생한다.
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let item = items[indexPath.row]
        cell.textLabel?.text = item.title
        cell.accessoryType = item.done ? .checkmark : .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        items[indexPath.row].done = !items[indexPath.row].done
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
                let item = Item()
                item.title = text
                self.items.append(item)
                self.tableView.reloadData()
                
                do {
                    let encoder = PropertyListEncoder()
                    let data = try encoder.encode(self.items)
                } catch {
                    print(error)
                }
                
                
                
                
                
                // mine
                //                if let jsonItems = self.encodeItems(itemArray: self.items) {
                //                    self.defaults.set(jsonItems, forKey: "TodoList")
                //                }
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
