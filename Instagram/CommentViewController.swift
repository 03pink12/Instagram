//
//  CommentViewController.swift
//  Instagram
//
//  Created by mac on 2020/10/27.
//  Copyright © 2020 03pink12. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class CommentViewController: UIViewController {
    
    // 受け取るためのプロパティ（変数）を宣言しておく
    var postId = ""


    @IBOutlet weak var textField: UITextField!
    
    @IBAction func handleSubmitButton(_ sender: Any) {
        // コメントデータの保存場所を定義する
        let commentRef = Firestore.firestore().collection(Const.CommentPath).document()
        // HUDで投稿処理中の表示を開始
        SVProgressHUD.show()
        
        // FireStoreに投稿データを保存する
            let name = Auth.auth().currentUser?.displayName
            let commentDic = [
                "postId": postId,
                "name": name!,
                "comment": self.textField.text!,
                "date": FieldValue.serverTimestamp(),
                ] as [String : Any]
            commentRef.setData(commentDic)
            // HUDで投稿完了を表示する
            SVProgressHUD.showSuccess(withStatus: "投稿しました")
            // 投稿処理が完了したので先頭画面に戻る
           UIApplication.shared.windows.first{ $0.isKeyWindow }?.rootViewController?.dismiss(animated: true, completion: nil)
        
        
    }
    
    @IBAction func handleCancelButton(_ sender: Any) {
        // 画面を閉じる
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("取得ID：\(postId)")

        // Do any additional setup after loading the view.
    }

}
