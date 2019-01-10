//
//  PageViewController.swift
//  Kyukaru
//
//  Created by 平山秀昭 on 2018/09/04.
//  Copyright © 2018年 平山秀昭. All rights reserved.
//

import UIKit
import WebKit

class PageViewController : UIViewController {
    
    @IBOutlet weak var pageView: WKWebView!
    
    
    var link:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: self.link) {
            let request = URLRequest(url: url)
            self.pageView.load(request)
        }
    }
}
