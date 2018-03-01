//
//  ViewController.swift
//  Conversores
//
//  Created by Luis Fernando Rodrigues  on 23/02/18.
//  Copyright © 2018 Luis Fernando Rodrigues . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblInit: UILabel!
    @IBOutlet weak var tfValue: UITextField!
    @IBOutlet weak var btUnit1: UIButton!
    @IBOutlet weak var btUnit2: UIButton!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var lbUnit: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAction(_ sender: UIButton) {
        if let text = lblInit.text {
        switch text {
            case "Temperatura":
                lblInit.text = "Peso"
                btUnit1.setTitle("Kilograma", for: .normal)
                btUnit2.setTitle("Libra", for: .normal)
            case "Peso":
                lblInit.text = "Moeda"
                btUnit1.setTitle("Real", for: .normal)
                btUnit2.setTitle("Dolar", for: .normal)
            case "Moeda":
                lblInit.text = "Distância"
                btUnit1.setTitle("Metro", for: .normal)
                btUnit2.setTitle("Kilômetro", for: .normal)
            default:
                lblInit.text = "Temperatura"
                btUnit1.setTitle("Celsius", for: .normal)
                btUnit2.setTitle("Farenheint", for: .normal)
            }
        }
     
        convert(nil)
    }
    
    @IBAction func convert(_ sender: UIButton?) {
        if let sender = sender {
            if sender == btUnit1{
                btUnit2.alpha = 0.5
            }else{
                btUnit1.alpha = 0.5
            }
            sender.alpha = 1.0
        }
        
        switch lblInit.text! {
            case "Temperaturo":
                calculateTemperature()
            case "Peso":
                calculateWeight()
            case "Moeda":
                colculateCurrency()
            default:
                calcDistance()
            }
        view.endEditing(true)
        let result = Double(lbResult.text!)!
        lbResult.text = String(format: "%.2f", result);
   }
    
    func calculateTemperature(){
        guard let temperature = Double(tfValue.text!) else {return}
        if btUnit1.alpha == 1{
             lbResult.text = "Fareheint"
             lbResult.text = String(temperature * 1.8 + 32.0)
        }else{
            lbResult.text = "Celcius"
            lbResult.text = String((temperature - 32.0) / 32.0)
        }
    }

    func calculateWeight(){
        guard let weight = Double(tfValue.text!) else {return}
        if btUnit1.alpha == 1 {
            lbUnit.text = "Kilograma"
            lbResult.text = String(weight  / 2.26)
        }else{
            lbUnit.text = "Libra"
            lbResult.text = String(weight * 2.246)
        }
    }

    func colculateCurrency(){
        guard let currency = Double(tfValue.text!) else {return}
        if btUnit1.alpha == 1{
            lbUnit.text = "Dolar"
            lbResult.text = String(currency / 3.5)
        }else{
            lbUnit.text = "Real"
            lbResult.text = String(currency * 3.5)
        }
    }

    func calcDistance(){
        guard let distance = Double(tfValue.text!) else {return}
        if btUnit1.alpha == 1{
            lbUnit.text = "Fareheint"
            lbResult.text = String(distance / 1000)
        }else{
            lbUnit.text = "Celcius"
            lbResult.text = String(distance * 100)
        }
    }
}

