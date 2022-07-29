//
//  CategoryViewControllerTableViewController.swift
//  Todoey
//
//  Created by JUNHYUN KANG on 2022/07/29.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {
    
    var categories: [Category] = []
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategories()
    }
    
    //MARK: - Data Manipulation Methods
    func saveCategories() {
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    
    func loadCategories() {
        let reqeust: NSFetchRequest<Category> = Category.fetchRequest()
        do {
            categories = try context.fetch(reqeust)
        } catch {
            print(error)
        }
    }
    
    //MARK: - Add New Categories

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField: UITextField?
        
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Category", style: .default) {
            uiAction in
            if let text = textField?.text {
                let category = Category(context: self.context)
                category.name = text
                self.categories.append(category)
                self.tableView.reloadData()
                self.saveCategories()
            }
        }
        
        alert.addAction(action)
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Create New Category"
            textField = alertTextField
        }
        present(alert, animated: true, completion: nil)
    }
    
    //MARK: - TableView DataSource Method
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        cell.textLabel?.text = categories[indexPath.row].name
        return cell
    }
    
    //MARK: - TableView Delegate Method
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("select \(indexPath.row) category")
        performSegue(withIdentifier: "goToItems", sender: self)
    }
}
