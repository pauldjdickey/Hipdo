//
//  ViewController.swift
//  Hipdo
//
//  Created by Paul Dickey on 2/4/20.
//  Copyright © 2020 Paul Dickey. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    let itemArray = ["Apple", "Orange", "Banana"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //TableView DataSource Methods
    
    //How many rows of tables we need to create
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    //
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Identifier is the identifier of the cell and indexpath is the row the cell is made in, this line creates the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        //This line applies everything in the itemArray we created to the cell based on the location the cell is at (.row)
        cell.textLabel?.text = itemArray[indexPath.row]
        
        
        //This returns the cell as an output, which in this case will create a cell with the text label that is what is in our array
        return cell
    }
    //Tableview Delegate Methods - This function does stuff whenever we tap on a row
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //This prints the corresponding item of the array per the row we selected
        //print(itemArray[indexPath.row])
                
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark

        }
        
        
        //The following line makes it so selecting a row does not keep it highlighted, and only flashes it
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }


}

