//
//  WebViewController.swift
//  Kyukaru
//
//  Created by 平山秀昭 on 2018/09/03.
//  Copyright © 2018年 平山秀昭. All rights reserved.
//

import UIKit
import WebKit

class WebViewController : UIViewController {
    
    var kuroediamond = "http://www.geocities.jp/hirayama968/"
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let link = kuroediamond
        let url = URL(string: link)
        let request = URLRequest(url: url!)
        self.webView.load(request)
    }
    
}
