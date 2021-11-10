//
//  ViewController.swift
//  SendData
//
//  Created by Taras Kolesnyk on 09.11.2021.
//

import UIKit

protocol ColorDelegate: class {
    func update(text: String)
}

class FirstViewController: UIViewController, ColorDelegate {
    func update(text: String) {
        label.text = text
    }
   
    let goToSecondVCButt = UIButton(frame: CGRect(x: 100, y: 300, width: 150, height: 50))
    let label = UILabel(frame: CGRect(x: 200, y: 100, width: 200, height: 21))
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        label.center = CGPoint(x: 160, y: 285)
        label.textAlignment = .center
        label.text = "Color"
        self.view.addSubview(label)
        goToSecondVCButt.backgroundColor = .black
        goToSecondVCButt.setTitle("Go to 2ndVC", for: .normal)
        goToSecondVCButt.addTarget(self, action: #selector(GoToSecondViewControllerButton), for: .touchUpInside)
        self.view.addSubview(goToSecondVCButt)
        
        
        
        //NotificationCenter.default.addObserver(self, selector: #selector(gotNotification), name: NSNotification.Name(rawValue: "notificationFromSecondControllerOrange"), object: nil)
        
        //NotificationCenter.default.addObserver(self, selector: #selector(gotNotification2), name: NSNotification.Name(rawValue: "notificationFromSecondControllerRed"), object: nil)
    }
    @objc func gotNotification(notofication: Notification) {
        guard let userinfo  = notofication.userInfo else { return }
        guard let text  = userinfo["color1"] as? String else { return }
        label.text = text
    }
    @objc func gotNotification2(notofication: Notification) {
        guard let userinfo1  = notofication.userInfo else { return }
        guard let text2  = userinfo1["color2"] as? String else { return }
        label.text = text2
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        print("Appear")
        let secondVC = SecondViewController()
        
        //secondVC.colorDelegate = self
        
        /*secondVC.completion = {[weak self] text in
         guard let self = self else  { return }
         self.label.text = text*/
        
        
    }
    
    
    
    
    func setOrange() {
        label.text = "Orange"
    }
    func setRed() {
        label.text = "Red"
    }
    
    @objc func GoToSecondViewControllerButton(_ sender: UIButton){
        print("NextVC Button clicked")
        let secondViewController = SecondViewController()
        //callback
        secondViewController.completion = {
            text in
            self.label.text = text

        }
        //delegate
        //secondViewController.colorDelegate = self
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
}




