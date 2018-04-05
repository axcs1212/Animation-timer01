//
//  ViewController.swift
//  Animation timer01
//
//  Created by D7703_23 on 2018. 4. 5..
//  Copyright © 2018년 D7703_23. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var imgCounter: UILabel!
    var counter = 1
    var change = 1
    var check = false
    
    var mytimer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        imgCounter.text = String(counter)
    }


    @IBAction func play(_ sender: Any) {
        if change == 1{
        mytimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(animation), userInfo: nil, repeats: true)
        change = 0
        }
        else{
        mytimer.invalidate()
        change = 1
        }
    }
    @IBAction func stop(_ sender: Any) {
         mytimer.invalidate()
    }
    @objc func animation(){
        //카운트가 5일때 1로 돌아가면서 타이머가 돌아감
        //  if counter == 5{
        //      counter = 1
        //  } else {
        //      counter = counter + 1
        //  }
        //카운트가1일땐 증가하다가 5를만나면 내려가면서 타이머가돌아감
        if counter == 5 {
            check = false
        } else if counter == 1 {
            check = true
        }
        if check == true {
            counter = counter + 1
        } else if check == false{
            counter = counter - 1
        }
        myImageView.image = UIImage(named: "frame\(counter).png")
        imgCounter.text = String(counter)
    }
    
}

