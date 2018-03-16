//
//  ViewController.swift
//  Calculator
//
//  Created by GC on 3/11/18.
//  Copyright © 2018 Gong Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    var ans:Double = 0
    var mode:Int = 1
    var left:Double = 0
    var right:Double = 0
    var op:Int = 0
    var dot:Bool = false
    var dotFactor:Double = 0.1
    
    func input(i:Double) {
        if (mode == 1){
            if (!dot) {
                left = left * 10 + i
            } else {
                left = left + i * dotFactor
                dotFactor /= 10
            }
            label.text = "\(left)"
            
        } else if (mode == 2) {
            if (!dot) {
                right = right * 10 + i
            } else {
                right = right + i * dotFactor
                dotFactor /= 10
            }
            label.text = "\(right)"
        }
    }
    
    func opera(c:String) {
        mode = 2
        dot = false
        dotFactor = 0.1
        label.text = label.text! + " " + c + " "
    }
    
    func clear() {
        label.text = "\(ans)"
        mode = 1
        left = right
        right = 0
        dot = false
        dotFactor = 0.1
    }
    
    @IBAction func buttonSeven(_ sender: UIButton) {
        input(i:7.0)
    }
    
    @IBAction func buttonEight(_ sender: UIButton) {
        input(i:8.0)
    }
    
    
    @IBAction func buttonNine(_ sender: UIButton) {
        input(i:9.0)
    }
    
    
    @IBAction func buttonFour(_ sender: UIButton) {
        input(i:4.0)
    }
    
    @IBAction func buttonFive(_ sender: UIButton) {
        input(i:5.0)
    }
    
    
    @IBAction func buttonSix(_ sender: UIButton) {
        input(i:6.0)
    }
    
    
    @IBAction func buttonOne(_ sender: UIButton) {
        input(i:1.0)
    }
    
    @IBAction func buttonTwo(_ sender: UIButton) {
        input(i:2.0)
    }
    
   
    @IBAction func buttonThree(_ sender: UIButton) {
        input(i:3.0)
    }
    
    @IBAction func buttonZero(_ sender: UIButton) {
        input(i:0.0)
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
       
        clear()
    }

    @IBAction func buttonDot(_ sender: UIButton) {
        dot = true
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

