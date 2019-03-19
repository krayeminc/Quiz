//
//  Launch.swift
//  Viral Quiz
//
//  Created by S on 16/06/2016.
//  Copyright © 2016 KrayemApps. All rights reserved.
//

import Foundation
import UIKit


class Launch: UIViewController{

    
    
    override func viewDidLoad() {
        
        let newView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        newView.backgroundColor = UIColor.redColor()
        newView.translatesAutoresizingMaskIntoConstraints = true
        view.addSubview(newView)
        
        newView.center = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
        newView.autoresizingMask = [UIViewAutoresizing.FlexibleLeftMargin, UIViewAutoresizing.FlexibleRightMargin, UIViewAutoresizing.FlexibleTopMargin, UIViewAutoresizing.FlexibleBottomMargin]
        
        

    }


}