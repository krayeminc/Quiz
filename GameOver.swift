//
//  GameOver.swift
//  Quiz
//
//  Created by S on 05/03/2016.
//  Copyright © 2016 KrayemApps. All rights reserved.
//

import Foundation
import UIKit


class GameOver: UIViewController, HZIncentivizedAdDelegate , HZAdsDelegate{

    
    @IBOutlet var dredtofree: NSLayoutConstraint!
    @IBOutlet var dredToBoarder: NSLayoutConstraint!


    var pay = Int()
    var coins = Int()
    var QuestionSaved = Int()
    var hasBeenThrough = Bool()
    
    let defaults = UserDefaults()

    
    @IBOutlet var lifeText: UILabel!
    var lifeNum = Int()

    
    @IBOutlet var coinsText: UILabel!
    
    @IBOutlet var payCoinsButton: UIButton!
    
    let money = "\u{1F4B0}"
    let heart = "\u{2764}"

    
    @IBOutlet var quit: UIButton!
    @IBOutlet var videoButton: UIButton!
    
    @IBOutlet var outOfLives: UILabel!
    @IBOutlet var questionsRemainingMes: UILabel!
    @IBOutlet var carryOnFree: UILabel!
    @IBOutlet var CarryOn: UILabel!
    
    var noOfTimesPaid = Int()
    var questionsRemaing = [String]()

    //var questionsRemaing = []
    
    var hasWatched = Bool()
    
    var failCheck = Bool()
    
    var completedGame = Bool()
    
    var hasFunnyShow = Bool()
    
    var didWatchAd = Bool()

    func GoBackToQuiz(){
    
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        
        let vc: ViewController = storyboard.instantiateViewController(withIdentifier: "view") as! ViewController
        
        vc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        
        
        self.present(vc, animated: true, completion: nil)
    
    }
    

    


    override func viewDidLayoutSubviews() {
        
        
        
        if DeviceType.IS_IPAD_PRO{
            
            
            outOfLives.frame = CGRect(x: 407, y: 28, width: 210, height: 49)
            outOfLives.font = outOfLives.font.withSize(40)
            
            questionsRemainingMes.frame = CGRect(x: 233, y: 130, width: 558, height: 88)
            questionsRemainingMes.font = questionsRemainingMes.font.withSize(40)
            
            CarryOn.font = CarryOn.font.withSize(41)

            
            if(hasWatched != true){
                
                payCoinsButton.frame = CGRect(x: 587, y: 356, width: 380, height: 380)
                CarryOn.frame = CGRect(x: 695, y: 286, width: 165, height: 62)
                
                
            }else{
                
                payCoinsButton.frame = CGRect(x: view.bounds.width*0.5, y: 356, width: 380, height: 380)
                CarryOn.frame = CGRect(x: view.bounds.width*0.5, y: 286, width: 165, height: 62)
                                
                
            }
            
            
            payCoinsButton.titleLabel!.font = UIFont(name: "Noteworthy", size: 35)
            quit.titleLabel!.font = UIFont(name: "Noteworthy", size: 36)
            
            
            
            videoButton.frame = CGRect(x: 51, y: 356, width: 380, height: 380)
            
            
            carryOnFree.frame = CGRect(x: 123, y: 286, width: 236, height: 62)
            carryOnFree.font = carryOnFree.font.withSize(41)
            
            
            quit.frame = CGRect(x: 51, y: 1092, width: 916, height: 89)
            
            lifeText.frame = CGRect(x: 51, y: 877, width: 63, height: 21)
            coinsText.frame = CGRect(x: 638, y: 874, width: 90, height: 28)
            
            coinsText.frame = CGRect(x: 847,y: 1190, width: 141,height: 34)
            lifeText.frame = CGRect(x: 60, y: 1190, width: 99,height: 34 )
            
            lifeText.font = lifeText.font.withSize(30)
            coinsText.font = coinsText.font.withSize(30)
            
            
        }
        
        
        
        if  DeviceType.IS_IPAD{
            

            outOfLives.frame = CGRect(x: 280, y: 20, width: 208, height: 57)
            outOfLives.font = outOfLives.font.withSize(40)
        
            questionsRemainingMes.frame = CGRect(x: 105, y: 85, width: 538, height: 88)
            questionsRemainingMes.font = questionsRemainingMes.font.withSize(30)

            if(hasWatched != true){
            
                payCoinsButton.frame = CGRect(x: 427, y: 284, width: 280, height: 280)
                CarryOn.frame = CGRect(x: 498, y: 228, width: 138, height: 56)

                CarryOn.font = CarryOn.font.withSize(35)


                
            }else{
                
                payCoinsButton.frame = CGRect(x: view.bounds.width*0.5, y: 284, width: 280, height: 280)
                CarryOn.frame = CGRect(x: view.bounds.width*0.5, y: 228, width: 138, height: 56)


                
                
            }
            
            
            payCoinsButton.titleLabel!.font = UIFont(name: "Noteworthy", size: 30)
            quit.titleLabel!.font = UIFont(name: "Noteworthy", size: 23)


            
            videoButton.frame = CGRect(x: 61, y: 284, width: 280, height: 280)
            
            
            carryOnFree.frame = CGRect(x: 96, y: 228, width: 211, height: 56)
            carryOnFree.font = carryOnFree.font.withSize(35)

            
            quit.frame = CGRect(x: 51, y: 788, width: 666, height: 78)
            
            lifeText.frame = CGRect(x: 51, y: 877, width: 63, height: 21)
            coinsText.frame = CGRect(x: 638, y: 874, width: 90, height: 28)
            

            lifeText.font = lifeText.font.withSize(23)
            coinsText.font = coinsText.font.withSize(23)



            
        }
        
        
        if hasWatched == true{
            
            videoButton.isHidden = true
            carryOnFree.isHidden = true
            CarryOn.center = CGPoint(x: view.bounds.width*0.5, y: CarryOn.center.y)
            payCoinsButton.center = CGPoint(x: view.bounds.width*0.5, y: payCoinsButton.center.y)
            
        }
        

    }
    
    
    
    

    override func viewDidLoad() {
    questionsRemaing = []

        
        didWatchAd = false
        
        hasWatched = defaults.bool(forKey: "watched")

        completedGame = defaults.bool(forKey: "completedGame")
        hasFunnyShow = defaults.bool(forKey: "Funny")


        

        let options = HZBannerAdOptions()
        HZBannerAd.placeBanner(in: self.view, position: HZBannerPosition.bottom, options:options, success: {
            (banner) in
            }, failure: {
                (error) in print("Error is \(error)")
            }
        )

        QuestionSaved = defaults.integer(forKey: "highScoreSaved")

        let remaining = 20 - (QuestionSaved - 1)
        questionsRemaing = ["you have \(remaining) question remaining ","so close, you have \(remaining) questions remaining"]
        
        
        if (remaining <= 20 && remaining >= 10){
            questionsRemainingMes.text = questionsRemaing[0] as? String
        }else{
            questionsRemainingMes.text = questionsRemaing[1] as? String
        }

        quit.isExclusiveTouch = true
        payCoinsButton.isExclusiveTouch = true
        videoButton.isExclusiveTouch = true
        
        
        HZIncentivizedAd.setDelegate(self)
        
        
        noOfTimesPaid = defaults.integer(forKey: "no.Paid")
        
        hasBeenThrough = defaults.bool(forKey: "hasBeen")
        
        hasBeenThrough = true
        
        
        defaults.set(hasBeenThrough, forKey: "hasBeen")
        
        
        pay = 200 * noOfTimesPaid;

       coins = defaults.integer(forKey: "coins")
        
        
        if completedGame == true{
            coins = pay + 100
            coinsText.text = "\(money) ∞"

            
        }else{
        
        coinsText.text = "\(money) \(coins)"
        }
        
        
        
        lifeText.text = "\(heart) \(lifeNum)"
        
        payCoinsButton.setTitle("\(money) \(pay)", for: UIControlState())
        
        
        

    }
    
    
    @IBAction func Quit(_ sender: AnyObject) {
        
        let vc: LevelSelect = storyboard!.instantiateViewController(withIdentifier: "levs") as! LevelSelect
        
        vc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        
        
        self.present(vc, animated: true, completion: nil)
        QuestionSaved = 0
        defaults.set(QuestionSaved, forKey: "highScoreSaved")
        
    }
    
    
    
    @IBAction func PayCoins(_ sender: AnyObject) {
        
        print("coins:\(coins)")
        print("pay:\(pay)")
        
        if  coins >= pay {
            
            coins = coins - pay
            
            defaults.set(coins, forKey: "coins")
            
            
            if completedGame == true{
                coinsText.text = "\(money) ∞"

                
            }else{
                coinsText.text = "\(money) \(coins)"
            }
            
            lifeText.text = "\(heart) \(lifeNum)"
            

            
            noOfTimesPaid = noOfTimesPaid*2
            defaults.set(noOfTimesPaid, forKey: "no.Paid")
            
            
             GoBackToQuiz()
            
            
        } else{

            
            
            // create the alert
            
            let alert = UIAlertController(title: "Error", message: "you need \(-(coins - pay)) more coins, answer more questions to earn coins", preferredStyle: UIAlertControllerStyle.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            // show the alert
            
            self.present(alert, animated: true, completion: nil)

            
        }
    }
    
    

    
    @IBAction func VideoAd(_ sender: AnyObject) {
    
        
        let options:HZShowOptions = HZShowOptions()
        options.viewController = self
        HZIncentivizedAd.show(with: options)
        //HZIncentivizedAd.fetch()
        
    }
    
    func didCompleteAd(withTag tag: String!) {

        
        didWatchAd = true
        
        
    }
    
    func didHideAd(withTag tag: String!) {
        
        
     
        if didWatchAd == true{
     defaults.set(true, forKey: "watched")


        GoBackToQuiz()
        }
     
     }
    
    
    func didFailToShowAd(withTag tag: String!, andError error: NSError!) {
        let alert = UIAlertController(title: "Error", message: "No video available, please try again later ", preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
 

}
