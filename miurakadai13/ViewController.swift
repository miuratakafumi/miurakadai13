//
//  ViewController.swift
//  miurakadai13
//
//  Created by 三浦貴文 on 2023/07/10.
//

import UIKit

struct ChecklistItem {
    let name: String
    let isChecked: Bool
}

class ViewController: UIViewController, UITableViewDataSource {
    //アウトレットの作成
    @IBOutlet private weak var fruitsTableView: UITableView!
    //セルの配列を作成
    private let fruits = [
        ChecklistItem(name: "りんご", isChecked: false),
        ChecklistItem(name: "みかん", isChecked: true),
        ChecklistItem(name: "バナナ", isChecked: false),
        ChecklistItem(name: "パイナップル", isChecked: true),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // テーブルビューのデータソースを設定
        fruitsTableView.dataSource = self
    }
    
    //fruits配列の個数をカウント
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fruits.count
    }
    
    //セルに配列の値を表示
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FruitTableViewCell
        cell.fruitLabel.text = fruits[indexPath.row].name
        
        /*checkedFruits配列内にfruits配列と一致しているものがあるかどうか判定
         一致している場合はチェックマーク、そうでない場合は透明の画像を渡す*/
        if fruits[indexPath.row].isChecked {
            cell.checkmarkImageView.image = UIImage(systemName: "checkmark")
        } else {
            cell.checkmarkImageView.image = UIImage(named: "transparent")
        }
        return cell
    }
}
