//
//  ViewController.swift
//  图片轮播器－swift
//
//  Created by zz on 16/2/28.
//  Copyright © 2016年 zz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var urls: [NSURL] = [NSURL]()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUrl()
        let loopView: LoopView = LoopView(urls: urls)

        loopView.frame = CGRect(x: 10, y: 40, width: 300, height: 200)
        view.addSubview(loopView)
        
        loopView.callBack = {selected in print("选中了\(selected)")}
    }

    private func loadUrl(){
    
        for i in 1..<4 {
          
            let path = NSBundle.mainBundle().pathForResource("0\(i)", ofType: "jpg")
            let url = NSURL(fileURLWithPath: path!)
            
            urls.append(url)
            
        }
        
    }


}


