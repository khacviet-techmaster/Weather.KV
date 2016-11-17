//
//  ViewController.swift
//  Weather
//
//  Created by khacviet on 11/15/16.
//  Copyright © 2016 khacviet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lbl_Background: UIImageView!
    
    @IBOutlet weak var lbl_Temp: UILabel!
    
    @IBOutlet weak var lbl_CorF: UILabel!
    
    
    @IBOutlet weak var lbl_City: UILabel!
    
    
    @IBOutlet weak var lbl_Quote: UILabel!
    
    var background = ["Blood","Moon","Sun"]
    
    var city = ["London", "Newyork", "Tokyo", "Hải Phòng"]
    
    var quote = ["Sao phải ngại thay đổi khi hôm nay đã khác ngày hôm qua rất nhiều?",
                 "Don't cry because it's over, smile because it happened.",
                 "So many books, so little time.",
                 "To be yourself in a world that is constantly trying to make you something else is the greatest accomplishment.",
                 "A friend is someone who knows all about you and still loves you.",
                 "Two things are infinite: the universe and human stupidity; and I'm not sure about the universe."]
    
    var isCel:Bool = true
    
    var tempC : Double = 0
    var tempF : Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    @IBAction func action_CtoF(sender: AnyObject)
    {
        isCel = !isCel
        
//        var currenTemp = Double(lbl_Temp.text!)!
//        print("0: \(currenTemp)")
        
        if isCel
        {
            tempC = Double((tempF - 32) / 1.8)
            lbl_Temp.text! = String(format: "%.1f", Double(tempC))
            lbl_CorF.text! = "C"
            print("1:  \(tempC)")
        }
        else
        {
            tempF = Double(tempC * 1.8 + 32)
            lbl_Temp.text! = String(format: "%.1f", Double(tempF))
            lbl_CorF.text! = "F"
            print("2:  \(tempF)")
        }
    }
  
    @IBAction func but_Refresh(sender: AnyObject)
    {
        let backgroundIndex = Int(arc4random_uniform(UInt32(background.count)))
        lbl_Background.image = UIImage.init(named: background[backgroundIndex])
        
        let cityIndex = Int(arc4random_uniform(UInt32(city.count)))
        lbl_City.text = city[cityIndex]
        
        let quotIndex = Int(arc4random_uniform(UInt32(quote.count)))
        lbl_Quote.text = quote[quotIndex]
        
        getTemp()
    }
    
    func getTemp() -> Void
    {
        let tempNumber = Double(randomTemp())
        lbl_Temp.text = String(format: "%.1f", tempNumber)
    }
    

    
    func randomTemp() -> Double
    {
        if isCel
        {
            tempC = Double(arc4random_uniform(18) + 14) + Double(arc4random()) / Double(INT32_MAX)
            return tempC
        }
        else
        {
           tempF = Double(arc4random_uniform(18) + 14) + Double(arc4random()) / Double(INT32_MAX) * 1.8 + 32
            return tempF
        }
    }
    
}

