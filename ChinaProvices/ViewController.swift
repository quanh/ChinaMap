//
//  ViewController.swift
//  ChinaProvices
//
//  Created by quanhai on 2017/5/16.
//  Copyright © 2017年 Quanhai. All rights reserved.
//

import UIKit




class ViewController: UIViewController {

    @IBOutlet weak var province: UILabel! // 省
    
    @IBOutlet weak var mapScrollView: UIScrollView! //
    
    var mapView: MapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.mapView = MapView.init(frame: CGRect.init(x: 0, y: 0, width: 600, height: 450))
        self.mapScrollView.contentSize = CGSize.init(width: 600, height: 450)
        self.mapScrollView.addSubview(self.mapView)
        
        self.mapView.provinceTap = {(outputText)->() in
            
            self.province.text = outputText
        }
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

