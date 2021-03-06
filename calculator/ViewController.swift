//
//  ViewController.swift
//  calculator
//
//  Created by ぽんじゅうす on 2017/03/23.
//  Copyright © 2017年 asa10yoru. All rights reserved.
//

import UIKit
import RealmSwift

extension String {
    func chopPrefix(count: Int = 1) -> String {
        return self.substringFromIndex(self.startIndex.advancedBy(count))
    }
    func chopSuffix(count: Int = 1) -> String {
        return self.substringToIndex(self.endIndex.advancedBy(-count))
    }
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    //テキスト・ラベル
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var in_note: UITextField!
    @IBOutlet weak var in_price: UILabel!
    @IBOutlet weak var out_note: UILabel!
    @IBOutlet weak var out_price: UILabel!

 
    // Realmインスタンスを取得する
    let realm = try! Realm()
    // DB内のタスクが格納されるリスト。
    // 日付近い順\順でソート：降順
    // 以降内容をアップデートするとリスト内は自動的に更新される。
    var taskArray = try! Realm().objects(Task).sorted("id", ascending: false)
    
    //フラグなど
    var onOff : Bool = true
    var myPrice : Int = 0
    var total : Int = 0
    var task:Task!
    
    //操作ボタン
    @IBAction func btn_back(sender: AnyObject) {
 //        let myCount = String(myPrice).characters.count
//        myPrice = String(myPrice).substringToIndex(myCount - 1)
//        print(myCount)
            in_price.text = in_price.text?.chopSuffix()
        myPrice = Int(in_price.text!)!
        print(myPrice)
    }
    @IBAction func btn_entry(sender: AnyObject) {
            try! realm.write {
                self.task = Task()
                if ( self.in_note.text! != "" ) {
                    self.task.note = self.in_note.text!
                }
                if ( self.in_price.text! != "" ) {
                    self.task.price = self.in_price.text!
                }
 //               task.id = taskArray.max("id")! + 1
                
                               if ( taskArray.count > 0 ) {
                    task.id = taskArray.max("id")! + 1
                }
                self.realm.add(self.task, update: true)
        }
        taskArray = try! Realm().objects(Task).sorted("id", ascending: false)
        tableView.reloadData()
        updateTotal()
    }
    @IBAction func btn_AC(sender: AnyObject) {
    }
    @IBAction func btn_x2(sender: AnyObject) {
    }
    @IBAction func btn_x3(sender: AnyObject) {
    }
    
        func updateTotal() {
            var totalprice = 0
            for i in 0 ..< taskArray.count {
                let task:Task = taskArray[i]
                totalprice += Int(task.price)!
            }
            print(totalprice)
            out_note.text = String.init(format: "%d", totalprice)
    }
    
    //数字ボタン
    @IBAction func btn_0(sender: AnyObject) {
        if myPrice == 0 {
            myPrice = 0
        } else {
            myPrice = (myPrice * 10)
        }
        in_price.text = String(myPrice)
        print(myPrice)
    }
    @IBAction func btn_1(sender: AnyObject) {
        if myPrice == 0 {
            myPrice = 1
        } else {
            myPrice = (myPrice * 10) + 1
        }
        in_price.text = String(myPrice)
        print(myPrice)
    }
    @IBAction func btn_2(sender: AnyObject) {
        if myPrice == 0 {
            myPrice = 2
        } else {
            myPrice = (myPrice * 10) + 2
        }
        in_price.text = String(myPrice)
        print(myPrice)
    }
    @IBAction func btn_3(sender: AnyObject) {
        if myPrice == 0 {
            myPrice = 3
        } else {
            myPrice = (myPrice * 10) + 3
        }
        in_price.text = String(myPrice)
        print(myPrice)
    }
    @IBAction func btn_4(sender: AnyObject) {
        if myPrice == 0 {
            myPrice = 4
        } else {
            myPrice = (myPrice * 10) + 4
        }
        in_price.text = String(myPrice)
        print(myPrice)
    }
    @IBAction func btn_5(sender: AnyObject) {
        if myPrice == 0 {
            myPrice = 5
        } else {
            myPrice = (myPrice * 10) + 5
        }
        in_price.text = String(myPrice)
        print(myPrice)
    }
    @IBAction func btn_6(sender: AnyObject) {
        if myPrice == 0 {
            myPrice = 6
        } else {
            myPrice = (myPrice * 10) + 6
        }
        in_price.text = String(myPrice)
        print(myPrice)
    }
    @IBAction func btn_7(sender: AnyObject) {
        if myPrice == 0 {
            myPrice = 7
        } else {
            myPrice = (myPrice * 10) + 7
        }
        in_price.text = String(myPrice)
        print(myPrice)
    }
    @IBAction func btn_8(sender: AnyObject) {
        if myPrice == 0 {
            myPrice = 8
        } else {
            myPrice = (myPrice * 10) + 8
        }
        in_price.text = String(myPrice)
        print(myPrice)
    }
    @IBAction func btn_9(sender: AnyObject) {
        if myPrice == 0 {
            myPrice = 9
        } else {
            myPrice = (myPrice * 10) + 9
        }
        in_price.text = String(myPrice)
        print(myPrice)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        
//        titleTextField.text = task.title
//        contentsTextView.text = task.contents
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: UITableViewDataSourceプロトコルのメソッド
    // データの数（＝セルの数）を返すメソッド
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }
    
    // 各セルの内容を返すメソッド
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            // 再利用可能な cell を得る
            let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
            
            // Cellに値を設定する.
            let task = taskArray[indexPath.row]
            cell.textLabel?.text = task.note
            cell.detailTextLabel?.text = task.price
            
            return cell
        }
    
    // MARK: UITableViewDelegateプロトコルのメソッド
    // 各セルを選択した時に実行されるメソッド
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if onOff == true {
            onOff = false
        } else {
            onOff = true
        }
        
    }
    
    // セルが削除が可能なことを伝えるメソッド
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath)-> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.Delete
    }
    
    // Delete ボタンが押された時に呼ばれるメソッド
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        // データベースから削除する
        try! realm.write {
            self.realm.delete(self.taskArray[indexPath.row])
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        }
    }
    
    func dismissKeyboard(){
        // キーボードを閉じる
        view.endEditing(true)
    }

    
}

