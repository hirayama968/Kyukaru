//
//  MenuViewController.swift
//  Kyukaru
//
//  Created by 平山秀昭 on 2018/09/02.
//  Copyright © 2018年 平山秀昭. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var menuitem = ["ホーム", "リスト", "マップ", "バス",  "クロエダイアモンド"]
    var transition = false

    @IBOutlet weak var menuView: UITableView!
    @IBOutlet weak var table: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.delegate = self
        table.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 配列「menuitem」の要素数
        return menuitem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルの型を作る
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "myCell")
        // セルに表示するテキストを作る
        cell.textLabel?.text = menuitem[indexPath.row]
        // セルをリターンする
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = indexPath.section
        let row = indexPath.row
        print("MenuViewController tableView section: \(section) row: \(row)")
        if row == 0 {
            UIView.animate(
                withDuration: 0.2,
                delay: 0,
                options: .curveEaseIn,
                animations: {
                    self.menuView.layer.position.x = -self.menuView.frame.width},
                completion: { bool in
                    self.dismiss(animated: true, completion: nil)})
        } else if row == 1 {
            transition = true
            performSegue(withIdentifier: "toListViewController", sender: nil)
        } else if row == 2 {
            transition = true
            performSegue(withIdentifier: "toMapViewController", sender: nil)
        } else if row == 3 {
            transition = true
            performSegue(withIdentifier: "toBusViewController", sender: nil)
        } else if row == 4 {
            transition = true
            performSegue(withIdentifier: "toWebViewController", sender: nil)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    override func viewWillAppear(_ animated: Bool) {
    if transition {
        // 「メニューエリア以外タップ時の処理」と同じ
        // ただし、dismissのanimatedはfalseに設定している
        UIView.animate(
            withDuration: 0.2,
            delay: 0,
            options: .curveEaseIn,
            animations: {
                self.menuView.layer.position.x = -self.menuView.frame.width},
            completion: { bool in
                self.dismiss(animated: false, completion: nil)})
    } else {
        super.viewWillAppear(animated)
        // メニューの位置を取得する
        let menuPos = self.menuView.layer.position
        // 初期位置を画面の外側にするため、メニューの幅の分だけマイナスする
        self.menuView.layer.position.x = -self.menuView.frame.width
        // 表示時のアニメーションを作成する
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            options: .curveEaseOut,
            animations: {
                self.menuView.layer.position.x = menuPos.x},
                completion: { bool in})
        }
    }
    
    // メニューエリア以外タップ時の処理
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        for touch in touches {
            if touch.view?.tag == 1 {
                UIView.animate(
                    withDuration: 0.2,
                    delay: 0,
                    options: .curveEaseIn,
                    animations: {
                        self.menuView.layer.position.x = -self.menuView.frame.width},
                    completion: { bool in
                        self.dismiss(animated: true, completion: nil)})
            }
        }
    }
    
}
