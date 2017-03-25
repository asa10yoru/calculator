//
//  ViewController.swift
//  calculator
//
//  Created by ぽんじゅうす on 2017/03/23.
//  Copyright © 2017年 asa10yoru. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    //テキスト・ラベル
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var in_note: UITextField!
    @IBOutlet weak var in_price: UILabel!
    @IBOutlet weak var out_note: UILabel!
    @IBOutlet weak var out_price: UILabel!
    
    //操作ボタン
    @IBAction func btn_back(sender: AnyObject) {
    }
    @IBAction func btn_entry(sender: AnyObject) {
    }
    @IBAction func btn_AC(sender: AnyObject) {
    }
    @IBAction func btn_x2(sender: AnyObject) {
    }
    @IBAction func btn_x3(sender: AnyObject) {
    }
    
    //数字ボタン
    @IBAction func btn_0(sender: AnyObject) {
    }
    @IBAction func btn_1(sender: AnyObject) {
    }
    @IBAction func btn_2(sender: AnyObject) {
    }
    @IBAction func btn_3(sender: AnyObject) {
    }
    @IBAction func btn_4(sender: AnyObject) {
    }
    @IBAction func btn_5(sender: AnyObject) {
    }
    @IBAction func btn_6(sender: AnyObject) {
    }
    @IBAction func btn_7(sender: AnyObject) {
    }
    @IBAction func btn_8(sender: AnyObject) {
    }
    @IBAction func btn_9(sender: AnyObject) {
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
    }
    
    // セルが削除が可能なことを伝えるメソッド
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath)-> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.Delete
    }
    
    // Delete ボタンが押された時に呼ばれるメソッド
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    }
    

}

