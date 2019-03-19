//
//  Level Select.swift
//  Quiz
//
//  Created by S on 01/01/2016.
//  Copyright © 2016 KrayemApps. All rights reserved.
//

import Foundation
import UIKit



class LevelSelect: UIViewController, ADBannerViewDelegate {
    
    @IBOutlet var level1: UIButton!
    @IBOutlet var level2: UIButton!
    @IBOutlet var level3: UIButton!
    @IBOutlet var level4: UIButton!
    @IBOutlet var level5: UIButton!
    @IBOutlet var level6: UIButton!
    
    
    @IBOutlet var coinLabel: UILabel!
    let money = "\u{1F4B0}"

    var completedGame = Bool()

    
    var hasBeenThrough = Bool()

    
    var complete1 = Bool()
    var complete2 = Bool()
    var complete3 = Bool()
    var complete4 = Bool()
    var complete5 = Bool()
    
    @IBOutlet var levelSelectTitle: UILabel!
    
    var levelDetect = Int()
    
    
    let defaults = UserDefaults()
    
    var coins = Int()
    
    let lock = "\u{1F512}"
    
    var noOfTimesPaid = Int()

    var hasWatched = Bool()
    
    var divBy2 = Double()
    var dontShowAd = Bool()

    
    @IBOutlet var QperlevTitle: UILabel!

    
    
    override func viewDidLayoutSubviews() {
        

        if DeviceType.IS_IPAD_PRO{
            
            level1.frame = CGRect(x: 158, y: 138, width: 350, height: 350)
            level2.frame = CGRect(x: 516, y: 138, width: 350, height: 350)
            level3.frame = CGRect(x: 158, y: 496, width: 350, height: 350)
            level4.frame = CGRect(x: 516, y: 496, width: 350, height: 350)
            level5.frame = CGRect(x: 158, y: 854, width: 350, height: 350)
            level6.frame = CGRect(x: 516, y: 854, width: 350, height: 350)
            
            level1.titleLabel!.font = UIFont(name: "Noteworthy", size: 96)
            level2.titleLabel!.font = UIFont(name: "Noteworthy", size: 96)
            level3.titleLabel!.font = UIFont(name: "Noteworthy", size: 96)
            level4.titleLabel!.font = UIFont(name: "Noteworthy", size: 96)
            level5.titleLabel!.font = UIFont(name: "Noteworthy", size: 96)
            level6.titleLabel!.font = UIFont(name: "Noteworthy", size: 96)

            
            coinLabel.font = coinLabel.font.withSize(33)
            levelSelectTitle.font = levelSelectTitle.font.withSize(47)
            
            levelSelectTitle.frame = CGRect(x: 232, y: 28, width: 560, height: 48)
            QperlevTitle.frame = CGRect(x: 232, y: 94, width: 560, height: 31)
            QperlevTitle.font = QperlevTitle.font.withSize(21)

            
            coinLabel.frame = CGRect(x: 435, y: 1212, width: 164, height: 46)
        }
        
        
        if DeviceType.IS_IPAD  {
            
            
            level1.frame = CGRect(x: 133, y: 104, width: 250, height: 250)
            level2.frame = CGRect(x: 391, y: 104, width: 250, height: 250)
            level3.frame = CGRect(x: 133, y: 362, width: 250, height: 250)
            level4.frame = CGRect(x: 391, y: 362, width: 250, height: 250)
            level5.frame = CGRect(x: 133, y: 620, width: 250, height: 250)
            level6.frame = CGRect(x: 391, y: 620, width: 250, height: 250)
            
            coinLabel.font = coinLabel.font.withSize(23)
            levelSelectTitle.font = levelSelectTitle.font.withSize(40)

            coinLabel.frame = CGRect(x: 340, y: 878, width: 117, height: 37)
            


            level1.titleLabel!.font = UIFont(name: "Noteworthy", size: 70)
            level2.titleLabel!.font = UIFont(name: "Noteworthy", size: 70)
            level3.titleLabel!.font = UIFont(name: "Noteworthy", size: 70)
            level4.titleLabel!.font = UIFont(name: "Noteworthy", size: 70)
            level5.titleLabel!.font = UIFont(name: "Noteworthy", size: 70)
            level6.titleLabel!.font = UIFont(name: "Noteworthy", size: 70)

            
            
        }
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        divBy2 = defaults.double(forKey: "by2")

        
        print("test2 \(divBy2)")

        dontShowAd = defaults.bool(forKey: "dont")
        

        
        if dontShowAd == false && divBy2.truncatingRemainder(dividingBy: 4) == 0{
            
            
            // Later, such as after a level is completed
            let option = HZShowOptions()
            option.viewController = self // Only necessary if you're using multiple view controllers in your app
            HZVideoAd.show(with: option)
            HZVideoAd.fetch()
            
            divBy2 = divBy2 + 1
            defaults.set(divBy2, forKey: "by2")
            print("test2 \(divBy2)")

            

        }else{
            
            divBy2 = divBy2 + 1
            defaults.set(divBy2, forKey: "by2")
            print("test2 \(divBy2)")
            
            
        }
        
        
        if dontShowAd == true{
            divBy2 = 2
            defaults.set(2, forKey: "by2")

            dontShowAd = false
            defaults.set(false, forKey: "dont")
            
        }
    }
    
    
    override func viewDidLoad() {

        
        
        let options = HZBannerAdOptions()
        HZBannerAd.placeBanner(in: self.view, position: HZBannerPosition.bottom, options:options, success: {
            (banner) in
            }, failure: {
                (error) in print("Error is \(error)")
            }
        )
        
        
        
        
        hasWatched = defaults.bool(forKey: "watched")
        
        defaults.set(false, forKey: "watched")
        
        
        noOfTimesPaid = defaults.integer(forKey: "no.Paid")
        defaults.set(1, forKey: "no.Paid")
        
        
        level1.isExclusiveTouch = true
        level2.isExclusiveTouch = true
        level3.isExclusiveTouch = true
        level4.isExclusiveTouch = true
        level5.isExclusiveTouch = true
        level6.isExclusiveTouch = true

        
        completedGame = defaults.bool(forKey: "completedGame")

        
        
        complete1 = defaults.bool(forKey: "levelComplete1")
        complete2 = defaults.bool(forKey: "levelComplete2")
        complete3 = defaults.bool(forKey: "levelComplete3")
        complete4 = defaults.bool(forKey: "levelComplete4")
        complete5 = defaults.bool(forKey: "levelComplete5")
        
        
        level1.setTitle("1", for: UIControlState())
        level2.setTitle("2", for: UIControlState())

        level3.setTitle("3", for: UIControlState())
        level4.setTitle("4", for: UIControlState())
        level5.setTitle("5", for: UIControlState())
        level6.setTitle("?", for: UIControlState())


        
        if completedGame == true{
            
            level6.setBackgroundImage(UIImage(named: "LevelGApp.png"), for: UIControlState());

        }
        
        if complete1 == false {
            
            level2.setTitle(  "\(lock)" , for: UIControlState())
            
        }
        else{
            
            level1.setBackgroundImage(UIImage(named: "LevelGApp.png"), for: UIControlState());

        }
        
        if complete2 == false {
            
            level3.setTitle(  "\(lock)" , for: UIControlState())

            
        }
        else{
            
            level2.setBackgroundImage(UIImage(named: "LevelGApp.png"), for: UIControlState());
            
        }
        if complete3 == false {
            
            level4.setTitle("\(lock)", for: .normal)

            
            
        }
        else{
            
            level3.setBackgroundImage(UIImage(named: "LevelGApp.png"), for: UIControlState());
            
        }
        if complete4 == false {
            level5.setTitle(  "\(lock)" , for: UIControlState())

            
            
        }
        else{
            
            level4.setBackgroundImage(UIImage(named: "LevelGApp.png"), for: UIControlState());
            
        }
        
        if complete5 == false {
            
           level6.setTitle(  "\(lock)" , for: UIControlState())

            
        }
        else{
            
            level5.setBackgroundImage(UIImage(named: "LevelGApp.png"), for: UIControlState());
            
        }

        
        hasBeenThrough = defaults.bool(forKey: "hasBeen")
        
        hasBeenThrough = false
        
        
        defaults.set(hasBeenThrough, forKey: "hasBeen")

        
        coins = defaults.integer(forKey: "coins")
        
        
        levelDetect = defaults.integer(forKey: "detection")
        
        if completedGame == true{
            
            coinLabel.text = " \(money) ∞"

            
        }else{
        
        coinLabel.text = " \(money) \(coins) "
        }

    }
    
    
    func GoToQuiz(){
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc: ViewController = storyboard.instantiateViewController(withIdentifier: "view") as! ViewController
        vc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        
        
        self.present(vc, animated: true, completion: nil)
        
    }
    
    @IBAction func btn1Clicked(_ sender: AnyObject) {
        
        
        levelDetect = 1
        defaults.set(levelDetect, forKey: "detection")
        GoToQuiz()
        
        
    }
    
    
    @IBAction func btn2CLicked(_ sender: AnyObject) {
        
        if complete1 == true {
            
            
            levelDetect = 2
            defaults.set(levelDetect, forKey: "detection")
            
            GoToQuiz()
        }
        
        
    }
    
    
    @IBAction func btn3Clicked(_ sender: AnyObject) {
        
        
        if complete2 == true {
            
            
            levelDetect = 3
            defaults.set(levelDetect, forKey: "detection")
            
            GoToQuiz()
        }
        
    }
    
    
    @IBAction func btn4Clicked(_ sender: AnyObject) {
        
        
        if complete3 == true {
            
            
            levelDetect = 4
            defaults.set(levelDetect, forKey: "detection")
            GoToQuiz()
        }
        
    }
    
    
    @IBAction func btn5Clicked(_ sender: AnyObject) {
        
        
        if complete4 == true {
            
            
            levelDetect = 5
            defaults.set(levelDetect, forKey: "detection")
            
            GoToQuiz()
        }
        
    }
    
    
    
    @IBAction func btn6Clicked(_ sender: AnyObject) {

        
        if complete5 == true{
            
        defaults.set(true, forKey: "completedGame")
        
        let alert = UIAlertController(title: "Thank You For Playing", message: "For completing this quiz, you now have unlimited coins", preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
        
        level6.setBackgroundImage(UIImage(named: "LevelGApp.png"), for: UIControlState());
            coinLabel.text = " \(money) ∞"
            
        }

        

    }
    
    
}
