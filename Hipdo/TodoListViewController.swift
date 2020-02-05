//
//  ViewController.swift
//  Hipdo
//
//  Created by Paul Dickey on 2/4/20.
//  Copyright © 2020 Paul Dickey. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = ["Apple", "Orange", "Banana"]

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
    
    //SECTION - Add New Items Section
    
    //User presses add+ button
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        //This has to be created so all parts of the func can access it
        var textField = UITextField()
        
        //This creates a constant called alert that sets the details for the new alert panel
        let alert = UIAlertController(title: "Add New Todo", message: "", preferredStyle: .alert)
        
        //This creates a constant called action that sets the details for the button that is placed to complete the alert constant above
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            //What will happen once the user clicks the add item button on our UI alert
            print(textField.text!)
            print("Success")
            
            self.itemArray.append(textField.text!)
            self.tableView.reloadData()
        }
        
        //This adds a text field the user can input and outputs whatever they put in to text
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        //This adds the action to our alert UI
        alert.addAction(action)
        
        //This will actually present our alert to the user
        present(alert, animated: true, completion: nil)
    }
    

}

