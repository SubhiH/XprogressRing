//
//  ViewController.swift
//  XProgressRing
//
//  Created by Soubhi Hadri on 01/10/2017.
//  Copyright (c) 2017 Soubhi Hadri. All rights reserved.
//

import UIKit
import XProgressRing

class ViewController: UIViewController {

    @IBOutlet var xProgressRing: XProgressRing!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.view.frame)
        xProgressRing.addSeparableView(view: self.view);
        xProgressRing.startAnimation(ProgressMode: ProgressMode.quarterModeProgress);
        
//        xProgressRing.stopAnimation()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

