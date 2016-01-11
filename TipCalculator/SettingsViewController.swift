//
//  SettingsViewController.swift
//  
//
//  Created by Vatyx on 1/10/16.
//
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var slidingToggleSwitch: UISwitch!
    
    @IBOutlet weak var maxPercent: UILabel!
    @IBOutlet weak var maxStepper: UIStepper!
    @IBOutlet weak var minPercent: UILabel!
    @IBOutlet weak var minStepper: UIStepper!
    @IBOutlet weak var greatPercent: UILabel!
    @IBOutlet weak var greatStepper: UIStepper!
    @IBOutlet weak var goodPercent: UILabel!
    @IBOutlet weak var goodStepper: UIStepper!
    @IBOutlet weak var okayPercent: UILabel!
    @IBOutlet weak var okayStepper: UIStepper!
    @IBOutlet weak var dislikedPercent: UILabel!
    @IBOutlet weak var dislikedStepper: UIStepper!
    @IBOutlet weak var awfulPercent: UILabel!
    @IBOutlet weak var awfulStepper: UIStepper!
    let defaults = NSUserDefaults.standardUserDefaults();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var temp = Int(defaults.doubleForKey("tipping_awful")*100)
        awfulPercent.text = "\(temp)%"
        
        temp = Int(defaults.doubleForKey("tipping_disliked")*100)

        dislikedPercent.text = "\(temp)%"
        
        temp = Int(defaults.doubleForKey("tipping_okay")*100)

        okayPercent.text = "\(temp)%"
        
        temp = Int(defaults.doubleForKey("tipping_good")*100)

        goodPercent.text = "\(temp)%"
        
        temp = Int(defaults.doubleForKey("tipping_great")*100)

        greatPercent.text = "\(temp)%"
        
        temp = Int(defaults.doubleForKey("slider_min")*100)

        minPercent.text = "\(temp)%"
        
        temp = Int(defaults.doubleForKey("slider_max")*100)

        maxPercent.text = "\(temp)%"
    }

    @IBAction func awfulAction(sender: UIStepper) {
        let defaults = NSUserDefaults.standardUserDefaults();
        defaults.setDouble(sender.value / 100, forKey: "tipping_awful");
        awfulPercent.text = "\(Int(sender.value))%"
    }
    
    @IBAction func dislikedAction(sender: UIStepper) {
        let defaults = NSUserDefaults.standardUserDefaults();
        defaults.setDouble(sender.value / 100, forKey: "tipping_disliked");
        dislikedPercent.text = "\(Int(sender.value))%"
    }
    
    @IBAction func greatAction(sender: UIStepper) {
        let defaults = NSUserDefaults.standardUserDefaults();
        defaults.setDouble(sender.value / 100, forKey: "tipping_great");
        greatPercent.text = "\(Int(sender.value))%"
    }
    
    @IBAction func okayAction(sender: UIStepper) {
        let defaults = NSUserDefaults.standardUserDefaults();
        defaults.setDouble(sender.value / 100, forKey: "tipping_okay");
        okayPercent.text = "\(Int(sender.value))%"
    }
    
    @IBAction func goodAction(sender: UIStepper) {
        let defaults = NSUserDefaults.standardUserDefaults();
        defaults.setDouble(sender.value / 100, forKey: "tipping_good");
        goodPercent.text = "\(Int(sender.value))%"
    }
    
    @IBAction func minAction(sender: UIStepper) {
        let defaults = NSUserDefaults.standardUserDefaults();
        defaults.setDouble(sender.value / 100, forKey: "slider_min");
        minPercent.text = "\(Int(sender.value))%"
    }
    
    @IBAction func maxAction(sender: UIStepper) {
        let defaults = NSUserDefaults.standardUserDefaults();
        defaults.setDouble(sender.value / 100, forKey: "slider_max");
        maxPercent.text = "\(Int(sender.value))%"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func whenToggled(sender: AnyObject) {
        
        let current = defaults.boolForKey("toggle_slider");
        defaults.setBool(!current, forKey:"toggle_slider");
        print(current);
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        let defaults = NSUserDefaults.standardUserDefaults();
        
        if defaults.boolForKey("toggle_slider")
        {
            slidingToggleSwitch.setOn(true, animated: false);
        }
        else
        {
            slidingToggleSwitch.setOn(false, animated: false);
        }
        
        var temp = Int(defaults.doubleForKey("tipping_awful")*100)
        awfulPercent.text = "\(temp)%"
        
        temp = Int(defaults.doubleForKey("tipping_disliked")*100)
        
        dislikedPercent.text = "\(temp)%"
        
        temp = Int(defaults.doubleForKey("tipping_okay")*100)
        
        okayPercent.text = "\(temp)%"
        
        temp = Int(defaults.doubleForKey("tipping_good")*100)
        
        goodPercent.text = "\(temp)%"
        
        temp = Int(defaults.doubleForKey("tipping_great")*100)
        
        greatPercent.text = "\(temp)%"
        
        temp = Int(defaults.doubleForKey("slider_min")*100)
        
        minPercent.text = "\(temp)%"
        
        temp = Int(defaults.doubleForKey("slider_max")*100)
        
        maxPercent.text = "\(temp)%"
    }


}
