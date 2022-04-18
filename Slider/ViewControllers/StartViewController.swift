//
//  StartViewController.swift
//  Slider
//
//  Created by Василий Полторак on 18.04.2022.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func updateColor(_ color: CGColor)
}

class StartViewController: UIViewController {

    private var backgroundColor: CGColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundColor = view.layer.backgroundColor
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! SettingsViewController
        vc.delegate = self
        
        if backgroundColor?.components?.count == 2 {
            vc.red = (backgroundColor?.components?[0])!
            vc.green = (backgroundColor?.components?[0])!
            vc.blue = (backgroundColor?.components?[0])!
        } else {
            vc.red = (backgroundColor?.components?[0])!
            vc.green = (backgroundColor?.components?[1])!
            vc.blue = (backgroundColor?.components?[2])!
        }
        
    }

}

extension StartViewController: SettingsViewControllerDelegate {
    
    func updateColor(_ color: CGColor) {
        view.layer.backgroundColor = color
        backgroundColor = color
    }
    
    
    
}
