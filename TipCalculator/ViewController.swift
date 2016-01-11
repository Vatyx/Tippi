//
//  ViewController.swift
//  TipCalculator
//
//  Created by Vatyx on 1/6/16.
//  Copyright © 2016 Vatyx. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var costTextField: UITextField!
    @IBOutlet weak var tippingOptions: UISegmentedControl!
    @IBOutlet weak var tippingSegmentControl: UISegmentedControl!
    @IBOutlet weak var tippingpercentageLabel: UILabel!
    @IBOutlet weak var tippingactualLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var splitTwoTotalLabel: UILabel!
    @IBOutlet weak var splitThreeTotalLabel: UILabel!
    @IBOutlet weak var splitFourTotalLabel: UILabel!
    
    @IBOutlet weak var tippingSliderMax: UILabel!
    @IBOutlet weak var tippingSliderMin: UILabel!
    @IBOutlet weak var tippingSlider: UISlider!
    var tippingPercentages = [0.07, 0.10, 0.15, 0.18, 0.20];
    var slidingMin = 0.05;
    var slidingMax = 0.50;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = NSUserDefaults.standardUserDefaults();
        defaults.setDouble(0.07, forKey: "tipping_awful");
        defaults.setDouble(0.10, forKey: "tipping_disliked");
        defaults.setDouble(0.15, forKey: "tipping_okay");
        defaults.setDouble(0.18, forKey: "tipping_good");
        defaults.setDouble(0.20, forKey: "tipping_great");
        
        defaults.setDouble(0.05, forKey: "slider_min");
        defaults.setDouble(0.50, forKey: "slider_max");
        
        defaults.setBool(false, forKey:"toggle_slider");
        
        defaults.synchronize();
        
        costTextField.text = "$";
        tippingSegmentControl.selectedSegmentIndex = 2;
        tippingpercentageLabel.text = "\(Int(tippingPercentages[tippingOptions.selectedSegmentIndex] * 100))%";
        tippingactualLabel.text = "$0.00";
        totalLabel.text = "$0.00";
        splitTwoTotalLabel.text = "$0.00";
        splitThreeTotalLabel.text = "$0.00";
        splitFourTotalLabel.text = "$0.00";
        
        if !defaults.boolForKey("toggle_slider")
        {
            tippingSlider.hidden = true;
            tippingSliderMax.hidden = true;
            tippingSliderMin.hidden = true;
        }
        else
        {
            tippingOptions.hidden = true;
        }
        
        navigationController!.navigationBar.barTintColor = UIColor.whiteColor();
        navigationController!.navigationBar.tintColor = UIColor(red:46/255, green:230/255, blue:113/255, alpha:1);
        //	costTextField.becomeFirstResponder();
        costTextField.text = "$ ";
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditing(sender: AnyObject) {
        print("User change text field");
        
        let billAmountString = costTextField.text!;
        let billAmount = billAmountString.substringFromIndex(billAmountString.startIndex.advancedBy(1))._bridgeToObjectiveC().doubleValue;
        
        var tipPercentage:Double;
        if tippingOptions.hidden == false {
            tipPercentage = tippingPercentages[tippingOptions.selectedSegmentIndex];
        }
        else
        {
            tipPercentage = Double(tippingSlider.value) * (slidingMax - slidingMin) + slidingMin;
        }
        
        print(tipPercentage);
        let tip = billAmount * tipPercentage;
        let total = billAmount + billAmount + tip;
        
        tippingactualLabel.text = String(format: "$%.2f", tip);
        totalLabel.text = String(format: "$%.2f", total);
        tippingpercentageLabel.text = "\(Int(tipPercentage * 100))%";
        
        let total2 = total / 2;
        let total3 = total / 3;
        let total4 = total / 4;
        splitTwoTotalLabel.text = String(format: "$%.2f", total2);
        splitThreeTotalLabel.text = String(format: "$%.2f", total3);
        splitFourTotalLabel.text = String(format: "$%.2f", total4);
        
    }
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true);
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        let defaults = NSUserDefaults.standardUserDefaults();
        if !defaults.boolForKey("toggle_slider")
        {
            tippingSlider.hidden = true;
            tippingSliderMax.hidden = true;
            tippingSliderMin.hidden = true;
            
            tippingOptions.hidden = false;
        }
        else
        {
            tippingOptions.hidden = true;
            
            tippingSlider.hidden = false;
            tippingSliderMax.hidden = false;
            tippingSliderMin.hidden = false;
        }
        
        tippingPercentages[0] = defaults.doubleForKey("tipping_awful");
        tippingPercentages[1] = defaults.doubleForKey("tipping_disliked");
        tippingPercentages[2] = defaults.doubleForKey("tipping_okay");
        tippingPercentages[3] = defaults.doubleForKey("tipping_good");
        tippingPercentages[4] = defaults.doubleForKey("tipping_great");
        
        slidingMin = defaults.doubleForKey("slider_min");
        slidingMax = defaults.doubleForKey("slider_max");
        
        tippingSliderMin.text = "\(Int(defaults.doubleForKey("slider_min") * 100))%";
        tippingSliderMax.text = "\(Int(defaults.doubleForKey("slider_max") * 100))%";
        
        onEditing(self);
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated);
        print("view did appear");
    }

}
