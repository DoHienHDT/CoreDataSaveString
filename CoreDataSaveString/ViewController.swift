//
//  ViewController.swift
//  CoreDataSaveString
//
//  Created by dohien on 7/13/18.
//  Copyright © 2018 hiền hihi. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet weak var inputTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // hiển thị lên
        do {
            if let entity = try AppDelegate.context.fetch(Entity.fetchRequest()) as? [Entity] {
                inputTextField.text = entity.last?.name
                print(entity.count)
            }
        } catch  {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveDataToCoreData(_ sender: UIButton) {
        if inputTextField.text != "" {
            // tạo một ảnh chụp
            let entity = Entity(context: AppDelegate.context)
            entity.name = inputTextField.text
            AppDelegate.saveContext() 
        }
    }
}

