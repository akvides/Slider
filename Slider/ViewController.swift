//
//  ViewController.swift
//  Slider
//
//  Created by Василий Полторак on 04.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redIndicatoreLabel: UILabel!
    @IBOutlet weak var greenIndicatoreLabel: UILabel!
    @IBOutlet weak var blueIndicatoreLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 18
        
        changeLabel(redIndicatoreLabel, value: CGFloat(round(redSlider.value * 100)) / 100)
        changeLabel(greenIndicatoreLabel, value: CGFloat(round(greenSlider.value * 100)) / 100)
        changeLabel(blueIndicatoreLabel, value: CGFloat(round(blueSlider.value * 100)) / 100)
    }

    @IBAction func ChangeColor(_ sender: UISlider) {
        
        let sliderValue = CGFloat(sender.value)
        
        let redColorValue = CGFloat(redSlider.value)
        let greenColorValue = CGFloat(greenSlider.value)
        let blueColorValue = CGFloat(blueSlider.value)
        
        switch sender.restorationIdentifier {
            
        case redSlider.restorationIdentifier:
            changeLabel(redIndicatoreLabel, value: round(sliderValue * 100) / 100)
            changeBackgroundColor(red: sliderValue, green: greenColorValue, blue: blueColorValue)
            
        case greenSlider.restorationIdentifier:
            changeLabel(greenIndicatoreLabel, value: round(sliderValue * 100) / 100)
            changeBackgroundColor(red: redColorValue, green: sliderValue, blue: blueColorValue)
            
        default:
            changeLabel(blueIndicatoreLabel, value: round(sliderValue * 100) / 100)
            changeBackgroundColor(red: redColorValue, green: greenColorValue, blue: sliderValue)
            
        }
    }
    
}

// MARK: Change background color

extension ViewController {
    
    private func changeBackgroundColor(red: CGFloat, green: CGFloat, blue: CGFloat) {
        
        colorView.backgroundColor = UIColor(
            displayP3Red: red,
            green: green,
            blue: blue,
            alpha: 1
        )
    }
}

// MARK: Change indicatore label

extension ViewController {
    
    private func changeLabel(_ label: UILabel, value: CGFloat) {
        
        switch value {
            
        case 0.0,
            0.1,
            0.2,
            0.3,
            0.4,
            0.5,
            0.6,
            0.7,
            0.8,
            0.9,
            1.0:
            label.text = "\(value)0"
            
        default:
            label.text = "\(value)"
            
        }
    }
}

