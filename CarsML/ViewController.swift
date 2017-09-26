//
//  ViewController.swift
//  CarsML
//
//  Created by Randall Dani Barrientos Alva on 24/9/17.
//  Copyright © 2017 Randall Dani Barrientos Alva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var modelSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var kmsLabel: UILabel!
    @IBOutlet weak var kmsSlider: UISlider!
    @IBOutlet weak var extrasSwitch: UISwitch!
    @IBOutlet weak var statusSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    let cars = Cars()
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Custom spacing: podemos decirle que queremos 25 pixeles de espacios despues del elemento modelsegmentedcontrol.
        self.stackView.setCustomSpacing(25, after: self.modelSegmentedControl)
        self.stackView.setCustomSpacing(25, after: self.modelSegmentedControl)
        self.stackView.setCustomSpacing(25, after: self.extrasSwitch)
        self.stackView.setCustomSpacing(25, after: self.kmsSlider)
        self.stackView.setCustomSpacing(50, after: self.statusSegmentedControl)
        //Hacemos el calculo nada mas iniciar la app
        self.calculateValue()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Action to calculate the price
    
    @IBAction func calculateValue() {
        
        // Paso 1: Formatear el valor del slider
        // Este metodo no recibe parametros y será llamado por varios UI a la vez
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        //No queremos decimales
        formatter.maximumFractionDigits = 0
        
        let formattedkms = formatter.string(for: self.kmsSlider.value) ?? "0"
        self.kmsLabel.text = "Kilometraje: \(formattedkms)"
        
        // # Paso 1
        
        
        // Paso 2
        
        if let prediction = try? self.cars.prediction(modelo: Double(self.modelSegmentedControl.selectedSegmentIndex), extras: self.extrasSwitch.isOn ? Double(1.0) : Double(0.0), kilometraje: Double(self.kmsSlider.value), estado: Double(self.statusSegmentedControl.selectedSegmentIndex)){
            
            let clampvalue = max(500, prediction.price)
            
            
            formatter.numberStyle = .currency
            
            self.priceLabel.text = formatter.string(for: clampvalue)
        }else{
            self.priceLabel.text = "Error"
        }
        
        
        
        
    }
    
    // # Action to calculate the price
}

