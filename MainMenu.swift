//
//  MainMenu.swift
//  Quiz
//
//  Created by S on 01/01/2016.
//  Copyright © 2016 KrayemApps. All rights reserved.
//

import Foundation
import UIKit



class MainMenu: UIViewController {

 
    
    @IBOutlet var quizLogo: UIImageView!
    var coins = Int()
    let defaults = UserDefaults()
    
    var hasFunnyShow = Bool()

    
    var completedGame = Bool()
    
    
    @IBOutlet var button1: UIButton!
    
    var comp5 = Bool()
    var comp15 = Bool()

    var dontShowAd = Bool()
    
    func isAppAlreadyLaunchedOnce()->Bool{
        let defaultsLaunce = UserDefaults.standard
        
        if let _ = defaultsLaunce.string(forKey: "isAppAlreadyLaunchedOnce"){
            print("App already launched")
            
            return true
        }else{
            defaultsLaunce.set(true, forKey: "isAppAlreadyLaunchedOnce")
            print("App launched first time")
            
            defaults.set(300, forKey: "coins")

            defaults.set(false, forKey: "comp5")
            defaults.set(false, forKey: "comp15")

            defaults.set(false, forKey: "completedGame")
            
            defaults.set(false, forKey: "Funny") 
            
            return false
        }
    }
    
    
    
    override func viewDidLayoutSubviews() {
        
        
        if DeviceType.IS_IPAD_PRO{
            
            quizLogo.frame = CGRect(x: 213, y: 28, width: 599, height: 448)
            
            button1.frame = CGRect(x: 60, y: 547, width: 903, height: 150)
            button1.titleLabel!.font = UIFont(name: "Noteworthy", size: 36)

        }
        
        if (DeviceType.IS_IPAD){
            
            button1.frame = CGRect(x: 51, y: 452, width: 666, height: 100)
            quizLogo.frame = CGRect(x: 138, y: 20, width: 493, height: 340)

            
        }
    }

    
    

    
    
    override func viewDidLoad() {
        
        
        dontShowAd = defaults.bool(forKey: "dont")
        defaults.set(true, forKey: "dont")



        comp5 = defaults.bool(forKey: "comp5")
        comp15 = defaults.bool(forKey: "comp15")

        hasFunnyShow = defaults.bool(forKey: "Funny")
        
        completedGame = defaults.bool(forKey: "completedGame")
        
        isAppAlreadyLaunchedOnce()
        
        coins = defaults.integer(forKey: "coins")

        
        
        let options = HZBannerAdOptions()
        HZBannerAd.placeBanner(in: self.view, position: HZBannerPosition.bottom, options:options, success: {
            (banner) in
            }, failure: {
                (error) in print("Error is \(error)")
            }
        )
        
        
    }
    
   
   @IBAction func ButtonPressed(_ sender: AnyObject) {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        
        let vc: LevelSelect = storyboard.instantiateViewController(withIdentifier: "levs") as! LevelSelect
        
        vc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve

        self.present(vc, animated: true, completion: nil)
    
        
    }
    

    
    
}
