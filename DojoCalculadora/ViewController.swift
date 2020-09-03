//
//  ViewController.swift
//  DojoCalculadora
//
//  Created by Cesar A. Tavares on 31/08/20.
//  Copyright © 2020 Cesar A. Tavares. All rights reserved.
//

import UIKit

@IBDesignable extension UIButton {
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}

@IBDesignable extension UILabel {
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}

extension Double {
    var clean: String {
       return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var labelMostrador: UILabel!
    var valor1: Double?
    var valor2: Double?
    var resultado: Double?
    var operador: Character?
    var indexVirgula: Bool = false
    var clicado: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func actionZero(_ sender: UIButton) {
        
        if labelMostrador.text == "0" || clicado == true {
            labelMostrador.text = "0"
        } else {
            labelMostrador.text = "\(labelMostrador.text!)0"
        }
        clicado = false
    }
    
    @IBAction func actionUm(_ sender: UIButton) {
        if labelMostrador.text == "0" || clicado == true {
            labelMostrador.text = "1"
        } else {
            labelMostrador.text = "\(labelMostrador.text!)1"
        }
        clicado = false
    }
    
    @IBAction func actionDois(_ sender: UIButton) {
        if labelMostrador.text == "0" || clicado == true {
            labelMostrador.text = "2"
        } else {
            labelMostrador.text = "\(labelMostrador.text!)2"
        }
        clicado = false
    }
    
    
    @IBAction func actionTres(_ sender: UIButton) {
        if labelMostrador.text == "0" || clicado == true {
            labelMostrador.text = "3"
        } else {
            labelMostrador.text = "\(labelMostrador.text!)3"
        }
        clicado = false
    }
    
    @IBAction func actionQuatro(_ sender: UIButton) {
        if labelMostrador.text == "0" || clicado == true {
            labelMostrador.text = "4"
        } else {
            labelMostrador.text = "\(labelMostrador.text!)4"
        }
        clicado = false
    }
    
    @IBAction func actionCinco(_ sender: UIButton) {
        if labelMostrador.text == "0" || clicado == true {
            labelMostrador.text = "5"
        } else {
            labelMostrador.text = "\(labelMostrador.text!)5"
        }
        clicado = false
    }
    
    @IBAction func actionSeis(_ sender: UIButton) {
        if labelMostrador.text == "0" || clicado == true {
            labelMostrador.text = "6"
        } else {
            labelMostrador.text = "\(labelMostrador.text!)6"
        }
        clicado = false
    }
    
    @IBAction func actionSete(_ sender: UIButton) {
        if labelMostrador.text == "0" || clicado == true {
            labelMostrador.text = "7"
        } else {
            labelMostrador.text = "\(labelMostrador.text!)7"
        }
        clicado = false
    }
    
    @IBAction func actionOito(_ sender: UIButton) {
        if labelMostrador.text == "0" || clicado == true {
            labelMostrador.text = "8"
        } else {
            labelMostrador.text = "\(labelMostrador.text!)8"
        }
        clicado = false
    }
    
    @IBAction func actionNove(_ sender: UIButton) {
        if labelMostrador.text == "0" || clicado == true {
            labelMostrador.text = "9"
        } else {
            labelMostrador.text = "\(labelMostrador.text!)9"
        }
        clicado = false
    }
    
    @IBAction func actionVirgula(_ sender: Any) {
        if labelMostrador.text == "0" || clicado == true {
            labelMostrador.text = "0."
            indexVirgula = true
        } else {
            while !indexVirgula {
                labelMostrador.text = "\(labelMostrador.text!)."
                indexVirgula = true
            }
        }
        clicado = false
    }
    
    
    @IBAction func actionSoma(_ sender: UIButton) {
        valor1 = Double(labelMostrador.text!)
        operador = "+"
        clicado = true
        indexVirgula = false
    }
    
    @IBAction func actionSubtrai(_ sender: UIButton) {
        valor1 = Double(labelMostrador.text!)
        operador = "-"
        clicado = true
        indexVirgula = false
    }
    
    @IBAction func actionMultiplica(_ sender: UIButton) {
        valor1 = Double(labelMostrador.text!)
        operador = "*"
        clicado = true
        indexVirgula = false
    }
    
    @IBAction func actionDivide(_ sender: UIButton) {
        valor1 = Double(labelMostrador.text!)
        operador = "/"
        clicado = true
        indexVirgula = false
    }
    
    @IBAction func actionPorcentagem(_ sender: UIButton) {
        if valor1 != nil {
            valor2 = Double(labelMostrador.text!)
        } else {
            valor1 = Double(labelMostrador.text!)
            if let valor1 = valor1 {
                resultado = valor1 / 100
                labelMostrador.text = String(resultado!.clean)
            }
            valor1 = nil
        }
        if let valor1 = valor1, let valor2 = valor2 {
            resultado = valor1 * (valor2 / 100)
            labelMostrador.text = String(resultado!.clean)
        }
        indexVirgula = false
    }
    
    @IBAction func actionIgual(_ sender: UIButton) {
        valor2 = Double(labelMostrador.text!)
        if let valor1 = valor1, let valor2 = valor2 {
            if operador == "+" {
                resultado = valor1 + valor2
                labelMostrador.text = String(resultado!.clean)
            } else if operador == "-" {
                resultado = valor1 - valor2
                labelMostrador.text = String(resultado!.clean)
            } else if operador == "*" {
                resultado = valor1 * valor2
                labelMostrador.text = String(resultado!.clean)
            } else if operador == "/" {
                if valor2 == 0 {
                    labelMostrador.text = "Erro"
                } else {
                    resultado = valor1 / valor2
                    labelMostrador.text = String(resultado!.clean)
                }
            } else {
                labelMostrador.text = String(valor2.clean)
        }
            clicado = true
            indexVirgula = false
        }
        valor1 = nil
        valor2 = nil
    }
    
    
    @IBAction func actionAC(_ sender: UIButton) {
        labelMostrador.text = "0"
        valor1 = nil
        valor2 = nil
        indexVirgula = false
        clicado = false
    }
    
}
