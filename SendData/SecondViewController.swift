

import UIKit

class SecondViewController: UIViewController {
    let redButton = UIButton(frame: CGRect(x: 100, y: 300, width: 100, height: 50))
    let orangeButton = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
    var textcolor: String?
    var firstVC: FirstViewController?
    var completion: ((String) -> ())?
    //delegate
    var colorDelegate: ColorDelegate?
    
    @IBOutlet weak var textLabel: UILabel!
    
    //callback
    private func getDataAndBack() {
        guard let tmp = textcolor, tmp != "" else {
            completion?("no data")
            navigationController?.popViewController(animated: true)
            return
        }
        completion?(tmp)
        navigationController?.popViewController(animated: true)
    }
    
    
    
    //NotificationCenter
    let dictionary  = ["color1": "Orange", "color2": "Red"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        orangeButton.backgroundColor = .orange
        orangeButton.setTitle("Start", for: .normal)
        orangeButton.addTarget(self, action: #selector(OrangeButtonClick), for: .touchUpInside)
        self.view.addSubview(orangeButton)
        
        redButton.backgroundColor = .red
        redButton.setTitle("Start", for: .normal)
        redButton.addTarget(self, action: #selector(RedButtonClick), for: .touchUpInside)
        self.view.addSubview(redButton)
        
    }
    @IBAction func RedButtonClick(_ sender: UIButton) {
        textcolor = "Red"
        //completion?(textcolor!)
        print("Red Button clicked")
        
        //callback
        //getDataAndBack()
        
        //NotificationCenter
        //NotificationCenter.default.post(name: NSNotification.Name(rawValue: "notificationFromSecondControllerRed"), object: nil, userInfo: dictionary)
        
        //delegate
        colorDelegate?.update(text: textcolor!)
        
        navigationController?.popViewController(animated: true)
    }
    @IBAction func OrangeButtonClick(_ sender: UIButton) {
        textcolor = "Orange"
        //completion?(textcolor!)
        print("Orange Button clicked")
        
        //callback
        //getDataAndBack()
        
        //NotificationCenter
        //NotificationCenter.default.post(name: NSNotification.Name(rawValue: "notificationFromSecondControllerOrange"), object: nil, userInfo: dictionary)
        
        //delegate
        colorDelegate?.update(text: textcolor!)
        
        navigationController?.popViewController(animated: true)
    }
}
