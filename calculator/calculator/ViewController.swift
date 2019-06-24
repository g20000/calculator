//
//  ViewController.swift
//  calculator
//
//  Created by pragmus on 21/06/2019.
//  Copyright © 2019 pragmus. All rights reserved.
//

import UIKit
import Typist

class ViewController: UIViewController {

    @IBOutlet weak var textFieldExpression: UITextField!
    @IBOutlet weak var textFieldXPointRange: UITextField!
    @IBOutlet weak var constraintViewContent: NSLayoutConstraint!
    
    var expressionArray = Array<String>()
    
    var expressionProccessor = ExpressionProccessor()
    
    var varChar: String?
    
    let keyboard = Typist()
    
    //MARK: - Lyfecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareViews()
    }
    
    
    //MARK: - Prepare views
    
    private func prepareViews() {
        configureKeyboard()
    }

    private func configureKeyboard() {
        keyboard
            .on(event: .willChangeFrame, do: { (options) in
                let height = options.endFrame.height
                UIView.animate(withDuration: 0) {
                    self.constraintViewContent?.constant = max(0, height)
                    self.view.layoutIfNeeded()
                }
            })
            .on(event: .willHide, do: { (options) in
                UIView.animate(withDuration: options.animationDuration) {
                    self.constraintViewContent?.constant = 0
                    self.view.layoutIfNeeded()
                }
            })
            .start()
    }
    
    
    //MARK: - Actions
    
    @IBAction func onCalcButtonTouched(_ sender: Any) {
        view.endEditing(true)
        
        guard expressionProccessor.validateExpression(textFieldExpression.text!) else {
            func showAlert() {
                let actionController = UIAlertController(title: "Error", message: "Check expression", preferredStyle: .alert)
                actionController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(actionController, animated: true, completion: nil)
            }

            showAlert()
            return
        }
       
        let xPointRange = textFieldXPointRange.text?.trimmingCharacters(in: .whitespaces)
        expressionProccessor.functionRange = Int((xPointRange)!)!
        expressionProccessor.generateGraphPointsForFunction(textFieldExpression.text!)
    }
    
    
}

