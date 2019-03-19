//
//  ViewController.swift
//  Quiz
//
//  Created by S on 24/10/2015.
//  Copyright © 2015 KrayemApps. All rights reserved.
//

import UIKit


enum UIUserInterfaceIdiom : Int
{
    case unspecified
    case phone
    case pad
}

struct ScreenSize
{
    static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

struct DeviceType
{
    static let IS_IPHONE_4_OR_LESS  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P         = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
    static let IS_IPAD              = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
    static let IS_IPAD_PRO          = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1366.0
}
struct Question {
    
    var question : String!
    var answers : [String]!
    var anwser : Int!
    
}

class ViewController: UIViewController {

    var hasBeenThrough = Bool()
    
    @IBOutlet var QLabel: UILabel!
    @IBOutlet var Buttons: [UIButton]!
    
    var QNumber = Int()
    
    var AnswerNumber = Int()
    
    
    @IBOutlet var Lives: UILabel!
    var lifeNum = Int()
    
    var QuestionSaved = Int()
    
    let defaults = UserDefaults()
    
    var Questions = [Question]()
    
    var coins = Int()
    
    var levelDetect = Int()
    
    var complete1 = Bool()
    var complete2 = Bool()
    var complete3 = Bool()
    var complete4 = Bool()
    var complete5 = Bool()

    @IBOutlet var QuestionLabel: UILabel!
    @IBOutlet var coinLabel: UILabel!

    var toAdd = Int()
    var displayNum:Int = 0
    
    var pay:Int = 100
    
    
    @IBOutlet var coinReward: UILabel!
    let c = "\u{1F60F}"
    let a = "\u{1F609}"
    let heart = "\u{2764}"
    let note = "\u{1F3B5}"
    let frog = "\u{1F438}"
    let cup = "\u{2615}"
    let money = "\u{1F4B0}"
    let lock = "\u{1F436}"
    let dog = "\u{F436}"
    let girl = "\u{1F467}"

 
    var timer1 = Timer()
    
    var comp5 = Bool()
    var comp15 = Bool()
    
    var completedGame = Bool()

    @IBOutlet var circleImage: UIImageView!
    @IBOutlet var buttonToText: NSLayoutConstraint!
    
    func lvl1(){
        Questions = [Question(question: "Cairo is the capital of which country", answers: ["Fiji","Kosovo","Egypt","Iceland "], anwser: 2),
                     Question(question: "Zagreb is the capital of which country", answers: ["Croatia","Costa Rica","Estonia","Fiji"], anwser: 0),
                     Question(question: "Tbilisi is the capital of which country", answers: ["Georgia","Gabon","Guatemala","Indonesia"], anwser: 0),
                     Question(question: "Santiago is the capital of which country?", answers: ["Cuba","Chile","Congo","Guatemala"], anwser: 1),
                     Question(question: "Tehran is the capital of which country?", answers: ["Iraq ","Kenya","Kosovo","Iran"], anwser: 3),
                     Question(question: "Buenos Aires is the capital of which country?", answers: ["Armenia","Argentina","Bolivia","Bermuda"], anwser: 1),
                     Question(question: "New Delhi is the capital of which country?", answers: ["Kygyzstan","Kuwait","New Guyana","India"], anwser: 3),
                     Question(question: "Pyongyang is the capital of which country?", answers: ["South Korea","Kosovo","North Korea","Hungary"], anwser: 2),
                     Question(question: "Kabul is the capital of which country?", answers: ["Andorra","Ukraine","Azerbaijan","Afganistan"], anwser: 3),
                     Question(question: "Reykjavik is the capital of which country?", answers: ["Iceland","Jamaica","Jordan","Kosovo"], anwser: 0)]
        
        
    }
    
    func lvl2(){
        
        
        Questions =    [Question(question: "Canberra is the capital of which country?", answers: ["Australia","Austria","Angola","Andorra"], anwser: 0),
                        Question(question: "Port-au-Prince is the capital of which country?", answers: ["Honduras","Haiti","Hungary","Eritrea"], anwser: 1),
                        Question(question: "Helsinki is the capital of which country?", answers: ["Finland","France","Georgia","Haiti"], anwser: 0),
                        Question(question: "Copenhagen is the capital of which country?", answers: ["Denmark","Norway","Netherlands","Latvia"], anwser: 0),
                        Question(question: "Tallinn is the capital of which country?", answers: ["Estonia","Lithuania","Equador","Chech Republic"], anwser: 0),
                        Question(question: "Kathmandu is the capital of which country?", answers: ["Chech Republic","Lithuania","Equador","Nepal"], anwser: 3),
                        Question(question: "Beirut is the capital of which country?", answers: ["Malta","Maldives","Latvia","Lebanon"], anwser: 3),
                        Question(question: "Ankara is the capital of which country?", answers: ["Vanuatu","Uganda","Turkey","Uruguay"], anwser: 2),
                        Question(question: "Lima is the capital of which country?", answers: ["Nicaragua","Panama","Peru","Paraguay"], anwser: 2),
                        Question(question: "Mogadishu is the capital of which country?", answers: ["Tanzania","Senegal","Somalia","Kenya"], anwser: 2)]
        
        
        
    }
    
    func lvl3() {
        
        Questions = [Question(question: "The Caspian Sea is NOT neighboured by which of the countries?", answers: ["Iran","Russia","Turkey","Kazakhstan"], anwser: 2),
                     Question(question: "Michigan-Huron lake is between these countries?", answers: ["Russia-China","Cuba-United States","Mexico-United States","Canada-United States"], anwser: 3),
                     Question(question: "Lake Victoria is NOT neighboured by this country?", answers: ["Tanzania","Democratic Republic of the Congo","Uganda","Kenya"], anwser: 1),//88
                     Question(question: "Lake Baikal is the deepest lake in the world. In which country is it?", answers: ["Russia","Canada","Hungary","Mongolia"], anwser: 0),
                     Question(question: "The Great Bear Lake is in which country?", answers: ["Canada","United States","Russia","South Africa"], anwser: 0),
                     Question(question: "The Great Slave Lake is in which country?", answers: ["Kazakhstan","Russia","Ivory Coast","Canada"], anwser: 3),
                     Question(question: "Ladoga is the largest lake in Europe. In which country is this?", answers: ["France","Russia","Poland","Germany"], anwser: 1),
                     Question(question: "Titicaca is one of the highest lakes in the world. Which country does neighbour it?", answers: ["Kenya","Peru","Nicaragua","Democratic Republic of the Congo"], anwser: 1),
                     Question(question: "Winnipegosis is a lake in which country?", answers: ["Canada","United States","Russia","Kazakhstan"], anwser: 0),
                     Question(question: "Great Salt Lake is in which country?", answers: ["United States","Canada","Russia","Kazakhstan"], anwser: 0)]
        
    }
    
    func lvl4() {
        
        Questions = [ Question(question: "Who invented the wireless remote control?", answers: ["Robert Adler","Frank Nesso","Alexandre Alexeieff","Ami Argand"], anwser: 0), //88
            Question(question: "Who invented the windshield wiper blade?", answers: ["Mary Anderson"," Mark Kemp","Vasily Andreyev","Alexandre Alexeieff"], anwser: 2),//88
            Question(question: "Who invented the FM radio?", answers: ["Edward Henrik Armstrong","Louis Theroux","Adam Anter","Edwin Howard Armstrong"], anwser: 3),
            Question(question: "Who invented the waterbed?", answers: ["Neil Arnott","Nelly Dickinson","Emma Holmstead","Carl Junggren"], anwser: 1)]
        
    }
    
    func lvl5() {
        
        
        Questions = [Question(question: "How many oscars did the Titanic movie got?", answers: ["3","11","25","1"], anwser: 1),
                     Question(question: "The Jets and the Sharks can be found in which Oscar winning movie?", answers: ["West Side Story.","Happy Feet.","In the Heat of the Night","Bridge on the River Kwai"], anwser: 0)]
    }

    
    func delay(_ delay:Double, closure:@escaping ()->()) {
        
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }
    
    
    func questionTravel (){

        QNumber = QuestionSaved
        displayNum = QNumber + 1
        
        if (( (displayNum == 5 && comp5 == false) || (displayNum == 15 && comp15 == false)) ) {
            
            if ((levelDetect == 1 && complete1 == false) || (levelDetect == 2 && complete2 == false) || (levelDetect == 3 && complete3 == false) || (levelDetect == 4 && complete4 == false || levelDetect == 5 && complete5 == false) ) {
                
                  toAdd = 50
                  defaults.set(coins + 50, forKey: "coins")

                
                coinReward.isHidden = false
                
                if(displayNum == 5){
                  defaults.set(true, forKey: "comp5")
                }

                if(displayNum == 15){
                    defaults.set(true, forKey: "comp15")
                    
                }
                
                
                
                delay(0.5){
                 self.timer1 = Timer(timeInterval: 1.0 / 30.0, target: self, selector: #selector(ViewController.hello), userInfo: nil, repeats: true)

                RunLoop.main.add(self.timer1, forMode:RunLoopMode.defaultRunLoopMode)
                
                }
                
            }
            
        }

        
        Buttons[0].setTitle(Questions[QNumber].answers[0], for: UIControlState())
        Buttons[1].setTitle(Questions[QNumber].answers[1], for: UIControlState())
        Buttons[2].setTitle(Questions[QNumber].answers[2], for: UIControlState())
        Buttons[3].setTitle(Questions[QNumber].answers[3], for: UIControlState())

        
        QuestionLabel.text = "\(displayNum)"
        
        
        QLabel.text = Questions[QNumber].question
        
        
        AnswerNumber = Questions[QNumber].anwser

        
        displayNum = displayNum + 1
        
        QuestionSaved = QuestionSaved + 1
        defaults.set(QuestionSaved, forKey: "highScoreSaved")
        
        
   
        
    }
    
    
    func win (){
        
        if levelDetect == 1 && complete1 == false{
            
            
            complete1 = true
            
            defaults.set(true, forKey: "levelComplete1")
            
            
            defaults.set(false, forKey: "comp5")
            defaults.set(false, forKey: "comp15")

        }
        
        
        if levelDetect == 2 && complete2 == false{
            
            
            complete2 = true
            
            defaults.set(true, forKey: "levelComplete2")
            
            
            defaults.set(false, forKey: "comp5")
            defaults.set(false, forKey: "comp15")

        }
        
        if levelDetect == 3 && complete3 == false{
            
            
            complete3 = true
            
            defaults.set(true, forKey: "levelComplete3")
            

            defaults.set(false, forKey: "comp5")
            defaults.set(false, forKey: "comp15")
            
        }
        
        if levelDetect == 4 && complete4 == false{
            
            
            complete4 = true
            
            defaults.set(true, forKey: "levelComplete4")


            defaults.set(false, forKey: "comp5")
            defaults.set(false, forKey: "comp15")
            
            
        }
        
        if levelDetect == 5 && complete5 == false{
            
            
            complete5 = true
            
            defaults.set(true, forKey: "levelComplete5")

            
        }

        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        
        let vc: LevelSelect = storyboard.instantiateViewController(withIdentifier: "levs") as! LevelSelect
        vc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve

        
        self.present(vc, animated: true, completion: nil)
        
        
    }

    
    func gameOver() {
     
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        
        let vc: GameOver = storyboard.instantiateViewController(withIdentifier: "over") as! GameOver
        vc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        
        self.present(vc, animated: true, completion: nil)
        
    }
    
    
    func wrong(){

        NSLog("wrong")
        lifeNum = lifeNum - 1
        
        Lives.text = "\(heart) \(lifeNum)"
        
        
        if lifeNum == 0 {

            gameOver()
        }
        
    }
    
    
    
    @objc func hello(){
        
        coinReward.isHidden = false


         if (self.toAdd != 0){
            
            self.coins += 1
            
            self.coinLabel.text = "\(self.money) \(self.coins)"
            
            self.toAdd -= 1
            
            self.coinReward.text = "+ \(self.money) \(self.toAdd)"

        }else{
            
                self.timer1.invalidate()
                self.coinReward.isHidden = true
            coinReward.text = "+ \(money) 50"
            
        }
        
    
    }

    

    override func viewDidLayoutSubviews() {
        
       if DeviceType.IS_IPAD_PRO{
        
        QLabel.frame = CGRect(x: 60, y: 88, width: 903, height: 291);
        
        Buttons[0].frame = CGRect(x: 60, y: 547, width: 903, height: 150)
        Buttons[1].frame = CGRect(x: 60, y: 705, width: 903, height: 150)
        Buttons[2].frame = CGRect(x: 60, y: 863, width: 903, height: 150)
        Buttons[3].frame = CGRect(x: 60, y: 1021, width: 903, height: 150)
        
        
        Buttons[0].titleLabel!.font = UIFont(name: "Noteworthy", size: 36)
        Buttons[1].titleLabel!.font = UIFont(name: "Noteworthy", size: 36)
        Buttons[2].titleLabel!.font = UIFont(name: "Noteworthy", size: 36)
        Buttons[3].titleLabel!.font = UIFont(name: "Noteworthy", size: 36)
        
        QLabel.font = QLabel.font.withSize(50)
        
        circleImage.frame = CGRect(x: circleImage.frame.origin.x, y: circleImage.frame.origin.y, width: 70, height: 70)
        QuestionLabel.frame = CGRect(x: circleImage.frame.origin.x, y: circleImage.frame.origin.y, width: 70, height: 70)
        
        QuestionLabel.font = QuestionLabel.font.withSize(30)

        
        coinLabel.frame = CGRect(x: 847,y: 1190, width: 141,height: 34)
        Lives.frame = CGRect(x: 60, y: 1190, width: 99,height: 34 )
        
        coinLabel.font = coinLabel.font.withSize(30)
        Lives.font = Lives.font.withSize(30)
        

        
        coinReward.frame = CGRect(x: 452, y: 426, width: 121, height: 48)
        coinReward.font = coinReward.font.withSize(30)
        
        }
        
        
        if DeviceType.IS_IPAD {
            
            
            QLabel.frame = CGRect(x: 0, y: 33, width: 788, height: 182);
            
            Buttons[0].frame = CGRect(x: 51, y: 425, width: 666, height: 100)
            Buttons[1].frame = CGRect(x: 51, y: 538, width: 666, height: 100)
            Buttons[2].frame = CGRect(x: 51, y: 650, width: 666, height: 100)
            Buttons[3].frame = CGRect(x: 51, y: 763, width: 666, height: 100)
            
            
            Buttons[0].titleLabel!.font = UIFont(name: "Noteworthy", size: 23)
            Buttons[1].titleLabel!.font = UIFont(name: "Noteworthy", size: 23)
            Buttons[2].titleLabel!.font = UIFont(name: "Noteworthy", size: 23)
            Buttons[3].titleLabel!.font = UIFont(name: "Noteworthy", size: 23)
            

            QLabel.font = QLabel.font.withSize(40)
            
            
            circleImage.frame = CGRect(x: circleImage.frame.origin.x, y: circleImage.frame.origin.y, width: 50, height: 50)
            QuestionLabel.frame = CGRect(x: circleImage.frame.origin.x, y: circleImage.frame.origin.y, width: 50, height: 50)

            coinLabel.frame = CGRect(x: coinLabel.frame.origin.x - 30, y: 870, width: coinLabel.frame.size.width,height: coinLabel.frame.size.height)
            Lives.frame = CGRect(x: Lives.frame.origin.x + 30, y: 870, width: Lives.frame.size.width,height: Lives.frame.size.height )
            
            coinLabel.font = coinLabel.font.withSize(23)
            Lives.font = Lives.font.withSize(23)
            
            
            coinReward.frame = CGRect(x: 350, y: 100, width: coinReward.frame.size.width + 30, height: coinReward.frame.size.height)
            coinReward.font = coinReward.font.withSize(23)

        
        }
        
        
        if DeviceType.IS_IPHONE_4_OR_LESS {
            
            coinReward.frame = CGRect(x: coinReward.frame.origin.x, y: 150, width: 80, height: 20)

        }
        
        
        if DeviceType.IS_IPHONE_5 {
            print("this is a iphone 5 or 5s")

            circleImage.frame = CGRect(x: circleImage.frame.origin.x, y: circleImage.frame.origin.y, width: 30, height: 30)
            QuestionLabel.frame = CGRect(x: circleImage.frame.origin.x - 10, y: circleImage.frame.origin.y - 10, width: 50, height: 50)

            
        }else{
            
            
            buttonToText.isActive = false
        }

        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        coinReward.text = "+ \(money) 50"
        coinReward.isHidden = true
        
        
        let options = HZBannerAdOptions()
        HZBannerAd.placeBanner(in: self.view, position: HZBannerPosition.bottom, options:options, success: {
            (banner) in
            }, failure: {
                (error) in print("Error is \(error)")
            }
        )
        
        
        
        completedGame = defaults.bool(forKey: "completedGame")
        coins = defaults.integer(forKey: "coins")

        
        comp5 = defaults.bool(forKey: "comp5")
        comp15 = defaults.bool(forKey: "comp15")

        
        Buttons[0].isExclusiveTouch = true;
        Buttons[1].isExclusiveTouch = true;
        Buttons[2].isExclusiveTouch = true;
        Buttons[3].isExclusiveTouch = true;
        


        
        QuestionLabel.text = "\(QNumber)"
        QuestionLabel.layer.zPosition = 101


        if completedGame == true{
            
            coinLabel.text = "\(money) ∞"

            
        }else{
            
            coinLabel.text = "\(money) \(coins)"

        }
        
        coinLabel.layer.zPosition = 101
 
        
        lifeNum = 3
        
        QuestionSaved = defaults.integer(forKey: "highScoreSaved")

        hasBeenThrough = defaults.bool(forKey: "hasBeen")
        
        if hasBeenThrough == true{
         
            
        }else{
            
            QuestionSaved = 1
            defaults.set(QuestionSaved, forKey: "highScoreSaved")
        }
   
        complete1 = defaults.bool(forKey: "levelComplete1")
        complete2 = defaults.bool(forKey: "levelComplete2")
        complete3 = defaults.bool(forKey: "levelComplete3")
        complete4 = defaults.bool(forKey: "levelComplete4")
        
        
        
        levelDetect = defaults.integer(forKey: "detection")
   
        
        if QuestionSaved == 0{
            
            
            
        }else{
            
            
            QuestionSaved = QuestionSaved - 1
            defaults.set(QuestionSaved, forKey: "highScoreSaved")
            
        }
        
        

        
        Lives.text = "\(heart) \(lifeNum)"
        
        
        if levelDetect == 1{
            
            lvl1()
            
            }
        
        
        //20
        
        
        if levelDetect == 2 {
            
            lvl2()
    
        }
        //40
        
        if levelDetect == 3{
            
            lvl3()

        }
        
        //60
        
        if levelDetect == 4{
            lvl4()
            
    
        }
        
        if levelDetect == 5 {
            lvl5()

            
        }
        
                pickQuestion()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    func pickQuestion(){
        

        if QuestionSaved < 20{
            questionTravel()
            
        }

            
         else{
            
            
            win()
            QuestionSaved = 0
            defaults.set(0, forKey: "highScoreSaved")
            
            lifeNum = 3

            
        }
        
    }
    
    
    func BtnAnimation(_ i:Int){
        
        
        Buttons[i].transform = CGAffineTransform(scaleX: 0.3, y: 0.6)
        
        UIView.animate(withDuration: 2.0,
                                   delay: 0,
                                   usingSpringWithDamping: 0.2,
                                   initialSpringVelocity: 6.0,
                                   options: UIViewAnimationOptions.allowUserInteraction,
                                   animations: {
                                    self.Buttons[i].transform = CGAffineTransform.identity
            }, completion: nil)
        
    }
    
    
    @IBAction func Btn1(_ sender: AnyObject) {
    
        if AnswerNumber == 0{
            
            pickQuestion()
            

        }

            
        else{
 
      BtnAnimation(0)
            
            wrong()
        }
        
        
    }
    @IBAction func Btn2(_ sender: AnyObject) {
        if AnswerNumber == 1{
            
            pickQuestion()
            
        }
        else{
            
            
            BtnAnimation(1)

            
       wrong()

        }
        
        
    }
    @IBAction func Btn3(_ sender: AnyObject) {


        if AnswerNumber == 2{
            
            pickQuestion()
            
        }
        else{
            
            BtnAnimation(2)

            
       wrong()

        }
        
        
    }
    
    @IBAction func Btn4(_ sender: AnyObject) {
        
        if AnswerNumber == 3{
            
            pickQuestion()
            
        }
        else{
            
            
            BtnAnimation(3)

            
       wrong()

        }
        
        
    }
    
   

}

