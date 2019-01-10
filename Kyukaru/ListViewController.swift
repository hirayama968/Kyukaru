//
//  ListViewController.swift
//  Kyukaru
//
//  Created by 平山秀昭 on 2018/09/04.
//  Copyright © 2018年 平山秀昭. All rights reserved.
//

import UIKit

class ListViewController : UITableViewController {
    
    let sp = Spots()
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return sp.spots.count/4
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = sp.spots[indexPath.row * 4] as! String
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = self.tableView.indexPathForSelectedRow {
            let controller = segue.destination as! PageViewController
            controller.title = sp.spots[indexPath.row * 4] as! String
            controller.link = sp.spots[indexPath.row * 4 + 1] as! String
        }
    }
}
