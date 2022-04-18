//
//  SettingsViewController.swift
//  Slider
//
//  Created by Василий Полторак on 18.04.2022.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    var red = CGFloat()
    var green = CGFloat()
    var blue = CGFloat()
    
    var delegate: SettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateColor(red: red, green: green, blue: blue)
        
        redSlider.value = Float(red)
        greenSlider.value = Float(green)
        blueSlider.value = Float(blue)

    }
    
    @IBAction func changeColorFromSlider() {
        updateColor(red: CGFloat(redSlider.value),
                    green: CGFloat(greenSlider.value),
                    blue: CGFloat(blueSlider.value))
    }
    
    private func updateColor(red: CGFloat, green: CGFloat, blue: CGFloat) {

        let color = UIColor(red: red,
                            green: green,
                            blue: blue,
                            alpha: 1.0)
        
        colorView.backgroundColor = color
        
        redTextField.text = String(format: "%.2f", red)
        greenTextField.text = String(format: "%.2f", green)
        blueTextField.text = String(format: "%.2f", blue)
        
        delegate.updateColor(color.cgColor)
    }
    

}
