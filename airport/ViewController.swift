//
//  ViewController.swift
//  airport
//
//  Created by sean on 2017/5/28.
//  Copyright © 2017年 sean. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var contentTextView: UITextView!
//    var titleLabel: UILabel! {
//        return self.navigationItem.titleView as! UILabel
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateUIElements()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func updateUIElements() {
//        self.titleLabel.text = "title"
        self.contentTextView.text = "content"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

