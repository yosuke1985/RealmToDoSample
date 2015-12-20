//
//  ViewController.swift
//  RealmTodoSample
//
//  Created by 中山 陽介 on 12/20/15.
//  Copyright © 2015 Yosuke Nakayama. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController{

    @IBOutlet weak var todoNameText: UITextField!
    @IBOutlet weak var myTableView: UITableView!
    
    var toDoItems:Results<ToDo>?{
        do{
            let realm = try Realm()
            return realm.objects(ToDo)
        }catch{
            print("エラー")
        }
        return nil
    }
    
    @IBAction func addToDo(sender: AnyObject) {
        // 入力チェック
//        if isValidateInputContents() == false{
//            return
//        }
        
        // ToDoデータを作成する処理
        let toDo = ToDo()
        toDo.name = todoNameText.text!
        
        // ToDoデータを永続化する処理
        do{
            let realm = try Realm()
            try realm.write{
                realm.add(toDo)
            }
            todoNameText.text = ""
        }catch{
            print("失敗")
        }
        myTableView.reloadData()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension ViewController: UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return toDoItems?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let toDo = toDoItems?[indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! ToDoTableViewCell
        // Realmに登録したデータをラベルに値設定
        cell.nameLabel.text = toDo?.name
        
        print(toDo?.name)
        
        return cell
    }
}

