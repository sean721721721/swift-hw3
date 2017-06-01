//
//  AirportViewController.swift
//  airport
//
//  Created by sean on 2017/5/28.
//  Copyright © 2017年 sean. All rights reserved.
//
import UIKit



class AirportViewController: UIViewController {
    static var image: String = ""
    static var airport_Content : String = ""
    static var airport_Country : String = ""
    static var airport_City : String = ""
    
//    var imageNo = image
//    var airportContent : String = airport_Content
    var myTextViewTop: UITextView!
    var myTextViewBot: UITextView!
//    var title = UILabel(withIdentifier: "contentTitle")
    //print("imageNo = \(imageNo)")
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = AirportViewController.image
        let fullScreenSize = UIScreen.main.bounds.size

        // 使用 UITextView(frame:) 建立一個 UITextView
        myTextViewTop = UITextView(frame: CGRect(x: 0, y: 0, width: fullScreenSize.width , height: 200))
        
        // 文字顏色
        myTextViewTop.textColor = UIColor.black
        
        // 文字字型及大小
        myTextViewTop.font = UIFont(name: "Helvetica-Light", size: 40)
        
        // 文字向左對齊
        myTextViewTop.textAlignment = .left
        
        // 預設文字內容
        myTextViewTop.text = AirportViewController.airport_Content
        
        // 文字是否可以被編輯
        myTextViewTop.isEditable = false
        
        // 文字是否可以被選取
        myTextViewTop.isSelectable = true

        // 設置於畫面的中間偏上位置
        myTextViewTop.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.2)
        
        // 加入畫面
        self.view.addSubview(myTextViewTop)
        
       
        
        myTextViewBot = UITextView(frame: CGRect(x: 0, y: 0, width: fullScreenSize.width , height: 50))
        // 文字顏色
        myTextViewBot.textColor = UIColor.black
        
        // 文字字型及大小
        myTextViewBot.font = UIFont(name: "Helvetica-Light", size: 20)
        
        // 文字向左對齊
        myTextViewBot.textAlignment = .left
        
        // 預設文字內容
        myTextViewBot.text = " COUNTRY " + AirportViewController.airport_Country + "\n"
                           + "\t\t" + "CITY " + AirportViewController.airport_City
        
        // 文字是否可以被編輯
        myTextViewBot.isEditable = false
        
        // 文字是否可以被選取
        myTextViewBot.isSelectable = true
        
        // 設置於畫面的中間偏上位置
        myTextViewBot.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.4)
        
        // 加入畫面
        self.view.addSubview(myTextViewBot)

        
        //圖片
        // 使用 UIImageView(frame:) 建立一個 UIImageView
        let myImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 600, height: 300))
        
        // 使用 UIImage(named:) 放置圖片檔案
        myImageView.image = UIImage(named: "\(AirportViewController.image).jpg")
        // 設置新的位置並放入畫面中
        myImageView.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.7 )
        self.view.addSubview(myImageView)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
