//
//  MapView.swift
//  ChinaProvices
//
//  Created by quanhai on 2017/5/16.
//  Copyright © 2017年 Quanhai. All rights reserved.
//

import UIKit

class MapView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    typealias recongizeCallback = (String) ->()
    var provinceTap: recongizeCallback?
    
    lazy var chinaLayer: CAShapeLayer = {
        let china = CAShapeLayer.init()
        china.fillColor = UIColor.clear.cgColor
        china.strokeColor = UIColor.lightGray.cgColor
        return china
    }()
    lazy var hubeiLayer: CAShapeLayer = {
        let hubei = CAShapeLayer.init()
        hubei.fillColor = UIColor.orange.cgColor
        return hubei
    }()
    lazy var henanLayer: CAShapeLayer = {
        let henan = CAShapeLayer()
        henan.fillColor = UIColor.blue.cgColor
        return henan
    }()
    lazy var shanxiLayer: CAShapeLayer = {
        let shanxi = CAShapeLayer()
        shanxi.fillColor = UIColor.red.cgColor
        return shanxi
    }()
    lazy var hunanLayer: CAShapeLayer = {
        let hunan = CAShapeLayer()
        hunan.fillColor = UIColor.purple.cgColor
        return hunan
    }()
    lazy var anhuiLayer: CAShapeLayer = {
        let anhui = CAShapeLayer()
        anhui.fillColor = UIColor.lightGray.cgColor
        return anhui
    }()
    
    lazy var mapPath: MapPath = {
        let path = MapPath.init()
        return path
    }()
    
    class func chinaMapView() ->MapView{
        
        let mapView: MapView = MapView.init(frame: CGRect.init(x: 0, y: 0, width: 600, height: 450))
        mapView.drawPaths()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action:#selector(self.tapMap(_ :)))
        mapView.addGestureRecognizer(tap)
        
        return mapView
    }
    override init(frame: CGRect){
        super.init(frame: frame)
        
        self.drawPaths()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action:#selector(self.tapMap(_ :)))
        self.addGestureRecognizer(tap)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    func drawPaths(){
        chinaLayer.path = mapPath.china.cgPath
        hubeiLayer.path = mapPath.hubei.cgPath
        henanLayer.path = mapPath.henan.cgPath
        shanxiLayer.path = mapPath.shanxi.cgPath
        hunanLayer.path = mapPath.hunan.cgPath
        anhuiLayer.path = mapPath.anhui.cgPath
        
        self.layer.addSublayer(chinaLayer)
        self.chinaLayer.addSublayer(hubeiLayer)
        self.layer.addSublayer(henanLayer)
        self.chinaLayer.addSublayer(shanxiLayer)
        self.layer.addSublayer(hunanLayer)
        self.chinaLayer.addSublayer(anhuiLayer)
    }
    
    func tapMap(_ gesture: UITapGestureRecognizer) {
        
        let touchPoint :CGPoint = gesture.location(in: self)
        var procvince: String = "其他区域"
        
        if mapPath.hubei.contains(touchPoint) {
            // hubei
            procvince = "湖北"
            self.callback(province: procvince)
            return
        }
        if mapPath.henan.contains(touchPoint){
            // henan
            procvince = "河南"
            self.callback(province: procvince)
            return
        }
        if mapPath.shanxi.contains(touchPoint){
            // shanxi 
            procvince = "陕西"
            self.callback(province: procvince)
            return
        }
        if mapPath.hunan.contains(touchPoint){
            // hunan
            procvince = "湖南"
            self.callback(province: procvince)
            return
        }
        if mapPath.anhui.contains(touchPoint){
            // anhui
            procvince = "安徽"
            self.callback(province: procvince)
            return
        }
        
        // else
        self.callback(province: procvince)
        
    }
    
    func callback(province: String){
        
        let outputString = ("点击了：" + province + "。")
        self.provinceTap!(outputString)
    }
}


