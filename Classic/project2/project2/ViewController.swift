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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countries += ["estonia.png", "france.png", "germany.png", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        btns += [btn1,btn2,btn3]
        askQuestion()
    }
    
    func askQuestion() {
        for index in 0..<3 {
            let btn = btns[index]
            let image = UIImage(named: countries[index])
            btn.setImage(image, for: .normal)
            btn.layer.borderWidth = 1
            btn.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
}

