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
    var mode:Int = 1
    var left:Double = 0
    var right:Double = 0
    var op:Int = 0
    var dot:Bool = false
    var dotFactor:Double = 0.1
    
    func getInput(i:Double) {
        if (mode == 1){
            if (!dot) {
                left = left * 10 + i
            } else {
                left = left + i * dotFactor
                dotFactor /= 10
            }
           // input.text = "\(left)"
            
        } else if (mode == 2) {
            if (!dot) {
                right = right * 10 + i
            } else {
                right = right + i * dotFactor
                dotFactor /= 10
            }
        }
        input.text = input.text! + String(format: "%.0f", i);
    }
    
    func opera(c:String) {
        mode = 2
        dot = false
        dotFactor = 0.1
        input.text = input.text! + " " + c + " "
    }
    
    func clear() {
        input.text = ""
        output.text = "0"
        mode = 1
        left = 0
        right = 0
        dot = false
        dotFactor = 0.1
    }
    
    @IBAction func buttonAC(_ sender: UIButton) {
        clear();
    }
    
    
    @IBAction func buttonSeven(_ sender: UIButton) {
        getInput(i:7)
    }
    
    @IBAction func buttonEight(_ sender: UIButton) {
        getInput(i:8)
    }
    
    
    @IBAction func buttonNine(_ sender: UIButton) {
        getInput(i:9)
    }
    
    
    @IBAction func buttonFour(_ sender: UIButton) {
       getInput(i:4)
    }
    
    @IBAction func buttonFive(_ sender: UIButton) {
        getInput(i:5)
    }
    
    
    @IBAction func buttonSix(_ sender: UIButton) {
        getInput(i:6)
    }
    
    
    @IBAction func buttonOne(_ sender: UIButton) {
        getInput(i:1)
    }
    
    @IBAction func buttonTwo(_ sender: UIButton) {
       getInput(i:2)
    }
    
   
    @IBAction func buttonThree(_ sender: UIButton) {
        getInput(i:3)
    }
    
    @IBAction func buttonZero(_ sender: UIButton) {
        getInput(i:0)
    }
    
    @IBAction func buttonPlus(_ sender: UIButton) {
        op = 1
        opera(c:"+")
    }
    
    @IBAction func buttonMinus(_ sender: UIButton) {
        op = 2
        opera(c:"-")
    }
    
    @IBAction func buttonMulti(_ sender: UIButton) {
        op = 3
        opera(c:"*")
    }
    
    
    @IBAction func buttonDivide(_ sender: UIButton) {
        op = 4
        opera(c:"/")
    }
    
    @IBAction func buttonEqual(_ sender: UIButton) {
        if (op == 1) {
            ans  = left + right
        } else if (op == 2) {
            ans = left - right
        } else if (op == 3) {
            ans = left * right
        } else if (op == 4) {
            ans = left / right
        }
        output.text = "\(ans)"
    }

    @IBAction func buttonDot(_ sender: UIButton) {
        dot = true
        input.text = input.text! + "."
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

