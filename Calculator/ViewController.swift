//
//  ViewController.swift
//  Calculator
//
//  Created by GC on 3/11/18.
//  Copyright © 2018 Gong Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var input: UILabel!
    @IBOutlet weak var output: UILabel!
    var ans:Double = 0
    var mode:Int = 0
    var left:Double = 0
    var right:Double = 0
    var leftStr:String = ""
    var rightStr:String = ""
    var opStr:String = ""
    var dot:Bool = false
    var dotFactor:Double = 0.1
    var negFactor:Double = 1;
    
    func displayInput() {
        input.text = leftStr + opStr + rightStr;
    }
    
    func getDigit(i:Double) {
        
        if (mode == 0){
            mode = 1
        } else if (mode == 2) {
            mode = 3;
        }
        
        if (mode == 1){
            if (!dot) {
                left = left * 10 + i
            } else {
                left = left + i * dotFactor
                dotFactor /= 10
            }
            leftStr = leftStr + String(format: "%.0f", i);
            
        } else if (mode == 3) {
            if (!dot) {
                right = right * 10 + i
            } else {
                right = right + i * dotFactor
                dotFactor /= 10
            }
            rightStr = rightStr + String(format: "%.0f", i);
        }
        
        displayInput()
        
    }
    
    func getOperator(c:String) {
        mode = 2
        dot = false
        dotFactor = 0.1
        displayInput()
    }
    
    func adjustLeft() {
        if (mode == 1) {
            left = left * negFactor;
        }
    }
    
    func clear() {
        input.text = ""
        output.text = "0"
        ans = 0
        mode = 0
        left = 0
        right = 0
        leftStr = ""
        rightStr = ""
        opStr = ""
        dot = false
        dotFactor = 0.1
        negFactor = 1
    }
    
    @IBAction func buttonAC(_ sender: UIButton) {
        clear();
    }
    
    
    @IBAction func buttonSeven(_ sender: UIButton) {
        getDigit(i:7)
    }
    
    @IBAction func buttonEight(_ sender: UIButton) {
        getDigit(i:8)
    }
    
    
    @IBAction func buttonNine(_ sender: UIButton) {
        getDigit(i:9)
    }
    
    
    @IBAction func buttonFour(_ sender: UIButton) {
        getDigit(i:4)
    }
    
    @IBAction func buttonFive(_ sender: UIButton) {
        getDigit(i:5)
    }
    
    
    @IBAction func buttonSix(_ sender: UIButton) {
        getDigit(i:6)
    }
    
    
    @IBAction func buttonOne(_ sender: UIButton) {
        getDigit(i:1)
    }
    
    @IBAction func buttonTwo(_ sender: UIButton) {
        getDigit(i:2)
    }
    
    
    @IBAction func buttonThree(_ sender: UIButton) {
        getDigit(i:3)
    }
    
    @IBAction func buttonZero(_ sender: UIButton) {
        getDigit(i:0)
    }
    
    @IBAction func buttonPlus(_ sender: UIButton) {
        if (mode == 1 || mode == 2){
            adjustLeft()
            opStr = " + "
            getOperator(c:"+")
        }
    }
    
    @IBAction func buttonMinus(_ sender: UIButton) {
        if (mode == 0) {
            negFactor = -1;
            leftStr = leftStr + "-";
            displayInput()
        }
        if (mode == 1 || mode == 2){
            adjustLeft()
            opStr = " - "
            getOperator(c:"-")
        }
    }
    
    @IBAction func buttonMulti(_ sender: UIButton) {
        if (mode == 1 || mode == 2){
            adjustLeft()
            opStr = " * "
            getOperator(c:"*")
        }
    }
    
    
    @IBAction func buttonDivide(_ sender: UIButton) {
        if (mode == 1 || mode == 2){
            adjustLeft()
            opStr = " / "
            getOperator(c:"/")
        }
    }
    
    @IBAction func buttonEqual(_ sender: UIButton) {
        if (opStr == " + ") {
            ans  = left + right
        } else if (opStr == " - ") {
            ans = left - right
        } else if (opStr == " * ") {
            ans = left * right
        } else if (opStr == " / ") {
            ans = left / right
        }
        output.text = "\(ans)"
    }
    
    @IBAction func buttonDot(_ sender: UIButton) {
        dot = true
        if (mode == 0 || mode == 1) {
            leftStr = leftStr + "."
        } else if (mode == 2 || mode == 3) {
            rightStr = rightStr + "."
        }
        displayInput()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

