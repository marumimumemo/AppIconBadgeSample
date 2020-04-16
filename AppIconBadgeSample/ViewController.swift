//
//  ViewController.swift
//  AppIconBadgeSample
//
//  Created by satoshi.marumoto on 2020/04/16.
//  Copyright © 2020 satoshi.marumoto. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // アプリ初期表示時にバッジ付与の許可を求める (初回はココでユーザに許可を得るダイアログが表示される)
        UNUserNotificationCenter.current().requestAuthorization(options: .badge) { (granted, eror) in
            if granted {
                print("許可 OK")
            }
            else {
                print("許可 NG")
            }
        }
    }
    
    // バッジの数を変更する
    @IBAction func badgeNumberChangeButtonTapped(_ sender: Any) {
        // 警告回避のためメインスレッドで実行
        DispatchQueue.main.async {
            // バッジの数をインクリメントする
            UIApplication.shared.applicationIconBadgeNumber += 1
        }
    }
    
    // リセットボタンバッジの数を0 (非表示) に変更
    @IBAction func resetButtonTapped(_ sender: Any) {
        DispatchQueue.main.async {
            // 0 を代入するとバッジが消える
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
    }
}
