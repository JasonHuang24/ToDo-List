//
//  CompleteToDoViewController.swift
//  TodoList
//
//  Created by admin on 11/24/17.
//  Copyright © 2017 Jason Huang. All rights reserved.
//

import UIKit

class CompleteToDoViewController: UIViewController {
    
    var previousVC = ToDoTableViewController()
    var selectedToDo : ToDoCoreData?
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = selectedToDo?.name

    }

    @IBAction func completeTapped(_ sender: Any)
    {
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        {
            if let theToDo = selectedToDo
            {
                context.delete(theToDo)
                try? context.save()
                navigationController?.popViewController(animated: true)
            }
        }
    }
}
