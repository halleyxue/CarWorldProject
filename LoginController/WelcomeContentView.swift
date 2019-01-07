//
//  WelcomeContentView.swift
//  CarWorld
//
//  Created by yangxue_pc on 2018/12/21.
//  Copyright © 2018年 yangxue_pc. All rights reserved.
//

import UIKit

class WelcomeContentView: UIViewController {

    @IBOutlet var headingLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var contentImageView: UIImageView!
    @IBOutlet var forwardButton: UIButton!
    @IBOutlet var pageControl: UIPageControl!
    
    var index = 0
    var heading = ""
    var content = ""
    var imgFile = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headingLabel.text = heading
        contentLabel.text = content
        contentImageView.image = UIImage(named: imgFile)
        pageControl.currentPage = index
        switch index {
        case 0...1: forwardButton.setTitle("NEXT", for: .normal)
        case 2: forwardButton.setTitle("DONE", for: .normal)
        default:
            break
        }
    }

    @IBAction func nextButtonTapped(_ sender: UIButton) {
        switch index {
        case 0...1:
            let pageViewController = parent as! WelcomePageController
            pageViewController.forward(index: index)
        case 2:
//            dismiss(animated: true, completion: nil)
            if let pageViewController = storyboard?.instantiateViewController(withIdentifier: "LoginController") as? LoginViewController {
                present(pageViewController, animated: true, completion: nil)
            }
            
        default: break
        }
    }
}
