//
//  ViewController.swift
//  calculator
//
//  Created by ぽんじゅうす on 2017/03/23.
//  Copyright © 2017年 asa10yoru. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    //テキスト・ラベル
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var in_note: UITextField!
    @IBOutlet weak var in_price: UILabel!
    @IBOutlet weak var out_note: UILabel!
    @IBOutlet weak var out_price: UILabel!
 
    // Realmインスタンスを取得する
    let realm = try! Realm()
    //フラグなど
    var onOff : Bool = true
    var total : Int = 0
    var task:Task!
    
    //操作ボタン
    @IBAction func btn_back(sender: AnyObject) {
    }
    @IBAction func btn_entry(sender: AnyObject) {
        tableView.reloadData()
    }
    @IBAction func btn_AC(sender: AnyObject) {
    }
    @IBAction func btn_x2(sender: AnyObject) {
    }
    @IBAction func btn_x3(sender: AnyObject) {
    }
    
    //数字ボタン
    @IBAction func btn_0(sender: AnyObject) {
        if total == 0 {
            total = 0
        } else {
            total = (total * 10)
        }
        print(total)
    }
    @IBAction func btn_1(sender: AnyObject) {
        if total == 0 {
            total = 1
        } else {
            total = (total * 10) + 1
        }
        print(total)
    }
    @IBAction func btn_2(sender: AnyObject) {
        if total == 0 {
            total = 2
        } else {
            total = (total * 10) + 2
        }
        print(total)
    }
    @IBAction func btn_3(sender: AnyObject) {
        if total == 0 {
            total = 3
        } else {
            total = (total * 10) + 3
        }
        print(total)
    }
    @IBAction func btn_4(sender: AnyObject) {
        if total == 0 {
            total = 4
        } else {
            total = (total * 10) + 4
        }
        print(total)
    }
    @IBAction func btn_5(sender: AnyObject) {
        if total == 0 {
            total = 5
        } else {
            total = (total * 10) + 5
        }
        print(total)
    }
    @IBAction func btn_6(sender: AnyObject) {
        if total == 0 {
            total = 6
        } else {
            total = (total * 10) + 6
        }
        print(total)
    }
    @IBAction func btn_7(sender: AnyObject) {
        if total == 0 {
            total = 7
        } else {
            total = (total * 10) + 7
        }
        print(total)
    }
    @IBAction func btn_8(sender: AnyObject) {
        if total == 0 {
            total = 8
        } else {
            total = (total * 10) + 8
        }
        print(total)
    }
    @IBAction func btn_9(sender: AnyObject) {
        if total == 0 {
            total = 9
        } else {
            total = (total * 10) + 9
        }
        print(total)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: UITableViewDataSourceプロトコルのメソッド
    // データの数（＝セルの数）を返すメソッド
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    // 各セルの内容を返すメソッド
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // 再利用可能な cell を得る
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
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
    }
    
    func dismissKeyboard(){
        // キーボードを閉じる
        view.endEditing(true)
    }
    
    
}

