//
//  CustomProgress.swift
//  CustomLoadingView
//
//  Created by Soubhi Hadri on 1/1/17.
//  Copyright © 2016 Soubhi Hadri. All rights reserved.
//

import UIKit

public enum ProgressMode {
    case fullModeProgress, halfModeProgress, quarterModeProgress
}

@IBDesignable
public class XProgressRing: UIView {
    
    @IBInspectable var radius: CGFloat=100 {
        didSet {
        }
    }
    @IBInspectable var progress_thinkness:CGFloat=0.2{
        didSet{
            
        }
    }
    
    @IBInspectable var progress_speed:CGFloat=0.6;
    @IBInspectable var progress_color:UIColor=UIColor.white;
    
    var progress1: KDCircularProgress!
    var progress2: KDCircularProgress!
    var progress3: KDCircularProgress!
    var progress4: KDCircularProgress!
    var separableView : UIView!;
    var isAnimating: Bool = false;
    
    
    
    required override public init(frame: CGRect) {
        super.init(frame: frame)
        }
    
    
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    func initialViews(){
        print(self.frame);
        
        self.isHidden = true;
        
       let pFrame = CGRect(x: 0, y: 0, width: radius, height: radius);
        
        self.layer.cornerRadius = radius/CGFloat(2.0)
        self.clipsToBounds = true
        
        progress1 = KDCircularProgress(frame: pFrame)
        progress1.startAngle = 0
        progress1.progressThickness = self.progress_thinkness
        progress1.trackThickness = self.progress_thinkness
        progress1.clockwise = false
        progress1.gradientRotateSpeed = 2
        progress1.roundedCorners = true
        progress1.glowMode = .forward
        progress1.glowAmount = 0.9
        progress1.set(colors: progress_color);
        progress1.trackColor = UIColor.clear

        
        progress2 = KDCircularProgress(frame: pFrame)
        progress2.startAngle = 90
        progress2.progressThickness = self.progress_thinkness
        progress2.trackThickness = self.progress_thinkness
        progress2.clockwise = false
        progress2.gradientRotateSpeed = 2
        progress2.roundedCorners = true
        progress2.glowMode = .forward
        progress2.glowAmount = 0.9
        progress2.set(colors: progress_color);
        progress2.trackColor = UIColor.clear
        
        progress3 = KDCircularProgress(frame: pFrame)
        progress3.startAngle = 180
        progress3.progressThickness = self.progress_thinkness
        progress3.trackThickness = self.progress_thinkness
        progress3.clockwise = false
        progress3.gradientRotateSpeed = 2
        progress3.roundedCorners = true
        progress3.glowMode = .forward
        progress3.glowAmount = 0.9
        progress3.set(colors: progress_color);
        progress3.trackColor =  UIColor.clear
        
        progress4 = KDCircularProgress(frame: pFrame)
        progress4.startAngle = 270
        progress4.progressThickness = self.progress_thinkness
        progress4.trackThickness = self.progress_thinkness
        progress4.clockwise = false
        progress4.gradientRotateSpeed = 2
        progress4.roundedCorners = true
        progress4.glowMode = .forward
        progress4.glowAmount = 0.9;
        progress4.trackColor = UIColor.clear;
        progress4.set(colors: progress_color);
        
        
    }
    
    private func addProgresses(progressMode:ProgressMode=ProgressMode.quarterModeProgress){
        initialViews()
        self.addSubview(progress1)
        if progressMode==ProgressMode.quarterModeProgress {
            self.addSubview(progress2)
            self.addSubview(progress3)
            self.addSubview(progress4)
        }else if progressMode==ProgressMode.halfModeProgress {
            self.addSubview(progress3)
        }else{
        }
        
    }
    
    func addSeparableView(view:UIView){
        separableView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height));
        separableView.center.x = view.center.x;
        separableView.center.y = view.center.y;
        separableView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2);
        view.addSubview(separableView);
        view.bringSubview(toFront: self)
    }
    
    
    func startAnimation(ProgressMode:ProgressMode=ProgressMode.quarterModeProgress){
        addProgresses(progressMode: ProgressMode)
        isAnimating = true;
        self.isHidden = false;
        animate(progressMode: ProgressMode);
    }
    
    func animate(progressMode:ProgressMode=ProgressMode.quarterModeProgress){
        if progressMode==ProgressMode.quarterModeProgress {
            self.progress1.animate(fromAngle:0, toAngle: 90, duration: TimeInterval(self.progress_speed)) { completed in
                if completed {
                    
                    if (!self.isAnimating){
                        return;
                    }
                    self.progress2.startAngle = 90
                    self.progress1.isHidden = true;
                    self.progress2.isHidden = false;
                    self.progress2.animate(fromAngle:0, toAngle: 90, duration: TimeInterval(self.progress_speed)) { completed in
                        if completed {
                            self.progress1.startAngle = 0
                            self.progress1.isHidden = false;
                            self.progress2.isHidden = true;
                        } else {
                        }
                    }
                    if !self.isAnimating{
                        return;
                    }
                    
                } else {
                }
            }
            
            
            self.progress3.animate(fromAngle:0, toAngle: 90, duration: TimeInterval(self.progress_speed)) { completed in
                if completed {
                    
                    if !self.isAnimating{
                        return;
                    }

                    self.progress4.startAngle = 270
                    self.progress3.isHidden = true;
                    self.progress4.isHidden = false;
                    self.progress4.animate(fromAngle:0, toAngle: 90, duration: TimeInterval(self.progress_speed)) { completed in
                        if completed {
                            self.progress3.startAngle = 180
                            self.progress4.isHidden = true;
                            self.progress3.isHidden = false;
                            self.animate(progressMode:ProgressMode.quarterModeProgress);
                        } else {
                        }
                    }
                    
                    if !self.isAnimating{
                        return;
                    }

                    
                    
                } else {
                }
            }

        }else if progressMode==ProgressMode.halfModeProgress {
            self.progress1.animate(fromAngle:0, toAngle: 180, duration: TimeInterval(self.progress_speed)) { completed in
                if completed {
                    
                    if (!self.isAnimating){
                        return;
                    }
                    
                    self.progress1.isHidden = true;
                    self.progress3.startAngle = 180
                    self.progress3.isHidden = false;
                    self.progress3.animate(fromAngle:0, toAngle: 180, duration: TimeInterval(self.progress_speed)) { completed in
                        if completed {
                            self.progress1.startAngle = 0
                            self.progress1.isHidden = false;
                            self.progress3.isHidden = true;
                            self.animate(progressMode: ProgressMode.halfModeProgress);
                        } else {
                        }
                    }
                    if !self.isAnimating{
                        return;
                    }
                    
                } else {
                }
            }
            
        }else{
            self.progress1.animate(fromAngle:0, toAngle: 360, duration: TimeInterval(self.progress_speed)) { completed in
                if completed {
                    self.progress1.startAngle=0;
                    self.animate(progressMode: ProgressMode.fullModeProgress);
                } else {
                }
            }
        }
        
        
        
        
        
    }
    
    private func animateProgresses(progress1:KDCircularProgress,progress2:KDCircularProgress,toAngle:Double){
        progress1.animate(fromAngle:0, toAngle: toAngle, duration: TimeInterval(self.progress_speed)) { completed in
            if completed {
                
                if (!self.isAnimating){
                    return;
                }
                
                progress1.isHidden = true;
                progress2.isHidden = false;
                progress2.animate(fromAngle:0, toAngle: toAngle, duration: TimeInterval(self.progress_speed)) { completed in
                    if completed {
                        progress1.isHidden = false;
                        progress2.isHidden = true;
//                        self.animate();
                        self.animateProgresses(progress1: self.progress1,progress2: self.progress2,toAngle: 90);
                        self.animateProgresses(progress1: self.progress3,progress2: self.progress4,toAngle: 90);

                    } else {
                    }
                }
                if !self.isAnimating{
                    return;
                }
                
            } else {
                self.animateProgresses(progress1: self.progress1,progress2: self.progress2,toAngle: 90);
                self.animateProgresses(progress1: self.progress3,progress2: self.progress4,toAngle: 90);
            }
        }
    }
    
    func stopAnimation(){
        isAnimating = false;
        self.isHidden = true;
    }
    
}
