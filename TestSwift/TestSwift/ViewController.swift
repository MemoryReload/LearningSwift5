//
//  ViewController.swift
//  TestSwift
//
//  Created by HePing on 14-10-10.
//  Copyright (c) 2014年 HePing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var tempView:UIView
    var btn,backBtn:UIButton
    
    required init?(coder aDecoder: NSCoder) {
        tempView=UIView()
        btn=UIButton()
        backBtn=UIButton()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tempView.frame=CGRect(x:0, y: 0, width: 100, height: 100)
        tempView.center=CGPoint(x: UIScreen.main.bounds.size.width-tempView.frame.size.width/2, y: tempView.frame.size.height/2)
        tempView.backgroundColor=UIColor.red
        tempView.layer.borderColor=UIColor.white.cgColor
        tempView.layer.borderWidth=10
        self.view.addSubview(tempView)
        
        
        btn.frame=CGRect(x: 0, y: 0, width: 80, height:60)
        btn.setTitle("go",for: UIControl.State.normal)
        btn.setTitleColor(UIColor.black,for: UIControl.State.normal)
        btn.backgroundColor=UIColor.green
        btn.addTarget(self, action:#selector(buttonClicked), for:UIControl.Event.touchUpInside)
        self.view .addSubview(btn)
        
        backBtn.frame = CGRect(x:UIScreen.main.bounds.size.width-80, y: UIScreen.main.bounds.size.height-60, width: 80, height: 60)
        backBtn.setTitle("goBack",for: UIControl.State.normal)
        backBtn.setTitleColor(UIColor.black,for: UIControl.State.normal)
        backBtn.backgroundColor=UIColor.green
        backBtn.addTarget(self, action:#selector(goBack), for:UIControl.Event.touchUpInside)
        backBtn.isUserInteractionEnabled=false
        self.view .addSubview(backBtn)
    }
    
    
    @objc func buttonClicked(sender:UIButton) {
        sender.isUserInteractionEnabled=false;
        self.backBtn.isUserInteractionEnabled=true
        
        
        let aPoint:CGPoint=CGPoint(x: self.tempView.frame.size.width/2, y: UIScreen.main.bounds.size.height-self.tempView.frame.size.height/2);
        
        let aLayer:CALayer=self.tempView.layer;
        
        UIView.animate(withDuration: 1, animations: { () -> Void in
            
            let thePath:CGMutablePath=CGMutablePath();
            thePath.move(to: aLayer.position)
            thePath.addCurve(to: aPoint, control1: CGPoint(x: aLayer.position.x-UIScreen.main.bounds.size.width*2.5, y: aLayer.position.y+UIScreen.main.bounds.size.height*1.0/3), control2: CGPoint(x: aLayer.position.x+UIScreen.main.bounds.size.width*1.5, y: aLayer.position.y+UIScreen.main.bounds.size.height*2.0/3))
            let theAnimation:CAKeyframeAnimation=CAKeyframeAnimation();
            theAnimation.path = thePath;
            theAnimation.duration=6.0;
            theAnimation.isRemovedOnCompletion=true;
            theAnimation.timingFunction=CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
            aLayer.add(theAnimation, forKey:"position");
            
            
            
            let colorAnimation:CAKeyframeAnimation=CAKeyframeAnimation()
            colorAnimation.values=[UIColor.yellow.cgColor as AnyObject,UIColor.black.cgColor as AnyObject,UIColor.green.cgColor as AnyObject,UIColor.cyan.cgColor as AnyObject]
            colorAnimation.keyTimes=[NSNumber(0.1),NSNumber(0.4),NSNumber(0.8),NSNumber(1.0)];
            //            colorAnimation.calculationMode=kCAAnimationPaced
            colorAnimation.duration=6
            colorAnimation.isRemovedOnCompletion=true;
            aLayer.add(colorAnimation, forKey:"backgroundColor")
            
            
            
            let borderAnimation:CAKeyframeAnimation=CAKeyframeAnimation()
            borderAnimation.values=[NSNumber(0),NSNumber(10),NSNumber(0),NSNumber(10)]
                        colorAnimation.keyTimes=[NSNumber(0.25),NSNumber(0.5),NSNumber(0.75),NSNumber(1.0)];
            borderAnimation.duration=6
//            borderAnimation.calculationMode=kCAAnimationPaced
            borderAnimation.isRemovedOnCompletion=true;
            aLayer.add(borderAnimation, forKey:"borderWidth")
        })
        
        self.tempView.backgroundColor=UIColor.cyan;
        self.tempView.layer.borderWidth=10
        self.tempView.layer.position=aPoint
    }
    
    @objc func goBack(sender:UIButton){
        sender.isUserInteractionEnabled=false;
        self.btn.isUserInteractionEnabled=true;
        self.tempView.center=CGPoint(x: UIScreen.main.bounds.size.width-tempView.frame.size.width/2, y: tempView.frame.size.height/2)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

