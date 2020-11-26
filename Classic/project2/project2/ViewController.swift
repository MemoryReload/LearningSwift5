//
//  ViewController.swift
//  project2
//
//  Created by 何平 on 2020/11/26.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    
    var countries = [String]()
    var btns = [UIButton]()
    var score = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countries += ["estonia.png", "france.png", "germany.png", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        btns += [btn1,btn2,btn3]
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction? = nil) {
        
        countries.shuffle()
        
        for index in 0..<3 {
            let btn = btns[index]
            let image = UIImage(named: countries[index])
            btn.setImage(image, for: .normal)
            btn.layer.borderWidth = 1
            btn.layer.borderColor = UIColor.lightGray.cgColor
        }
        
        correctAnswer = Int.random(in: 0...2)
        title = countries[correctAnswer].uppercased()
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        var alertTitle: String
        if btns.firstIndex(of: sender as! UIButton) == correctAnswer  {
            alertTitle = "Right"
            score += 1
        }
        else{
            alertTitle = "Wrong"
            score -= 1
        }
        let alert = UIAlertController(title: alertTitle, message: "Your score is \(score)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion as (UIAlertAction) -> Void))
        self.present(alert, animated: true, completion: nil)
    }
}

