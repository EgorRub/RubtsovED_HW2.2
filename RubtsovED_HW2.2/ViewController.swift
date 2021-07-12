//
//  ViewController.swift
//  RubtsovED_HW2.2
//
//  Created by Егор on 10.07.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewColor: UIView!
    
    @IBOutlet weak var labelRed: UILabel!
    @IBOutlet weak var labelGreen: UILabel!
    @IBOutlet weak var labelBlue: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewColor.layer.cornerRadius = 10
        
        redSlider.value = 1
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        redSlider.tintColor = .red
        
        greenSlider.value = 1
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        greenSlider.tintColor = .green
        
        blueSlider.value = 1
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
        blueSlider.tintColor = .blue
        
        labelRed.text = String(redSlider.value)
        labelGreen.text = String(greenSlider.value)
        labelBlue.text = String(blueSlider.value)
        
    }

    @IBAction func redSliderAction() {
        labelRed.text = String(format: "%.2f", redSlider.value)
        changeColor()
    }
    
    @IBAction func greenSliderAction() {
        labelGreen.text = String(format: "%.2f", greenSlider.value)
        changeColor()
    }
    
    @IBAction func blueSliderAction() {
        labelBlue.text = String(format: "%.2f", blueSlider.value)
        changeColor()
    }
    
    private func changeColor() {
        viewColor.backgroundColor = UIColor(
            red: CGFloat((redSlider.value)),
            green: CGFloat((greenSlider.value)),
            blue: CGFloat((blueSlider.value)),
            alpha: 1)
        
        }
    }
    

