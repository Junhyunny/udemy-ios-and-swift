//
//  CategoryViewControllerTableViewController.swift
//  Todoey
//
//  Created by JUNHYUN KANG on 2022/07/29.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import UIKit
//import CoreData
import RealmSwift
import SwipeCellKit

class CategoryViewController: UITableViewController {
    
    let realm = try! Realm()
    
    // var selectedCategory: Category?
    // var categories: [Category] = []
    // realm categories automatically updated
    var categories: Results<RealmCategory>?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategories()
    }
    
    //MARK: - Data Manipulation Methods
    func saveCategories() {
        //        do {
        //            try context.save()
        //        } catch {
        //            print(error)
        //        }
    }
    
    func saveCategory(category: RealmCategory) {
        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
            print(error)
        }
    }
    
    func loadCategories() {
        //        let reqeust: NSFetchRequest<Category> = Category.fetchRequest()
        //        do {
        //            categories = try context.fetch(reqeust)
        //        } catch {
        //            print(error)
        //        }
        categories = realm.objects(RealmCategory.self)
    }
    
    //MARK: - Add New Categories
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField: UITextField?
        
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Category", style: .default) {
            uiAction in
            if let text = textField?.text {
                // let category = Category(context: self.context)
                let category = RealmCategory()
                category.name = text
                // self.categories.append(category)
                // self.saveCategories()
                self.saveCategory(category: category)
                self.tableView.reloadData()
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
        return categories?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! SwipeTableViewCell
        cell.delegate = self
        cell.textLabel?.text = categories?[indexPath.row].name ?? "Not category added yet"
        return cell
    }
    
    //MARK: - TableView Delegate Method
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("select \(indexPath.row) category")
        // selectedCategory = categories[indexPath.row]
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToItems" {
            let controller = segue.destination as! TodoListViewController
            if let indexPath = tableView.indexPathForSelectedRow {
                controller.selectedCategory = categories?[indexPath.row]
            }
        }
    }
}

extension CategoryViewController: SwipeTableViewCellDelegate {
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        // from the right
        guard orientation == .right else {
            return nil
        }
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { swipeAction, indexPath in
            if let category = self.categories?[indexPath.row] {
                do {
                    try self.realm.write({
                        self.realm.delete(category)
                    })
                } catch {
                    print(error)
                }
                // self.loadCategories()
                self.tableView.reloadData()
            }
        }
        return [deleteAction]
    }
}
