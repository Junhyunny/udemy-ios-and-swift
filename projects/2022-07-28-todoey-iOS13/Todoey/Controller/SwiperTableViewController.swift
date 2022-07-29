//
//  SwiperTableViewController.swift
//  Todoey
//
//  Created by JUNHYUN KANG on 2022/07/30.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift
import SwipeCellKit

class SwiperTableViewController: UITableViewController {
    
    func deleteCell(indexPath: IndexPath) {}
}

extension SwiperTableViewController: SwipeTableViewCellDelegate {
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        // from the right
        guard orientation == .right else {
            return nil
        }
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { swipeAction, indexPath in
            self.deleteCell(indexPath: indexPath)
        }
        return [deleteAction]
    }
}
