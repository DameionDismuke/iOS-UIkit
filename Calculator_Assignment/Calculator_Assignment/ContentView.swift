//
//  ContentView.swift
//  Calculator_Assignment
//
//  Created by Dameion Dismuke on 12/15/22.
//

import UIKit



class ContentView: UIContentView
{
    
    @IBOutlet weak var calculatorWorkings: UILabel!
    @IBOutlet weak var calculatorResults: UILabel!
    
    var  workings:String = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        clearAll()
    }
    
    func clearAll()
    {
        workings = ""
        calculatorWorkings.text = ""
        calculatorResults.text = ""
    }
    
    @IBAction func allClearTap(_sender: Any){
        clearAll()
    }
    @IBAction func backTap(_sender: Any){
        if(!workings.isEmpty)
        {
            workings.removeLast()
            calculatorWorkings.text = workings
        }
    }
    
    func addToWorkings(value: String)
    {
        workings = workings + value
        calculatorWorkings.text = workings
    }
    
    @IBAction func percentTap(_sender: Any){
        addToWorkings(value: "%")
    }
    @IBAction func divideTap(_sender: Any){
        addToWorkings(value: "/")
    }
    @IBAction func timesTap(_sender: Any){
        addToWorkings(value: "*")
    }
    @IBAction func minusTap(_sender: Any){
        addToWorkings(value: "-")
    }
    @IBAction func plusTap(_sender: Any){
        addToWorkings(value: "+")
    }
    @IBAction func decimalTap(_sender: Any){
        addToWorkings(value: ".")
    }
    @IBAction func zeroTap(_sender: Any){
        addToWorkings(value: "0")
    }
    @IBAction func oneTap(_sender: Any){
        addToWorkings(value: "1")
    }
    @IBAction func twoTap(_sender: Any){
        addToWorkings(value: "2")
    }
    @IBAction func threeTap(_sender: Any){
        addToWorkings(value: "3")
    }
    @IBAction func fourTap(_sender: Any){
        addToWorkings(value: "4")
    }
    @IBAction func fiveTap(_sender: Any){
        addToWorkings(value: "5")
    }
    @IBAction func sixTap(_sender: Any){
        addToWorkings(value: "6")
    }
    @IBAction func sevenTap(_sender: Any){
        addToWorkings(value: "7")
    }
    @IBAction func eightTap(_sender: Any){
        addToWorkings(value: "8")
    }
    @IBAction func nineTap(_sender: Any){
        addToWorkings(value: "9")
    }
    @IBAction func equalsTap(_sender: Any){
        
        if(validInput())
        {
            let checkedWorkingsForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: Workings)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            calculatorResults.text = resultString
        }
        else
        {
            let alert = UIAlertController(title:"Invalid Input", message:"Calculator unable to do math based on input", preferredStyle: .alert )
            alert.addAction(UIAlertAction(title:"Okay", style: .default))
            self.present(alert, animated:true, completion:nil)
        }
    }
    
    func validInput() -> Bool
    {
        
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in workings
        {
            if(specialCharacter(char: char))
            {
                funcCharIndexes.append(count)
            }
            count += 1
        }
        
        var previous: Int = -1
        
        for index in funcCharIndexes
        {
            if(index==0)
            {
                return false
            }
            if(index== workings.count - 1)
            {
                return false
            }
            if(previous != -1)
            {
                if(index - previous == 1)
                {
                    return false
                }
            }
            
        }
        
        return true
    }
    
    func specialCharacter(char: Character) -> Bool
    {
        if(char == "*")
        {
            return true
        }
        if(char == "/")
        {
            return true
        }
        if(char == "+")
        {
            return true
        }
        return false
    }
    
    
    func formatResult(result: Double) -> String
    {
        if(result.truncatingRemainder(dividingBy: 1) == 0)
        {
        return String(format: "%.0f", result)
        }
        else
        {
            return String(format: "%.2f", result)
        }
    }
    
}

