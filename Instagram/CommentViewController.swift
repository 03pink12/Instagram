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

    @IBOutlet weak var textField: UITextField!
    
    @IBAction func handleSubmitButton(_ sender: Any) {
        
    }
    
    @IBAction func handleCancelButton(_ sender: Any) {
        // 画面を閉じる
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
