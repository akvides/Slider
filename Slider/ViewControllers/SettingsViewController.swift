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
        
        redSlider.value = Float(red)
        greenSlider.value = Float(green)
        blueSlider.value = Float(blue)
        
        delegate.updateColor(color.cgColor)
        
    }
    
    private func presentAlertController() {
        let alertController = UIAlertController(title: "Не корректное значение",
                                                message: "В поле можно ввести только значение от 0 до 1",
                                                preferredStyle: .alert)
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addAction(cancelButton)
        
        view.endEditing(true)
        
        present(alertController, animated: true)
    }
    
    private func changeColorFromTextFields() {
        guard let red = redTextField.text, Float(red) != nil, Float(red)! <= 1.0 else {
            presentAlertController()
            redTextField.text = String(format: "%.2f", redSlider.value)
            return
        }
        guard let green = greenTextField.text, Float(green) != nil, Float(green)! <= 1.0 else {
            presentAlertController()
            greenTextField.text = String(format: "%.2f", greenSlider.value)
            return
        }
        guard let blue = blueTextField.text, Float(blue) != nil, Float(blue)! <= 1.0 else {
            presentAlertController()
            blueTextField.text = String(format: "%.2f", blueSlider.value)
            return
        }
        
        updateColor(red: CGFloat(Float(red)!),
                    green: CGFloat(Float(green)!),
                    blue: CGFloat(Float(blue)!))
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

}

extension SettingsViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        changeColorFromTextFields()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        changeColorFromTextFields()
        view.endEditing(true)
        return true
    }
}
