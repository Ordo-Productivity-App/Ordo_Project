//
//  ViewController.swift
//  OrdoApp
//
//  Created by Brandon Stillword on 11/13/21.
//

import UIKit
import Parse
class ViewController: UIViewController {

    @IBOutlet weak var user: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var runMakeUser: UIButton!
    
    @IBAction func callMakeUser(_ sender: Any) {
        let userText = user.text
        let myObj = PFObject(className:"FirstClass")
        myObj["message"] = userText
        myObj.saveInBackground { (success, error) in
            if(success){
                print("This actually worked")
            } else {
                print("You failed miserably")
            }
        }    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        testParseConnection()
    }

    func testParseConnection(){
            let myObj = PFObject(className:"FirstClass")
            myObj["message"] = "Hey ! First message from Swift. Parse is now connected"
            myObj.saveInBackground { (success, error) in
                if(success){
                    print("You are connected!")
                }else{
                    print("An error has occurred!")
                }
            }
        }

}

