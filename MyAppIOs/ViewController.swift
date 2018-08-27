//
//  ViewController.swift
//  MyAppIOs
//
//  Created by Nelson Jaimes Gonzales on 25/08/18.
//  Copyright © 2018 Nelson Jaimes Gonzales. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnValide: UIButton!
    @IBOutlet weak var lbIntent: UILabel!
    @IBOutlet weak var tfNumber: UITextField!
    @IBOutlet weak var lbMessage: UILabel!
    var ramdonNumber = ""
    var intents = 0
    
    @IBAction func btnValide(_ sender: Any) {
        if tfNumber.text == ramdonNumber{
            self.view.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
            showAlertDialog(content: "Felicidades, Ganaste!!")
        }else{
            if(intents == 1){
                self.view.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
                intents = 0
                lbIntent.text = String(intents)
                showAlertDialog(content: "Agostaste tus 5 intentos")
            }else{
                intents -= 1
                lbIntent.text = String(intents)
                tfNumber.text = ""
                lbMessage.text = "Fallaste, intenta de nuevo"
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       setVAlues()
    }
    
    func setVAlues(){
        ramdonNumber = String(arc4random_uniform(10))
        print(ramdonNumber)
        intents = 5
        lbIntent.text = String(intents)
        tfNumber.text = ""
        lbMessage.text = "Ingresa un número del 0-9"
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    func showAlertDialog(content:String){
        let alert = UIAlertController(title: content, message: "", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Juegar de nuevo", style: .default) { (UIAlertAction) in
            self.setVAlues()
        }
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }
}

